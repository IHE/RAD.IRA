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

A Sender uses this transaction when:
- It determines that work should begin on a new report, and initiates a new context to coordinate that work with other Subscribers.
- It determines to resume a previously opened report that has not yet complete, and initiates the same context to coordinate that work with other Subscribers.

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

If the Sender resumes a previously opened report, then the Sender shall assign a new `event.id` for the same `report`, `patient` and `study` contexts.

If the Sender retries the same request due to a timeout, then the Sender shall use the same `event.id` so the Manager can detect that it is a duplicate message.

If the Sender retries the same request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X3.4.1.3 Expected Actions

The Manager shall receive and validate the request.

Per FHIRcast, this `report` context will become the current context in this reporting session.

If the `report`, `patient` and `study` contexts in the request match an existing report context and the report context has not been terminated, then the Manager shall update the existing report context and set it to be the current context.

> Note: In other words, the Manager brings the existing report context forward to become the new current context, rather than maintaining two separate opened report contexts with the same `report`, `patient` and `study` contexts.

#### 2:3.X3.4.2 Open Report Context Response Message

##### 2:3.X3.4.2.1 Trigger Events

The Manager finishes processing the Open Report Context request.

##### 2:3.X3.4.2.2 Message Semantics

This message is a [FHIRcast Request Context Change]() response. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The Manager shall return `400` Bad Request error if:
* If `timestamp`, `id` or `event` are not set
* If `event.context` does not include `report`, `patient` and `study`
* if `event`.`hub.topic` is not a known session
* If `report` context in the request matches an existing report context in Manager, but either `patient` or `study` or both context do not match

The Manager may return other applicable HTTP error status codes.

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
