### 2:3.X3.1 Scope

This transaction is used to initiate a report context to which other connected applications may be synchronized. Report contexts are initiated within an existing reporting session.

### 2:3.X3.2 Actors Roles

**Table 2:3.X3.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Initiates a report context | Image Display<br>Report Creator<br>Worklist Client |
| Manager | Manages initiated context and notifies Subscribers | Hub |
| Subscriber | Receives and reacts to notifications from Manager | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
{: .grid}

### 2:3.X3.3 Referenced Standards

**FHIRcast**: [Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change)

**FHIRcast**: [DiagnosticReport open Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-1-diagnosticreport-open.html)

**Websocket**: [IETF RFC 6455](https://www.rfc-editor.org/rfc/rfc6455)

### 2:3.X3.4 Messages

<div>
{%include rad-x3-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X3.4-1: Interaction Diagram**

#### 2:3.X3.4.1 Open Report Context Request Message
The Sender sends an event to the Manager to initiate a new report context. The Sender shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Sender. 

##### 2:3.X3.4.1.1 Trigger Events

The Sender determines that work should begin on a new report, and initiates a new context to coordinate that work with other Subscribers.

##### 2:3.X3.4.1.2 Message Semantics

This message is a [FHIRcast Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body) request. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The `event.context` shall conform to [DiagnosticReport open Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-1-diagnosticreport-open.html).

Additional, the contexts in the `event.context` shall conform to the Table 2:3.X3.4.1.2-1:

Table 2:3.X3.4.1.2-1: Context Requirements
{:.grid}
Key | Optionality | Description
--- | --- | --
`report`| REQUIRED | Conform to the RTC-IMR-DiagnosticReport resource
`patient` | REQUIRED | Conform to the RTC-IMR-Patient resource
`study` | REQUIRED* | Conform to the RTC-IMR-ImagingStudy resource

> Note: Rows with '*' in the Optionality column have constraints different from baseline FHIRcast Request Context Change request.

If the Sender retries the same request due to a timeout, then the Sender shall use the same `event.id` such that the Manager can detect if it is a duplicate message.

If the Sender retries the same request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X3.4.1.3 Expected Actions

The Manager shall validate the request as follow:

* If `timestamp`, `id` or `event` are not set, then return an error
* If `event.context` does not include `report`, `patient` and `study`, then return an error
* if `event`.`hub.topic` is not a known topic, then return an error

Per FHIRcast, this `report` context will become the current context in this reporting session.

#### 2:3.X3.4.2 Open Report Context Response Message

##### 2:3.X3.4.2.1 Trigger Events

The Manager finishes processing the Open Report Context request.

##### 2:3.X3.4.2.2 Message Semantics

This message is a [FHIRcast Request Context Change]() response. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X3.4.2.3 Expected Actions

If the response is an error, then the Sender may consider retrying the request.

#### 2:3.X3.4.3 Notification Message

##### 2:3.X3.4.3.1 Trigger Events

The Manager initiates a new report context.

##### 2:3.X3.4.3.2 Message Semantics

This message is a Send Context Event - Notification Message. See [Section 2:3.X9.4](rad-x9.html#23x94-messages).

##### 2:3.X3.4.3.3 Expected Actions

The Subscriber shall validate that the `report`, `patient` and `study` contexts conform to the corresponding resource definition, and return an error if they don't.

> Note: The `DiagnosticReport-open` event includes both the `report` anchor context and associated contexts `patient` and `study`. Subsequent event(s) for this anchor context will only provide the `report` context. Therefore, it is up to the Subscriber to record internally the `patient` and `study` contexts associated with the `report` anchor context if that information is relevant to its business logic. 

The Subscriber shall "open" the `report`, `patient` and `study` contexts according to Table 2:3.X3.4.3.3-1.

**Table 2:3.X3.4.3.3-1**: Event Handling Requirements
| Actor | Event Handling Requirements |
| -- | -- |
| Image Display | Display the study images |
| Report Creator | Open the procedure and be ready for reporting.<br>It may use the `id` in the `report` context as the report ID for the eventual created report.
| Worklist Client | Display the patient's study data |
| Evidence Creator | Process the patient's study |
| Watcher | None |
{: .grid}

The Subscriber may support additional business logic to handle the event.

> Note: Occasionally, the same `report` anchor context may be re-opened. [Use Case #3: Interruption and Resume Flow](volume-1.html#1xx423-use-case-3-interruption-and-resume-flow) and FHIRcast [Section 4.4 Multi-tab Considerations](https://build.fhir.org/ig/HL7/fhircast-docs/4-4-multitab-considerations.html) are two examples this may happen. In these cases, the Subscriber may behave differently compared to when the event was first received.
>
> For example, an Evidence Creator may skip executing the expensive processing on the patient's study if the report context is re-open and the evidence data from previous execution is still available and valid. 

If the Subscriber accepted  the event initially (i.e. return `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Manager using Send SyncError Event [RAD-X10](rad-10.html).

#### 2:3.X3.4.4 Notification Response Message

This message is a Send Context Event - Notification Response Message. See [Section 2:3.X9.4.2](rad-x9.html#23x942-notification-response-message).

### 2:3.X3.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X3.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
