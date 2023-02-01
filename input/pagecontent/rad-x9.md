### 2:4.X9.1 Scope

This transaction is used to send accepted events to all subscribers that subscribed to the events.

> Note that this transaction is agnostic about the actual event being transmitted and only describes the general requirements on sending or receiving an event. Event specific requirements are specified in the corresponding event-specific transaction.

### 2:4.X9.2 Actors Roles

**Table 2:4.X9.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Manager | Send accepted event to subscribers | Hub |
| Receiver | Receive synchronization events | Subscriber<br>Read-Only Subscriber |
{: .grid}

### 2:4.X9.3 Referenced Standards

**FHIRcast**: [Event Notification](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html)

### 2:4.X9.4 Messages

<div>
{%include rad-x9-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:4.X9.4-1: Interaction Diagram**

#### 2:4.X9.4.1 Send Event Request Message
The Manager sends the received events via the established websocket connection to the corresponding Receiver.

The Manager shall support sending such messages to more than one Receiver.

The Receiver shall support handling such messages from more than one Manager. 

##### 2:4.X9.4.1.1 Trigger Events

The Manager accepted a event from a Subscriber.

##### 2:4.X9.4.1.2 Message Semantics

This message is a websocket event. The Manager is the User Agent. The Receiver is the Origin Server.

The Manager shall send a websocket event to all Receivers that subscribed to the given event via the corresponding websocket associated to each Receiver.

The message body shall follow [Section 2.5.1 Event Notification Request](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-request) and include the same context and content from the request received.

The Manager shall support [content sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html) in FHIRcast, specifically:
- It shall assign and maintain an anchor context's `context.versionId` when processing the `[FHIR reousrce]-open` event. The `context.versionId` shall be unique within the topic.
- It shall assign and maintain a new `context.versionId` for each subsequent anchor context's content received via the `[FHIR resource]-update` event.
- It shall provide the new `context.versionId` along with the previous versionId as `context.priorVersionId` in the event

##### 2:4.X9.4.1.3 Expected Actions

The Receiver shall handle events `[FHIR resource]-open` | `update` | `select` | `close` that it supports. The required supported events are defined in the [Actor Description](volume-1.html#1xx11-actors-description-and-actor-profile-requirements).

Upon receiving a `[FHIR resource]-open` event, the Receiver shall *open* the corresponding `event.context` according to its application logic.

> Note: The Receiver may use all or a subset of the context provided. For example, a Receiver that is a Report Creator may use the patient and study context to open the corresponding procedure and make it ready for dictation, and ignore the report context since the Report Creator will create its own. On the other hand, an Evidence Creator (such as a specialty AI application) may use only the study context to run an inference model on the study on demand, ignoring the report and patient context.

The Receiver shall validate and maintain the locally current context versionId as follows:
- Maintain locally the current context versionId according to the `context.versionId` from the event.
- Upon receiving a `[FHIR resource]-update` event, validate if the `context.priorVersionId` in the event matches the local current context versionId.
    - If not, this means the Receiver missed one or more prior events. In this case, the Receiver shall use [Get Current Context](rad-x8.html) to retrieve the current context.
    - If match, the Receiver shall handle the update event according to its application logic. 

    > Note: The Receiver may choose to accept but ignore the event. In this case, the Receiver shall continue to maintain the local current context versionId for subsequent events.

#### 2:4.X9.4.2 Send Event Response Message

##### 2:4.X9.4.2.1 Trigger Events

The Receiver accepted or rejected the event received.

##### 2:4.X9.4.2.2 Message Semantics

The Receiver shall send a confirmation message back to the Manager using the established websocket connection.

The Receiver shall include `id` and `status` parameters as defined in [Section 2.5.2 Event Notification Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-response) in the confirmation message.

The `id` shall be the `id` from the corresponding received event.

The `status` shall be one of the following:
- `200` OK if the Receiver successfully processed the event
- `202` Accepted if the Receiver successfully received the event and will process the event asynchronously
- `4xx` or `5xx` if the Receiver failed to process the event

> Note: If the Receiver returned with `status` `202` Accepted and later failed to process the event, then the Receiver shall send a `syncerror` event following [Send SyncError Event](rad-x10.html).

##### 2:4.X9.4.2.3 Expected Actions

If the Manager receives an error confirmation message (i.e. `status` `4xx` or `5xx`) from at least one of the Receivers, then the Manager shall send a `syncerror` event following [Send SyncError Event](rad-x10.html) to all Receivers (Subscribers) that subscribed to the `syncerror` event.

### 2:4.X9.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:4.X9.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### 2:4.X9.5.1.1 Manager Audit 

''TODO: the specifics''

##### 2:4.X9.5.1.2 Receiver Audit 

''TODO: the specifics''
