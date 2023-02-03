### 2:3.X10.1 Scope

This transaction is used to send error events to all subscribers that subscribed to the events.

### 2:3.X10.2 Actors Roles

**Table 2:3.X10.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Send error event to Manager | Subscriber<br>Read-Only Subscriber |
| Manager | Send or generate error event to subscribers | Hub |
| Receiver | Receive error events | Subscriber<br>Read-Only Subscriber (See Note 1)|
{: .grid}

> Note 1: The Receiver Role is played by Subscribers subscribed to the event. This may include the original Sender as well as other Subscribers.

### 2:3.X10.3 Referenced Standards

**FHIRcast**: [Event Notification Errors](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-errors)

**FHIRcast**: [Hub Generated syncerror Events](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#hub-generated-syncerror-events)

**FHIRcast**: [Sync error Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html)

### 2:3.X10.4 Messages

<div>
{%include rad-x10-seq.svg%}
</div>

<div style="clear: left"/>

<div>
{%include rad-x10-manager-receiver-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X10.4-1: Interaction Diagram**

#### 2:3.X10.4.1 Report SyncError Request Message
The Sender sends an error event to the Manager indicated that it failed to process an accepted event. The Sender shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Sender. 

##### 2:3.X10.4.1.1 Trigger Events

The Sender failed to process an accepted event (e.g. The Sender accepted an event but failed to follow context within a configured timeout after reception).

##### 2:3.X10.4.1.2 Message Semantics

This message is an HTTP POST request. The Sender is the User Agent. The Manager is the Origin Server.

The Sender shall send a HTTP POST request to the Receiver `hub.url`.

The `Content-Type` of the request shall be `application/json`.

The body of the request shall have the attributes according to [Section 2.6.1 Request Context Change body](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body).

The `event.context` shall conform to [SyncError Context](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html#context).

The `issue[0].severity` of the `operationoutcome` context shall be set to `warning`.

If the Sender retries the same request due to a timeout, then the Sender shall use the same `event.id` such that the Manager can detect if it is a duplicate message.

If the Sender retries the same request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X10.4.1.3 Expected Actions

The Manager shall validate the request as follow:

* If `timestamp`, `id` or `event` are not set, then return an error
* If `event.context` does not include `operationoutcome`, then return an error
* If the context does not conform to the [SyncError Context](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html#context), then return an error
* if `event`.`hub.topic` is not a known topic, then return an error

The Manager shall broadcast the event to all subscribers that subscribed to the received event using Send Context Event [RAD-X9](rad-x9.html).

#### 2:3.X10.4.2 Report SyncError Response Message

##### 2:3.X10.4.2.1 Trigger Events

The Manager finished processing the Report SyncError request.

##### 2:3.X10.4.2.2 Message Semantics

If the Manager accepted the Report SyncError request, then the Manager shall send a 2xx HTTP status:

* If the Manager processed the request successfully, then it shall return 200 OK
* If the Manager processed the request asynchronously, then it may return 202 Accepted

If the Manager rejected the Report SyncError request, then the Manager shall return a 4xx or 5xx HTTP error response code.

##### 2:3.X10.4.2.3 Expected Actions

If the response is a success, then no further action expected.

If the response is an error, then the Sender may consider retrying the request.

#### 2:3.X10.4.3 Send SyncError Request Message

##### 2:3.X10.4.3.1 Trigger Events

The Manager received a SyncError event from a Sender.

The Manager received a 4xx or 5xx error response from a Receiver when executing the Send Context Event [RAD-X9](rad-x9.html) transaction.

The Manager did not receive a `2xx` response within a predetermined time frame from a Receiver after the Manager sent a context event. 

The Manager detected a websocket connection issue with a Receiver.

##### 2:3.X10.4.3.2 Message Semantics

This message is a websocket request. The Manager is the User Agent. The Receiver is the Origin Server.

The Manager shall send a websocket request to all Receivers subscribed to the `syncerror` event.

The body of the request shall have the attributes according to [Section 2.6.1 Request Context Change body](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body).

The `event.context` shall conform to [SyncError Context](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html#context).

The `issue[0].severity` of the `operationoutcome` context shall be set to `information`.

If the Manager initiated the `syncerror` event (instead of receiving a `syncerror` event from a Sender), then it:
- shall generate a new `event.id`
- shall leave the code value in `issue[0].details.coding[2]` (i.e. Subscriber's name) as empty

If the Manager initiated the `syncerror` event because it detected a websocket connection issue with the Receiver, then the Manager shall unsubscribe the Receiver and drop the websocket connection.

> Note: In this case, the Manager shall only send `syncerror` event to the affected Receiver and not broadcast the event to other Receivers that subscribed to `syncerror` event.

##### 2:3.X10.4.3.3 Expected Actions

The Receiver shall report the error according to its business logic. For example, display an error message to the user.

The error being reported shall include the following attributes from the `operationoutcome` context:
- The id of the event from `issue[0].details.coding[0]`
- The name of the event from `issue[0].details.coding[1]`
- The Subscriber's name that originated the `syncerror` event from `issue[0].details.coding[2]`

#### 2:3.X10.4.4 Send SyncError Response Message

##### 2:3.X10.4.4.1 Trigger Events

The Receiver accepted or rejected the event received.

##### 2:3.X10.4.4.2 Message Semantics

The Receiver shall send a confirmation message back to the Manager using the established websocket connection.

The Receiver shall include `id` and `status` parameters as defined in [Section 2.5.2 Event Notification Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-response) in the confirmation message.

The `id` shall be the `id` from the corresponding received event.

The `status` shall be `200` OK if the Receiver successfully processed the event.

##### 2:3.X10.4.4.3 Expected Actions

The Manager has no further required action.

### 2:3.X10.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X10.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
