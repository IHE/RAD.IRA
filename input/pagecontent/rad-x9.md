### 2:3.X9.1 Scope

This transaction is used to send notification events to subscribers.

### 2:3.X9.2 Actors Roles

**Table 2:3.X9.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Manager | Sends notification event to Subscribers | Hub |
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
The Manager sends the received notification events to Subscribers that listed this event type in their subscription. The Manager shall support sending such messages to more than one Subscriber.

The Subscriber shall support handling such messages from more than one Manager. 

##### 2:3.X9.4.1.1 Trigger Events

The Manager accepts a notification event request and this Subscriber has listed this event type in its subscription.

##### 2:3.X9.4.1.2 Message Semantics

This message is a [FHIRcast Event Notification Request](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html#event-notification-request) request. The Manager is the FHIRcast Hub. The Subscriber is the FHIRcast Subscriber.

Since the Manager is required to support FHIRcast [content sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html), it will need to manage the version ID in the event. TODO: Rework. Look at #3.

##### 2:3.X9.4.1.3 Expected Actions

The Subscriber may validate the received event according to its business logic. If the Subscriber rejects the event, then it shall notify the Manager about the error.

The Subscriber shall handle events `[FHIR resource]-open` | `update` | `select` | `close` that it supports. The event handling requirements are defined in the Actor Description for each actor per profile.

If the Subscriber accepted the event initially (i.e. return `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Manager using Send SyncError Event [RAD-X10](rad-10.html).

TODO: See if stating parsing vs processing and handle response and error are handled.

##### 2:3.X9.4.1.3.1 Handling open events

Upon receiving a `[FHIR resource]-open` event, the Subscriber will *open* the corresponding `event.context` according to its application logic. The semantics of the open event may be further described in the corresponding 'open request' transaction.

TODO: Move to Volume 1 if needed
> Note: The Subscriber may use all or a subset of the context provided. For example, a Report Creator may use the patient and study context to open the corresponding procedure and make it ready for dictation, and ignore the report context since the Report Creator will create its own. On the other hand, an Evidence Creator (such as a specialty AI application) may use only the study context to run an inference model on the study on demand, ignoring the report and patient context.

> Note: For `[FHIRresource]-open` events, this may be the initial creation of the context, or an re-open of the context. Subscriber event handling for the subsequent event may differ from the first event.

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

#### 2:3.X9.4.3 Notify Error Message

This pair of messages is used for SyncError originated by a Subscriber.

The Subscriber sends an error event to the Manager indicated that it failed to process an accepted event. The Subscriber shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Subscriber. 

##### 2:3.X9.4.3.1 Trigger Events

The Subscriber failed to process an accepted event (e.g. The Subscriber accepted an event but failed to follow context within a configured timeout after reception).

##### 2:3.X9.4.3.2 Message Semantics

This message is a [FHIRcast Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body) request. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The `event.context` shall conform to [SyncError Context](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html#context).

Per FHIRcast, the `issue[0].severity` of the `operationoutcome` context will be set to `warning`.

If the Subscriber retries the same request due to a timeout, then the Subscriber shall use the same `event.id` such that the Manager can detect if it is a duplicate message.

If the Subscriber retries the same request due to an error response from the Manager, then the Subscriber shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X9.4.3.3 Expected Actions

The Manager shall validate the request as follow:

TODO: types of errors for each check, and use the table format

* If `timestamp`, `id` or `event` are not set, then return an error
* If `event.context` does not include `operationoutcome`, then return an error
* If the context does not conform to the [SyncError Context](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html#context), then return an error
* if `event`.`hub.topic` is not a known session, then return an error

#### 2:3.X9.4.4 Notify Error Response Message

##### 2:3.X9.4.4.1 Trigger Events

The Manager finished processing the Notify Error request.

##### 2:3.X9.4.4.2 Message Semantics

This message is a [FHIRcast Request Context Change]() response. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X9.4.4.3 Expected Actions

If the response is an error, then the Subscriber may consider retrying the request.

### 2:3.X9.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X9.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
