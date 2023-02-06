### 2:3.X1.1 Scope

This transaction is used to subscribe to a reporting session.

### 2:3.X1.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

**Table 2:3.X1.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Subscribes to a topic | Subscriber<br>Read-Only Subscriber |
| Receiver | Receives and manages subscription requests | Hub |
{: .grid}

### 2:3.X1.3 Referenced Standards

**FHIRcast**: [Subscribing to Events](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html)

### 2:3.X1.4 Messages

<div>
{%include rad-x1-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X1.4-1: Interaction Diagram**

#### 2:3.X1.4.1 Subscription Request Message

The Sender sends a reporting session subscription request to the Receiver. The Sender shall support sending such messages to more than one Receiver.

The Receiver shall support handling such messages from more than one Sender. 

##### 2:3.X1.4.1.1 Trigger Events

If the Sender is the driving application that starts the reporting session, then the Sender sends the request when it starts the reporting session.

If the Sender is a synchronizing application, then the Sender sends the request when it is launched by the driving application.

The Sender sends the request when it decided to change the subscribed events.

The Sender sends the request to renew an existing subscription.

##### 2:3.X1.4.1.2 Message Semantics

This message is an HTTP POST request. The Sender is the User Agent. The Receiver is the Origin Server.

The Sender shall perform an HTTP POST to the Receiver's base URL (as specified in `hub.url`). This request shall have a HTTP header `Content-Type` with the value `application/x-www-form-urlencoded`.

The request shall have the payload with the parameters in the following table:

**Table 2:3.X1.4.1.2-1: Subscription Request Parameters**

| Field                 | Optionality | Type     | Description |
| ----------------------| ----------- | -------- | ------------|
|`hub.channel.type`     | Required    | *string* | The channel type of `websocket`.|
|`hub.mode`             | Required    | *string* | The literal string `subscribe`.|
|`hub.topic`            | Required    | *string* | The identifier of the session that the Sender wishes to subscribe to.| 
|`hub.events`           | Required    | *string* | Shall include these five events, comma-separated: <br>`diagnosticreport-open`,<br>`diagnosticreport-close`,<br>`diagnosticreport-update`, <br>`diagnosticreport-select`,<br>`syncerror`<br><br>The Subscriber may include other events.|
|`hub.lease_seconds`    | Optional    | *number* | The positive integer indicating the number of seconds that the Sender wants the subscription to be active. |
|`hub.channel.endpoint` | Conditional | *string* | The WSS URL identifying an existing WebSocket subscription.|
|`subscriber.name`      | Required    | *string* | A unique identifier of the Subscriber.|
{: .grid}

If the Sender wants to re-request on the same topic (e.g. modify the subscribed events in `hub.events` or renew an existing subscription), the Sender shall specify `hub.channel.endpoint` with the value of the existing websocket URL.

##### 2:3.X1.4.1.3 Expected Actions

The Receiver shall receive and validate the message.

The Receiver shall return an error if the `hub.channel.type` is not `websocket`.

The Receiver shall return an error if the `hub.topic` is empty.

The Receiver shall return an error if the `hub.mode` is `subscribe` and there is no `hub.events` or its value is empty.

The Receiver shall return an error if the `subscriber.name` is empty.

The Receiver shall create the topic if the topic specified in `hub.topic` does not exist.

The Receiver shall add the Sender and its subscribed events for the topic.

The Receiver shall generate a cryptographically random, unique and unguessable identifier to be used for the websocket connection for the given Sender.

The Receiver shall associate the Sender to the websocket identifier.

If the Receiver receives a request from a Sender and the Sender already exists as a subscriber on the combination of `hub.topic` and `hub.channel.endpoint`, then the Receiver shall update the Sender-subscribed events in `hub.events` with the value from the request.

The Receiver may honor `hub.lease_seconds` specified in the request by the Sender, or it may specify its own default according to its policy.  When the subscription of the Sender expired according to `hub.lease_seconds`, the Receiver shall automatically unsubscribe the Sender on the associated `hub.topic`.

#### 2:3.X1.4.2 Subscription Response Message

The Receiver sends a response message describing the message outcome to the Sender.

##### 2:3.X1.4.2.1 Trigger Events

The Receiver receives a Subscribe to Reporting Session Request message.

##### 2:3.X1.4.2.2 Message Semantics

This message is an HTTP POST response. The Sender is the User Agent. The Receiver is the Origin Server.

If the Receiver successfully processed the request, the Receiver shall respond with an HTTP 202 “Accepted” response.

The HTTP body of the response shall consist of a JSON object containing an element name `hub.channel.endpoint` and a value for the WSS URL. The WebSocket WSS URL shall be cryptographically random, unique, and unguessable. 

If a Receiver refuses the request according to its policy or finds any errors in the request, it shall return an appropriate HTTP error response code (4xx or 5xx). In the event of an error, the Receiver may return a description of the error in the response body as plain text.

##### 2:3.X1.4.2.3 Expected Actions

If the HTTP response code is 202 "Accepted", the Sender shall extract the websocket WSS URL from `hub.channel.endpoint` and send Connect Notification Channel [RAD-X2] to this URL.

The Sender shall maintain this WSS URL for subsequent subscription update or renewal.

If the HTTP response code is 4xx or 5xx, then the Sender may adjust the request and retry.

### Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

The Sender which is a synchronizing application should authenticate and authorize the driving application before it accepts the provided `hub.topic` and `hub.url` and sends this request.

#### Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
