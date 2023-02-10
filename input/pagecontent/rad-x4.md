### 2:3.X4.1 Scope

This transaction is used to terminate a report context. All synchronizing applications are expected to close their local copy of this context.

### 2:3.X4.2 Actors Roles

**Table 2:3.X4.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Terminates a report context | Image Display<br>Report Creator<br>Worklist Client |
| Manager | Deletes report context and notifies Subscribers | Hub |
{: .grid}

### 2:3.X4.3 Referenced Standards

**FHIRcast**: [Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change)

**FHIRcast**: [DiagnosticReport close Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-2-diagnosticreport-close.html)

### 2:3.X4.4 Messages

<div>
{%include rad-x4-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X4.4-1: Interaction Diagram**

#### 2:3.X4.4.1 Close Report Context Request Message
The Sender sends an event to the Manager to terminate an existing report context. The Sender shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Sender. 

##### 2:3.X4.4.1.1 Trigger Events

The Sender completes the report corresponding to this report context.

##### 2:3.X4.4.1.2 Message Semantics

This message is a [FHIRcast Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body) request. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The `event.context` shall conform to [DiagnosticReport close Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-2-diagnosticreport-close.html).

If the Sender retries the same request due to a timeout, then the Sender shall use the same `event.id` such that the Manager can detect if it is a duplicate message.

If the Sender retries the same request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X4.4.1.3 Expected Actions

The Manager shall validate the request as follow:

* If `timestamp`, `id` or `event` are not set, then return an error
* If `event.context` does not include `report`, then return an error
* If the `report` context does not include `resource.id`, then return an error
* if `event`.`hub.topic` is not a known session, then return an error

If the Manager accepts the request, then
- Per FHIRcast [Section 2.9.2 Get Current Context Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-9-GetCurrentContext.html#get-current-context-response), the Manager shall set the `current context` to the newest context that was initiated by a `[FHIR resource]-open` event and has not been terminated by a corresponding `[FHIR resource]-close` event. If there is no such context, then the Manager shall set the `current context` to *empty*.
- The Manager shall delete the `report` context of the received `DiagnosticReport-close` event, as well as all associated context and content.

#### 2:3.X4.4.2 Close Report Context Response Message

##### 2:3.X4.4.2.1 Trigger Events

The Manager finishes processing the Close Report Context request.

##### 2:3.X4.4.2.2 Message Semantics

This message is a [FHIRcast Request Context Change]() response. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X4.4.2.3 Expected Actions

If the response is an error, then the Sender may consider retrying the request.

### 2:3.X4.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X4.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
