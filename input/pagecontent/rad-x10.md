### 2:3.X10.1 Scope

This transaction is used to distribute notification events to subscribers about synchronization errors detected by the Manager.

### 2:3.X10.2 Actors Roles

**Table 2:3.X10.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Subscriber | Receives and responses to error event | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
| Manager | Generates error event and notifies Subscribers | Hub |
{: .grid}

### 2:3.X10.3 Referenced Standards

**FHIRcast**: [Event Notification Errors](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-errors)

**FHIRcast**: [Hub Generated syncerror Events](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#hub-generated-syncerror-events)

**FHIRcast**: [Sync error Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html)

### 2:3.X10.4 Messages

<div>
{%include rad-x10-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X10.4-1: Interaction Diagram**

#### 2:3.X10.4.1 Error Notification Message

The Manager sends an error event to Subscribers indicating that it detected an error. Manager shall support sending such messages to more than one Subscribers.

The Subscriber shall support handling such messages from more than one Manager. 

##### 2:3.X10.4.1.1 Trigger Events

A Manager uses this transaction when:
- It receives a 4xx or 5xx error response from a Subscriber when executing the Send Context Event [RAD-X9](rad-x9.html) transaction.
- It does not receive a `2xx` response within a predetermined time frame from a Subscriber after the Manager sent a context event.
- It initially responded with a `202` Accepted when received a context or content change, but later rejects the request associated with the session.
- It detects a websocket connection issue with a Subscriber.

##### 2:3.X10.4.1.2 Message Semantics

This message is a [FHIRcast Event Notification Request](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-request) request. The Manager is the FHIRcast Hub. The Subscriber is the FHIRcast Subscriber.

The `event.context` shall conform to [SyncError Context](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html#context).

Per FHIRcast, the `issue[0].severity` of the `operationoutcome` context will be set to `information`.

The Manager shall set the `operationoutcome` `issue[0].details` as follow:
- `issue[0].details.coding[0].code` shall be the `event.id` of the event that triggered the error, or a generated ID for non-event triggered errors
- `issue[0].details.coding[1].code` shall be the `event`.`hub.event` of the event that triggered the error, or `syncerror` for non-event triggered errors
- `issue[0].details.coding[2].code` shall be the `subscriber.name` of the Subscriber that originated either the `syncerror`, or the event that triggered the error.

If the `syncerror` event was triggered by the Manager initially accepting the context or content change request (i.e. responded with a `202` Accepted respond) but later rejecting the request, then the Manager shall send the `syncerror` event only to the original requesting Subscriber.

##### 2:3.X10.4.1.3 Expected Actions

The Subscriber will handle the error according to its business logic. For example, display an error message to the user, retry the original request, or close the context.

#### 2:3.X10.4.2 Error Notification Response Message

##### 2:3.X10.4.2.1 Trigger Events

The Subscriber processes the error notification received.

##### 2:3.X10.4.2.2 Message Semantics

The message is a [FHIRcast Event Notification Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-response) request. The Subscriber is a FHIRcast Subscriber. The Manager is a FHIRcast Hub.

The Subscriber shall send a confirmation message back to the Manager using the established websocket connection.

##### 2:3.X10.4.2.3 Expected Actions

The Manager may resend the error notification if it does not receive a response from a Subscriber within a timeframe.

### 2:3.X10.5 Security Considerations

See [IRA Security Considerations](volume-1.html#1xx5-ira-security-considerations)

#### 2:3.X10.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
