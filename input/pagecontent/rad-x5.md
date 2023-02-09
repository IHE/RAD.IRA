### 2:3.X5.1 Scope

This transaction is used to add, update or remove contents in a report context.

### 2:3.X5.2 Actors Roles

**Table 2:3.X5.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Adds, updates or removes report contents | Content Creator |
| Manager | Manages the report contents | Hub |
{: .grid}

### 2:3.X5.3 Referenced Standards

**FHIRcast**: [Content Sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html)

**FHIRcast**: [DiagnosticReport update Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-3-diagnosticreport-update.html)

### 2:3.X5.4 Messages

<div>
{%include rad-x5-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X5.4-1: Interaction Diagram**

#### 2:3.X5.4.1 Update Report Content Request Message
The Sender sends an event to the Manager to add, update or remove content relevant to an existing report context. The Sender shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Sender. 

##### 2:3.X5.4.1.1 Trigger Events

The Sender determines new content should be added, existing content should be updated, or existing content should be removed for a report context.

##### 2:3.X5.4.1.2 Message Semantics

This message is a [FHIRcast Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body) request. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The `event.context` shall conform to [DiagnosticReport update Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-3-diagnosticreport-update.html).

The `event`.`context.versionId` shall be the newest version ID of the report context known to the Sender.

The Sender shall support one or more of the following FHIR resources for content sharing:

| FHIR Resource | Usage | Conformance |
| -- | -- | -- |
| [DocumentReference](https://www.hl7.org/fhir/documentreference.html) | Reference to any kind of document. For example, JSON Structured Report | RTC-IMR-DocumentReference |
{: .grid}

THe Sender may support other FHIR resources for content sharing.

The Sender should include all contents and referenced resources as inline [contained resources](https://www.hl7.org/fhir/references.html#contained) if possible. This is preferred as most resources in the event are transient. However, in some situations, it is beneficial to reference other resources by reference instead of by value. In this case, the Sender shall specify the `entry.fullurl` with the uri value that the full content can be retrieved.

> Note: The eventual Subscriber may or may not have permission to access the referenced resources that are not inline.

If the Sender retries the same request due to a timeout, then the Sender shall use the same `event.id` such that the Manager can detect if it is a duplicate message.

If the Sender retries the same request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X5.4.1.3 Expected Actions

The Manager shall validate the request as follow:

* If `timestamp`, `id` or `event` are not set, then return an error
* If `event.context` does not include `report` and `updates`, then return an error
* if `event`.`hub.topic` is not a known topic, then return an error
* If `context.versionId` does not match the latest version ID of the `report` anchor context, then return an error

The Manager shall apply all actions in the request *atomically*. i.e. The Manager shall apply all actions or none of the actions.

> Note: The Manager is only required to apply the actions generically for any resource. For example, identify if the same resource already exist, and add, update or remove the resource as a whole accordingly. There is no requirement for the Manager to understand the deep structure of each resource and perform any validation or application logic at the resource level.

If the Manager accepted the request but later failed to apply all actions, then it shall send a `syncerror` event using Send SyncError Event [RAD-X9](rad-x9.html) transaction.

If the Manager successfully apply all actions in the request, it shall assign a new version ID to the `report` anchor context.

The Manager shall broadcast the event to all subscribers that subscribed to the received event using Send Context Event [RAD-X9](rad-x9.html).

#### 2:3.X5.4.2 Update Report Content Response Message

##### 2:3.X5.4.2.1 Trigger Events

The Manager finished process the Update Report Content request.

##### 2:3.X5.4.2.2 Message Semantics

This message is a [FHIRcast Request Context Change]() response. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

If the Manager rejected the Update Report Content request, then the Manager shall return a 4xx or 5xx HTTP error response code. In this case, the Manager shall reject all the actions in the request. In other words, if the Manager failed partially, then all the applied actions prior to the failure shall be reverted.

##### 2:3.X5.4.2.3 Expected Actions

If the response is an error, then the Sender may consider retrying the request.

#### 2:3.X5.4.3 Update Report Content Message

##### 2:3.X5.4.3.1 Trigger Events

The Subscriber receives a `DiagnosticReport-update` event from Manager via Send Context Event [RAD-X9](rad-x9.html).

> Note: This message is not a traditional message in a transaction between two devices; the primary focus is on the required behavior of the Subscriber upon receiving the event from the Manager triggered by the request from the Sender. The Send Context Event [RAD-X9](rad-x9.html) specifies the general requirement between the Manager and the Subscriber and it is agnostic about the specific event.

##### 2:3.X5.4.3.1 Message Semantics

The Subscriber shall validate the context and content in the received event. If each context and content does not conform to the corresponding resource definition, then return an error.

The Subscriber shall keep track of the `context.versionId` of the `report` anchor context, regardless of whether it applies the actions in the event or not.

> Note: This is important so that the Subscriber can use this `context.versionId` to detect if it missed some prior events before the received event. The Subscriber is expected to process all events sequentially. So if the Subscriber identified that it missed some prior events, then it can use the Get Current Context [RAD-X8](rad-x8.html) transaction to retrieve the latest context and content from the Manager.

The Subscriber shall *update* the corresponding `event.context` and contents according to its application logic.

> Note: The following actions are all valid for the Subscriber:
> - Subscriber immediately applies the necessary actions
> - Subscriber accepts and keep track of the content without immediate actions. Then some automated or manual actions are applied later
> - Subscriber accepts and ignore one or more of the actions since they are not applicable
>
> An example of delay action is that a radiologist identifies nodules as she reads the study. These nodules are communicated as `FHIR Observation` in the `DiagnosticReport-update` event. The Report Creator keeps track of these nodules but no immediately action. Later the radiologist review the list of nodules identified and selected the top 3 to include in the final report.

If some of the content are not inline, then the Subscriber shall retrieve the content based on the `entry.fullurl` if permission allowed.

If the Subscriber accepted the event initially (i.e. return `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Manager using Send SyncError Event [RAD-X10](rad-10.html).

### 2:3.X5.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X5.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
