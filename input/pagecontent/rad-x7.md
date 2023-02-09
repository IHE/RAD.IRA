### 2:3.X7.1 Scope

This transaction is used to unsubscribe to a FHIRcast session.

### 2:3.X7.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

**Table 2:3.X7.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Unsubscribes to a topic | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
| Manager | Manages unsubscription requests | Hub |
{: .grid}

### 2:3.X7.3 Referenced Standards

**FHIRcast**: [Unsubscribe](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html#unsubscribe)

### 2:3.X7.4 Messages

<div>
{%include rad-x7-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X7.4-1: Interaction Diagram**

#### 2:3.X7.4.1 Unsubscribe Session Request Message

The Sender sends a session unsubscription request to the Manager. The Sender shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Sender. 

##### 2:3.X7.4.1.1 Trigger Events

The Sender no longer wants to receive event notification on a given session from Manager.

##### 2:3.X7.4.1.2 Message Semantics

This message is a [FHIRcast Unsubscription Request](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html#unsubscribe). The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X7.4.1.3 Expected Actions

The Manager shall receive and validate the message.

The Manager shall return an error if the `hub.channel.type` is not `websocket`.

The Manager shall return an error if the `hub.topic` is empty.

The Manager shall return an error if the `hub.mode` is `unsubscribe` and there is no `hub.channel.endpoint` or its value is empty.

The Manager shall return an error if the `hub.channel.endpoint` does not match the websocket associated to the Sender.

The Manager shall remove the Sender and its subscribed events from the topic.

The Manager shall terminate the websocket connection delete the websocket identifier.

#### 2:3.X7.4.2 Unsubscribe Session Response Message

The Manager sends a response message describing the message outcome to the Sender.

##### 2:3.X7.4.2.1 Trigger Events

The Manager receives a Unsubscribe Session Request message.

##### 2:3.X7.4.2.2 Message Semantics

This message is a [FHIRcast Unsubscription Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html#unsubscribe). The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

If the Manager successfully processed the request, the Manager shall respond with an HTTP 202 “Accepted” response.

The HTTP body of the response shall consist of a JSON object containing an element name `hub.channel.endpoint` and a value for the WSS URL that is associated to the Sender.

##### 2:3.X7.4.2.3 Expected Actions

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
