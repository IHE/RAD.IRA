### 2:3.X3.1 Scope

This transaction is used to initiate a report context. Report contexts are initiated within an existing reporting session.

### 2:3.X3.2 Actors Roles

**Table 2:3.X3.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Initiates a report context | Image Display<br>Report Creator<br>Worklist Client |
| Manager | Manages initiated context | Hub |
{: .grid}

### 2:3.X3.3 Referenced Standards

**FHIRcast**: [Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change)

**FHIRcast**: [DiagnosticReport open Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-1-diagnosticreport-open.html)

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
Key | Optionality | Context Requirements
--- | --- | --
`report`| REQUIRED | Conform to the RTC-IMR-DiagnosticReport resource
`patient` | REQUIRED | Conform to the RTC-IMR-Patient resource
`study` | REQUIRED* | Conform to the RTC-IMR-ImagingStudy resource

> Note: Rows with '*' in the Optionality column have constraints different from baseline FHIRcast Request Context Change request.

If the Sender retries the same request due to a timeout, then the Sender shall use the same `event.id` so the Manager can detect that it is a duplicate message.

If the Sender retries the same request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X3.4.1.3 Expected Actions

The Manager shall validate the request as follow:

* If `timestamp`, `id` or `event` are not set, then return an error
* If `event.context` does not include `report`, `patient` and `study`, then return an error
* if `event`.`hub.topic` is not a known session, then return an error

Per FHIRcast, this `report` context will become the current context in this reporting session.

The Manager shall distribute the received event using [Distribute Context Events [RAD-X9]](rad-x9.html) to all Subscribers that listed this event type in their subscription.

#### 2:3.X3.4.2 Open Report Context Response Message

##### 2:3.X3.4.2.1 Trigger Events

The Manager finishes processing the Open Report Context request.

##### 2:3.X3.4.2.2 Message Semantics

This message is a [FHIRcast Request Context Change]() response. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X3.4.2.3 Expected Actions

If the response is an error, then the Sender may consider retrying the request.

### 2:3.X3.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X3.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
