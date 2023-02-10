### 2:3.X9.1 Scope

This transaction is used to send accepted events to all subscribers that subscribed to the events.

### 2:3.X9.2 Actors Roles

**Table 2:3.X9.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Manager | Sends accepted event to Subscribers | Hub |
| Subscriber | Receives notification events | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
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
The Manager sends the received notification events to Subscribers that subscribed to the received event. The Manager shall support sending such messages to more than one Subscriber.

The Subscriber shall support handling such messages from more than one Manager. 

##### 2:3.X9.4.1.1 Trigger Events

The Manager accepts a notification event request.

##### 2:3.X9.4.1.2 Message Semantics

This message is a [FHIRcast Event Notification Request](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-request) request. The Manager is the FHIRcast Hub. The Subscriber is the FHIRcast Subscriber.

The Manager shall send all events it received to Subscribers that subscribed to the event, including custom events.

The Manager shall support [content sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html) in FHIRcast.

##### 2:3.X9.4.1.3 Expected Actions

The Subscriber shall validate that the event contexts, `updates` and `select` conform to the corresponding resource definition if known, and return an error if they don't.

The Subscriber shall handle events `[FHIR resource]-open` | `update` | `select` | `close` that it supports. The event handling requirements are defined in the Actor Description for each actor per profile.

If the Subscriber accepted the event initially (i.e. return `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Manager using Send SyncError Event [RAD-X10](rad-10.html).

##### 2:3.X9.4.1.3.1 Handling open events

Upon receiving a `[FHIR resource]-open` event, the Subscriber shall *open* the corresponding `event.context` according to its application logic.

> Note: The Subscriber may use all or a subset of the context provided. For example, a Report Creator may use the patient and study context to open the corresponding procedure and make it ready for dictation, and ignore the report context since the Report Creator will create its own. On the other hand, an Evidence Creator (such as a specialty AI application) may use only the study context to run an inference model on the study on demand, ignoring the report and patient context.

> Note: For `[FHIRresource]-open` events, occasionally the same anchor context may be re-opened. e.g. [Use Case #3: Interruption and Resume Flow](volume-1.html#1xx423-use-case-3-interruption-and-resume-flow) and FHIRcast [Section 4.4 Multi-tab Considerations](https://build.fhir.org/ig/HL7/fhircast-docs/4-4-multitab-considerations.html). In these cases, the Subscriber event handling for the subsequent event may differ from the first event.
>
> For example, an Evidence Creator may skip executing the expensive processing on the patient's study if the report context is re-open and the evidence data from previous execution is still available and valid. 

##### 2:3.X9.4.1.3.2 Handling update events

The Subscriber shall support [content sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html) in FHIRcast, in particular:
- The Subscriber shall validate and maintain locally current context versionId
- Maintain locally the current context versionId according to the `context.versionId` from the event.
- Upon receiving a `[FHIR resource]-update` event, validate if the `context.priorVersionId` in the event matches the local current context versionId.
    - If not, this means the Subscriber missed one or more prior events. In this case, the Subscriber shall use [Get Current Context](rad-x8.html) to retrieve the current context.
    - If match, the Subscriber shall handle the update event according to its application logic. 
- The Subscriber may choose to accept but ignore the event. Regardless, the Subscriber shall continue to maintain the local current context versionId for subsequent events.
- For contents that are applicable to the Subscriber and they are not inline in the `[FHIR resource]-update` event, then the Subscriber shall retrieve the content based on the `entry.fullurl` if permission allowed.

> Note: The following actions are all valid for the Subscriber when handling a `[FHIR resource]-update` event:
> - Subscriber immediately applies the necessary actions
> - Subscriber accepts and keep track of the content without immediate actions. Then some automated or manual actions are applied later
> - Subscriber accepts and ignore one or more of the actions since they are not applicable
>
> An example of delay action is that a radiologist identifies nodules as she reads the study. These nodules are communicated as `FHIR Observation` in the `DiagnosticReport-update` event. The Report Creator keeps track of these nodules but no immediately action. Later the radiologist review the list of nodules identified and selected the top 3 to include in the final report.

##### 2:3.X9.4.1.3.3 Handling select events

The Subscriber shall ignore any selected resources in the request that are not known based on any previous `[FHIR resource]-open` or `[FHIR resource]-update` events.

The Subscriber shall be capable of using the applicable selected resources in the next immediate user commands.

The Subscriber shall keep track of the `context.versionId` of the anchor context, regardless of whether it selected any content or not.

##### 2:3.X9.4.1.3.4 Handling close events

The Subscriber shall delete the referenced context and all associated contents locally.

#### 2:3.X9.4.2 Notification Response Message

##### 2:3.X9.4.2.1 Trigger Events

The Subscriber processes the notification event received.

##### 2:3.X9.4.2.2 Message Semantics

The message is a [FHIRcast Event Notification Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-response) request. The Subscriber is a FHIRcast Subscriber. The Manager is a FHIRcast Hub.

The Subscriber shall send a confirmation message back to the Manager using the established websocket connection.

The `status` shall be one of the following:
- `200` OK if the Subscriber successfully processed the event
- `202` Accepted if the Subscriber successfully received the event and will process the event asynchronously
- `4xx` or `5xx` if the Subscriber failed to process the event

> Note: If the Subscriber returned with `status` `202` Accepted and later failed to process the event, then the Subscriber shall send a `syncerror` event following [Send SyncError Event](rad-x10.html).

##### 2:3.X9.4.2.3 Expected Actions

If the Manager receives an error confirmation message (i.e. `status` `4xx` or `5xx`) from at least one of the Subscribers, then the Manager shall send a `syncerror` event following [Send SyncError Event](rad-x10.html) to all subscribers that subscribed to the `syncerror` event.

The Manager shall not change the current context in the session even if it receives an error confirmation message.

> Note: The Manager sets the current context as a result of processing a `[FHIR resource]-open` event. Whether or not one or more of the Subscribers failed to apply the context change does not affect the context managed by the Manager.

### 2:3.X9.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X9.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
