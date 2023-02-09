### 2:3.X6.1 Scope

This transaction is used to select report context and content that all synchronizing applications will be synchronized to.

### 2:3.X6.2 Actors Roles

**Table 2:3.X6.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Select report content(s) | Content Creator |
| Manager | Receives and maintains selected contents in the context<br>and forward events to other Receivers | Hub |
{: .grid}

### 2:3.X6.3 Referenced Standards

**FHIRcast**: [Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change)

**FHIRcast**: [DiagnosticReport select Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-4-diagnosticreport-select.html)

### 2:3.X6.4 Messages

<div>
{%include rad-x6-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X6.4-1: Interaction Diagram**

#### 2:3.X6.4.1 Select Report Content Request Message
The Sender sends an event to the Manager to indicate some report context and/or content are selected. The Sender shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Sender. 

##### 2:3.X6.4.1.1 Trigger Events

The Sender identifies some report context / content are selected automatically or manually by a user.

##### 2:3.X6.4.1.2 Message Semantics

This message is a [FHIRcast Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body) request. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The `event.context` shall conform to [DiagnosticReport select Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-4-diagnosticreport-select.html).

The `event`.`context.versionId` shall be the newest version ID of the report context known to the Sender.

The Sender shall include all selected resources in the event, including resources that were selected previously and remain selected for this event.

> Note: This is necessary because there is an implicit unselect of any previously selected resources for each new `DiagnosticReport-select` event received.

If the Sender retries the same request due to a timeout, then the Sender shall use the same `event.id` such that the Manager can detect if it is a duplicate message.

If the Sender retries the same request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X6.4.1.3 Expected Actions

The Manager shall validate the request as follow:

* If `timestamp`, `id` or `event` are not set, then return an error
* If `event.context` does not include `report` and `select`, then return an error
* if `event`.`hub.topic` is not a known topic, then return an error
* If `context.versionId` does not match the latest version ID of the `report` anchor context, then return an error

The Manager shall keep track of what contents are being selected. In particular:
- All previously selected contents shall be unselected
- All referenced resources in the request shall be selected

The Manager shall ignore any selected resources in the request that are not known based on any previous `DiagnosticReport-open` or `DiagnosticReport-update` events.

#### 2:3.X6.4.2 Select Report Content Response Message

##### 2:3.X6.4.2.1 Trigger Events

The Manager finished process the Select Report Content request.

##### 2:3.X6.4.2.2 Message Semantics

This message is a [FHIRcast Request Context Change]() response. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X6.4.2.3 Expected Actions

If the response is an error, then the Sender may consider retrying the request.

#### 2:3.X6.4.3 Select Report Content Message

##### 2:3.X6.4.3.1 Trigger Events

The Receiver receives a `DiagnosticReport-select` event from Manager via Send Context Event [RAD-X9](rad-x9.html).

> Note: This message is not a traditional message in a transaction between two devices; the primary focus is on the required behavior of the Receiver upon receiving the event from the Manager triggered by the request from the Sender. The Send Context Event [RAD-X9](rad-x9.html) specifies the general requirement between the Manager and the Receiver and it is agnostic about the specific event.

##### 2:3.X6.4.3.1 Message Semantics

The Receiver shall ignore any selected resources in the request that are not known based on any previous `DiagnosticReport-open` or `DiagnosticReport-update` events.

The Receiver shall keep track of the `context.versionId` of the `report` anchor context, regardless of whether it selected any content or not.

> Note: This is important so that the Receiver can use this `context.versionId` to detect if it missed some prior events before the received event. The Receiver is expected to process all events sequentially. So if the Receiver identified that it missed some prior events, then it can use the Get Current Context [RAD-X8](rad-x8.html) transaction to retrieve the latest context and content from the Manager.

The Receiver shall *select* the corresponding `event.context` according to its application logic. For example,
- An Image Display may display or *put in focus* the comparison study referenced by an `ImagingStudy`, or annotation referenced by an `ImagingSelection`.
- A Report Creator may add select an nodule and its measurement referenced by an `ImagingSelection` and an `Observation` resource respectively.

The Receiver may provide application logic that can make use of the selected resources. In this case, the Receiver shall apply the application logic to the selected resources. For example, a nodule (as `ImagingSelection`) and corresponding measurements (as `Observation`) are selected. Then the radiology issues a command, say "insert hyperlink". In this case, the Receiver applies the command with the most recent selected resources and insert a hyperlink reference to the nodule with measurement.

If the Receiver accepted the event initially (i.e. return `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Manager using Send SyncError Event [RAD-X10](rad-10.html).

### 2:3.X6.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X6.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
