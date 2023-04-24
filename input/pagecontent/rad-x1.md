### 2:4.X1.1 Scope

This transaction is used to subscribe to receive events associated with a reporting session. A reporting session may include reporting on multiple reports, each of which has its own context.

### 2:4.X1.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

**Table 2:4.X1.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Subscriber | Requests a subscription to a reporting session | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
| Manager | Receives and manages subscription requests | Hub |
{: .grid}

### 2:4.X1.3 Referenced Standards

**FHIRcast**: [Subscribing to Events](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html)

### 2:4.X1.4 Messages

<div>
{%include rad-x1-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:4.X1.4-1: Interaction Diagram**

#### 2:4.X1.4.1 Subscription Request Message

The Subscriber sends a reporting session subscription request to the Manager. The Subscriber shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Subscriber. 

##### 2:4.X1.4.1.1 Trigger Events

A Subscriber uses this transaction when:
- It wants to start a new reporting session
- It wants to join an existing reporting session
- It wants to change the event filter for its existing subscription
- It wants to renew its existing subscription

##### 2:4.X1.4.1.2 Message Semantics

This message is a [FHIRcast Subscription Request](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html#subscription-request). The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The request shall have the payload with the parameters in the following table:

**Table 2:4.X1.4.1.2-1: Subscription Request Parameters**

| Field                 | Optionality | Type     | Description |
| ----------------------| ----------- | -------- | ------------|
|`hub.channel.type`     | Required    | *string* | The channel type of `websocket`.|
|`hub.mode`             | Required*    | *string* | The literal string `subscribe`.|
|`hub.topic`           | Required    | *string* | The identifier of the reporting session that the Subscriber wishes to subscribe to.| 
|`hub.events`           | Required*    | *string* | Shall include these five events, comma-separated: <br>`diagnosticreport-open`,<br>`diagnosticreport-close`,<br>`diagnosticreport-update`, <br>`diagnosticreport-select`,<br>`syncerror`<br><br>The Subscriber may include other events.|
|`hub.lease_seconds`    | Optional    | *number* | The positive integer indicating the number of seconds that the Subscriber wants the subscription to be active. |
|`hub.channel.endpoint` | Conditional | *string* | The WSS URL identifying an existing WebSocket subscription.<br><br>Required if the Subscriber wants to update or renew an existing subscription.|
 |`subscriber.name`      | Required*    | *string* | A unique identifier of the Subscriber.|
{: .grid}

> Note: Rows with '*' in the Optionality column have constraints different from baseline FHIRcast Subscription Request.

##### 2:4.X1.4.1.3 Expected Actions

The Manager shall receive and validate the message.

The Manager shall create the reporting session if the session ID specified in `hub.topic` does not exist.

The Manager shall add the Subscriber and its subscribed events for the session.

The Manager shall accept any events (including custom events not defined in FHIRcast [Event Library](https://build.fhir.org/ig/HL7/fhircast-docs/3_Events.html)) specified in the `hub.events` attributes.

If the Subscriber already exist in the session, then the Manager shall:
- Update the list of events subscribed by the Subscriber
- Update the expiry of the Subscriber's websocket connection

#### 2:4.X1.4.2 Subscription Response Message

The Manager sends a response message describing the request outcome to the Subscriber.

##### 2:4.X1.4.2.1 Trigger Events

The Manager receives a Subscribe to Reporting Session Request message.

##### 2:4.X1.4.2.2 Message Semantics

This message is a [FHIRcast Subscription Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html#subscription-response). The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The Manager shall return `400` Bad Request error if:
- `hub.channel.type` is not `websocket`
- `hub.topic` is empty
- `hub.mode` is `subscribe` and there is no `hub.events` or its value is empty
- `subscriber.name` is empty

The Manager may return other applicable HTTP error status codes.

##### 2:4.X1.4.2.3 Expected Actions

If the HTTP response code is `202` Accepted, the Subscriber shall extract the websocket WSS URL from `hub.channel.endpoint`.

The Subscriber may use the `hub.channel.endpoint` in a subsequent Connect to Notification Channel [RAD-X2] transaction and subsequent subscription update, renewal or Unsubscribe Session [RAD-X7] requests.

If the HTTP response code is 4xx or 5xx, then the Subscriber may adjust the request and retry.

### 2:4.X1.5 Security Considerations

See [IRA Security Considerations](volume-1.html#1xx5-ira-security-considerations).

The Subscriber which is a synchronizing application should authenticate and authorize the driving application before it accepts the provided `hub.topic` and `hub.url` and sends this request.

Local policy should consider what users and systems have permissions to subscribe to events and configure appropriately. More advanced implementations of the Manager might have logic to identify Subscribers that are requesting unnecessarily broad set of events.

#### 2:4.X1.5.1Security Audit Considerations

Managers that support the ATNA Profile shall audit this transaction.

This transaction corresponds to a Query Information ATNA Trigger Event.
