### 2:3.X9.1 Scope

This transaction is used to send accepted events to all subscribers that subscribed to the events.

> Note that this transaction is agnostic about the actual event being transmitted and only describes the general requirements on sending or receiving an event. Event specific requirements are specified in the corresponding event specific transaction.

### 2:3.X9.2 Actors Roles

**Table 2:3.X9.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Manager | Send accepted event to subscribers | Hub |
| Subscriber | Receive synchronization events | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
{: .grid}

### 2:3.X9.3 Referenced Standards

**FHIRcast**: [Event Notification](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html)

**Websocket**: [IETF RFC 6455](https://www.rfc-editor.org/rfc/rfc6455)

### 2:3.X9.4 Messages

<div>
{%include rad-x9-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X9.4-1: Interaction Diagram**

#### 2:3.X9.4.1 Notification Message
The Manager sends the received events via the established websocket connection to the corresponding Subscriber.

The Manager shall support sending such messages to more than one Subscriber.

The Subscriber shall support handling such messages from more than one Manager. 

##### 2:3.X9.4.1.1 Trigger Events

The Manager accepted a event from a Subscriber.

##### 2:3.X9.4.1.2 Message Semantics

This message is a [FHIRcast Event Notification Request](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-request) request. The Manager is the FHIRcast Hub. The Subscriber is the FHIRcast Subscriber.

The Manager shall support [content sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html) in FHIRcast, specifically:
- It shall assign and maintain an anchor context's `context.versionId` when processing the `[FHIR reousrce]-open` event. The `context.versionId` shall be unique within the topic.
- It shall assign and maintain a new `context.versionId` for each subsequent anchor context's content received via the `[FHIR resource]-update` event.
- It shall provide the new `context.versionId` along with the previous versionId as `context.priorVersionId` in the event

##### 2:3.X9.4.1.3 Expected Actions

The Subscriber shall validate that the event specific contexts, `updates` and `select` conform to the corresponding resource definition, and return an error if they don't.

The Subscriber shall handle events `[FHIR resource]-open` | `update` | `select` | `close` that it supports. The required supported events are defined in the [Actor Description](volume-1.html#1xx11-actors-description-and-actor-profile-requirements).

Upon receiving a `[FHIR resource]-open` event, the Subscriber shall *open* the corresponding `event.context` according to its application logic.

> Note: The Subscriber may use all or a subset of the context provided. For example, a Report Creator may use the patient and study context to open the corresponding procedure and make it ready for dictation, and ignore the report context since the Report Creator will create its own. On the other hand, an Evidence Creator (such as a specialty AI application) may use only the study context to run an inference model on the study on demand, ignoring the report and patient context.

> Note: For `[FHIRresource]-open` events, occasionally the same anchor context may be re-opened. e.g. [Use Case #3: Interruption and Resume Flow](volume-1.html#1xx423-use-case-3-interruption-and-resume-flow) and FHIRcast [Section 4.4 Multi-tab Considerations](https://build.fhir.org/ig/HL7/fhircast-docs/4-4-multitab-considerations.html). In these cases, the Subscriber event handling for the subsequent event may differ from the first event.
>
> For example, an Evidence Creator may skip executing the expensive processing on the patient's study if the report context is re-open and the evidence data from previous execution is still available and valid. 

The Subscriber shall validate and maintain locally current context versionId as follow:
- Maintain locally the current context versionId according to the `context.versionId` from the event.
- Upon receiving a `[FHIR resource]-update` event, validate if the `context.priorVersionId` in the event matches the local current context versionId.
    - If not, this means the Subscriber missed one or more prior events. In this case, the Subscriber shall use [Get Current Context](rad-x8.html) to retrieve the current context.
    - If match, the Subscriber shall handle the update event according to its application logic. 

    > Note: The Subscriber may choose to accept but ignore the event. In this case, the Subscriber shall continue to maintain the local current context versionId for subsequent events.

If the Subscriber accepted  the event initially (i.e. return `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Manager using Send SyncError Event [RAD-X10](rad-10.html).

#### 2:3.X9.4.2 Notification Response Message

##### 2:3.X9.4.2.1 Trigger Events

The Subscriber accepted or rejected the event received.

##### 2:3.X9.4.2.2 Message Semantics

The message is a [FHIRcast Event Notification Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-response) request. The Subscriber is a FHIRcast Subscriber. The Manager is a FHIRcast Hub.

The Subscriber shall send a confirmation message back to the Manager using the established websocket connection.

The Subscriber shall include `id` and `status` parameters as defined in [Section 2.5.2 Event Notification Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-response) in the confirmation message.

The `id` shall be the `id` from the corresponding received event.

The `status` shall be one of the following:
- `200` OK if the Subscriber successfully processed the event
- `202` Accepted if the Subscriber successfully received the event and will process the event asynchronously
- `4xx` or `5xx` if the Subscriber failed to process the event

> Note: If the Subscriber returned with `status` `202` Accepted and later failed to process the event, then the Subscriber shall send a `syncerror` event following [Send SyncError Event](rad-x10.html).

##### 2:3.X9.4.2.3 Expected Actions

If the Manager receives an error confirmation message (i.e. `status` `4xx` or `5xx`) from at least one of the Subscribers, then the Manager shall send a `syncerror` event following [Send SyncError Event](rad-x10.html) to all subscribers that subscribed to the `syncerror` event.

### 2:3.X9.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X9.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
