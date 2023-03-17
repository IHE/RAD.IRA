### 2:3.X9.1 Scope

This transaction is used to distribute notification events to subscribers. This allows a Subscriber to synchronize to changes in the reporting session initiated by other Subscribers.

### 2:3.X9.2 Actors Roles

**Table 2:3.X9.2-1: Actor Roles**

| Role | Description | Actor(s)                         |
|------|-------------|----------------------------------|
| Manager | Distributes notification event to Subscribers | Hub |
| Subscriber | Receives notification events | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
{: .grid}

### 2:3.X9.3 Referenced Standards

**FHIRcast**: [Event Notification](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html)

**Websocket**: [IETF RFC 6455](https://www.rfc-editor.org/rfc/rfc6455)

**FHIRcast**: [Sync error Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html)

### 2:3.X9.4 Messages

<div>
{%include rad-x9-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X9.4-1: Interaction Diagram**

#### 2:3.X9.4.1 Notification Message
The Manager sends the received notification events to Subscribers that listed this event type in their subscription. The Manager shall support sending such messages to more than one Subscriber.

The Subscriber shall support handling such messages from more than one Manager. 

##### 2:3.X9.4.1.1 Trigger Events

The Manager accepts a notification event request and this Subscriber has listed this event type in its subscription.

##### 2:3.X9.4.1.2 Message Semantics

This message is a [FHIRcast Event Notification Request](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-request) request. The Manager is the FHIRcast Hub. The Subscriber is the FHIRcast Subscriber.

The Manager shall support the additional requirements regarding `version id` defined in FHIRcast [content sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html).

##### 2:3.X9.4.1.3 Expected Actions

The Subscriber may validate the received event according to its business logic. If the Subscriber rejects the event, then it shall notify the Manager about the error.

The Subscriber shall handle events `[FHIR resource]-open` \| `update` \| `select` \| `close` that it supports. Handling requirements for some general types of events are described below. Profile specific event handling requirements are defined in the Actor Description for each actor per profile.

The Subscriber shall support [content sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html).

> Note: The Subscriber may handle the event synchronously. The Subscriber may also handle the event asynchronously by accepting the event initially (i.e., returning `202` Accepted) and processing it later.

##### 2:3.X9.4.1.3.1 Handling open events

Upon receiving a `[FHIR resource]-open` event, the Subscriber will *open* the corresponding `event.context` according to its business logic. The semantics of the open event may be further described in the corresponding 'open request' transaction.

> Note: `[FHIR resource]-open` events occur when a context is initially created and when it is re-opened. Subscriber event handling may differ for these two cases.

##### 2:3.X9.4.1.3.2 Handling update events

Upon receiving a `[FHIR resource]-update` event, the Subscriber:
- Will validate if the `context.priorVersionId` in the event matches the current version ID in the local context.
    - If true, the Subscriber shall handle the update event according to its business logic.
    - If not, this means the Subscriber missed one or more prior events. In this case, the Subscriber is responsible for subsequently retrieving the current context.
- Shall update the current version ID in the local context to match the `context.versionId` from the event, even if its business logic requires no specific processing.
- For contents of interest that are not inline in the `[FHIR resource]-update` event, the Subscriber will need to retrieve the content based on the `entry.fullurl`.

##### 2:3.X9.4.1.3.3 Handling select events

Upon receiving a `[FHIR resource]-select` event, the Subscriber:
- Will validate if the `context.priorVersionId` in the event matches the current version ID in the local context as described in Section 2:3.X9.4.1.3.2.
- Shall track which of the resources in the local context are currently selected and be capable of using applicable selected resources in subsequent user commands according to its business logic.
- Shall update the current version ID in the local context to match the `context.versionId` from the event, even if its business logic requires no specific processing.
- Shall ignore any resources selected in the event that are not known to the Subscriber

##### 2:3.X9.4.1.3.4 Handling close events

Upon receiving a `[FHIR resource]-close` event, the Subscriber shall close the referenced context and all associated contents. This typically involves deleting it from its local context.

#### 2:3.X9.4.2 Notification Response Message

##### 2:3.X9.4.2.1 Trigger Events

The Subscriber processes the Notification Message.

##### 2:3.X9.4.2.2 Message Semantics

The message is a [FHIRcast Event Notification Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-response) request. The Subscriber is a FHIRcast Subscriber. The Manager is a FHIRcast Hub.

The Subscriber shall send a confirmation message back to the Manager using the established websocket connection.

The `status` shall be one of the following:
- `200` OK if the Subscriber successfully processed the event
- `202` Accepted if the Subscriber successfully received the event and will process the event asynchronously
- `4xx` or `5xx` if the Subscriber failed to process the event

> Note: If the Subscriber returned with `status` `202` Accepted and later failed to process the event, then the Subscriber shall send a `syncerror` event following [Notify Error](rad-x11.html).

##### 2:3.X9.4.2.3 Expected Actions

If the Manager receives an error confirmation message (i.e., `status` `4xx` or `5xx`) from at least one of the Subscribers, then the Manager shall send a `syncerror` event following [Notify Error](rad-x11.html) to all subscribers that subscribed to the `syncerror` event.

The Manager shall not change the current context in the session even if it receives an error confirmation message.

> Note: The Manager sets the current context as a result of processing a `[FHIR resource]-open` event. Whether or not one or more of the Subscribers failed to apply the context change does not affect the context managed by the Manager.

### 2:3.X9.5 Security Considerations

See [IRA Security Considerations](volume-1.html#1xx5-ira-security-considerations).

#### 2:3.X9.5.1 Security Audit Considerations

This transaction is not associated with an ATNA Trigger Event.
