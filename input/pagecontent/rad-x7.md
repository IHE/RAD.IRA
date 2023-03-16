### 2:3.X7.1 Scope

This transaction is used to unsubscribe from a FHIRcast session.

### 2:3.X7.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

**Table 2:3.X7.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Subscriber | Unsubscribes from a session | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
| Manager | Removes subscriber subscription | Hub |
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

The Subscriber sends a unsubscribe request to the Manager. The Subscriber shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Subscriber. 

##### 2:3.X7.4.1.1 Trigger Events

The Subscriber no longer wants to receive event notification on a given session from Manager.

##### 2:3.X7.4.1.2 Message Semantics

This message is a [FHIRcast Unsubscription Request](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html#unsubscribe). The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X7.4.1.3 Expected Actions

The Manager shall receive and validate the message. See 2:3.X7.4.2.2 for error conditions.

Per FHIRcast, the Manager will remove the Subscriber from all event subscriptions in this session.

The Manager shall terminate the websocket connection and delete the websocket identifier. The Manager shall not reuse the websocket identifier for other future subscriptions.

#### 2:3.X7.4.2 Unsubscribe Session Response Message

The Manager sends a response message describing the message outcome to the Subscriber.

##### 2:3.X7.4.2.1 Trigger Events

The Manager receives a Unsubscribe Session Request message.

##### 2:3.X7.4.2.2 Message Semantics

This message is a [FHIRcast Unsubscription Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html#unsubscribe). The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

If the Manager successfully processed the request, the Manager shall respond with an HTTP 202 “Accepted” response.

The Manager shall return `400` Bad Request error if:
- the `hub.channel.type` is not `websocket`
- the `hub.topic` is empty
- the `hub.mode` is `unsubscribe` and there is no `hub.channel.endpoint` or its value is empty
- the `hub.channel.endpoint` does not match the websocket associated to the Subscriber

The Manager may return other applicable HTTP error status codes.

The HTTP body of the response shall consist of a JSON object containing an element name `hub.channel.endpoint` and a value for the websocket URL that is associated to the Subscriber.

##### 2:3.X7.4.2.3 Expected Actions

The Subscriber may check the returned `hub.channel.endpoint` in the response and verify that it matches the websocket URL it requested.

If the HTTP response code is 4xx or 5xx, then the Subscriber may adjust the request and retry.

### Security Considerations

See [IRA Security Considerations](volume-1.html#1xx5-ira-security-considerations).

#### Security Audit Considerations

Managers that support the ATNA Profile shall audit this transaction.

This transaction corresponds to a Query Information ATNA Trigger Event.
