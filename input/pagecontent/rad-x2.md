### 2:4.X2.1 Scope

This transaction is used to connect to a notification channel to receive synchronization events.

### 2:4.X2.2 Actors Roles

**Table 2:4.X2.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Subscriber | Initiate a websocket notification channel request | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
| Manager | Establish a websocket notification channel and manage connection | Hub |
{: .grid}

### 2:4.X2.3 Referenced Standards

**FHIRcast**: [Subscribing to Events](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html)

**Websocket**: [IETF RFC 6455](https://www.rfc-editor.org/rfc/rfc6455)

### 2:4.X2.4 Messages

<div>
{%include rad-x2-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:4.X2.4-1: Interaction Diagram**

#### 2:4.X2.4.1 Subscription Request Message
The Subscriber sends a websocket connection request to the Manager. The Subscriber shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Subscriber. 

##### 2:4.X2.4.1.1 Trigger Events

The Subscriber receives a successful Subscribe to Reporting Session [RAD-X1] response.

##### 2:4.X2.4.1.2 Message Semantics

This message is a websocket connection request. The Subscriber is the Client. The Manager is the Server.

The Subscriber shall send a websocket request to the `hub.channel.endpoint` websocket WSS URL received from the successful Subscribe to Reporting Session [RAD-X1] response. 

##### 2:4.X2.4.1.3 Expected Actions

The Manager shall process the request.

The Manager shall return an error if the websocket identifier in the WSS URL does not exist.

The Manager shall keep the websocket connection open for use as a notification channel.

The Manager shall use the opened websocket connection when sending subsequent events to the Subscriber.

#### 2:4.X2.4.2 Subscription Response Message

##### 2:4.X2.4.2.1 Trigger Events

The Manager processes the websocket connection request.

##### 2:4.X2.4.2.2 Message Semantics

This is a [FHIRcast Subscription Confirmation](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html#subscription-confirmation). The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X2.4.2.3 Expected Actions

The Subscriber will find the duration of the websocket lease in the `hub.lease_seconds` attribute of this message. When the lease expires, the Manager may drop the connection. It is the responsibility of the Subscriber to renew the subscription as needed before it expires using Subscribe to Reporting Session [RAD-X1].

### 2:4.X2.5 Security Considerations

See [IRA Security Considerations](volume-1.html#1xx5-ira-security-considerations).

#### 2:4.X2.5.1 Security Audit Considerations

This transaction is not associated with an ATNA Trigger Event.
