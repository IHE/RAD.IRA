### 2:4.X2.1 Scope

This transaction is used to complete the subscription by connecting to the notification channel in order to receive synchronization events.

### 2:4.X2.2 Actors Roles

**Table 2:4.X2.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Connect to a websocket notification channel | Subscriber<br>Read-Only Subscriber |
| Receiver | Establish a websocket notification channel and manage subscription | Hub |
{: .grid}

### 2:4.X2.3 Referenced Standards

**FHIRcast**: [Subscribing to Events](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html)

### 2:4.X2.4 Messages

<div>
{%include rad-x2-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:4.X2.4-1: Interaction Diagram**

#### 2:4.X2.4.1 Connect to Websocket Request Message
The Sender sends a Connect to Websocket Request message to the Receiver. The Sender shall support sending such messages to more than one Receiver.

The Receiver shall support handling such messages from more than one Sender. 

##### 2:4.X2.4.1.1 Trigger Events

The Sender receives a successful Subscribe to Reporting Session [RAD-X1] response message.

##### 2:4.X2.4.1.2 Message Semantics

This message is a websocket request. The Sender is the User Agent. The Receiver is the Origin Server.

The Sender shall send a websocket request to the `hub.channel.endpoint` websocket WSS URL received from the successful Subscribe to Reporting Session [RAD-X1] response. 

##### 2:4.X2.4.1.3 Expected Actions

The Receiver shall return an error if the websocket identifier in the WSS URL does not exist.

The Receiver shall keep the websocket connection open for use as a notification channel.

The Receiver shall use the opened websocket connection when sending subsequent events to the Sender.

#### 2:4.X2.4.2 Connect to Websocket Response Message
The Receiver sends a response message to the Sender containing the outcome of the websocket connection request.

##### 2:4.X2.4.2.1 Trigger Events

The Receiver accepts or rejects the websocket connection (subscription) request.

##### 2:4.X2.4.2.2 Message Semantics

The Receiver shall send a confirmation message back to the Sender using the established websocket connection.

If the Receiver accepts the subscription from the Sender, then the confirmation message shall include the parameters as defined in [Section 2.4.3 Subscription Confirmation](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html#subscription-confirmation).

If the Receiver rejects the subscription from the Sender, or if the subscription has expired, then the rejection message shall include the parameters as defined in [Section 2.4.5 Subscription Denial](https://build.fhir.org/ig/HL7/fhircast-docs/2-4-Subscribing.html#subscription-denial)

##### 2:4.X2.4.2.3 Expected Actions

If the Sender wants to maintain the subscription, then it shall renew the subscription using Subscribe to Reporting Session [RAD-X1] before the subscription expires according to `hub.lease_seconds` specified in the confirmation.

### 2:4.X2.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:4.X2.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### 2:4.X2.5.1.1 Sender Audit 

''TODO: the specifics''

##### 2:4.X2.5.1.2 Receiver Audit 

''TODO: the specifics''
