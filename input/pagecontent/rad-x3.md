### 2:3.X3.1 Scope

This transaction is used to initiate a report context that all synchronizing applications will be synchronized to.

### 2:3.X3.2 Actors Roles

**Table 2:3.X3.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Initiate a report context | Subscriber |
| Receiver | Receives and maintain anchor and current context | Hub |
{: .grid}

### 2:3.X3.3 Referenced Standards

**FHIRcast**: [Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change)

### 2:3.X3.4 Messages

<div>
{%include rad-X3-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X3.4-1: Interaction Diagram**

#### 2:3.X3.4.1 Emit Report Context Event Message
The Sender sends an event to the Receiver to change report context. The Sender shall support sending such messages to more than one Receiver.

The Receiver shall support handling such messages from more than one Sender. 

##### 2:3.X3.4.1.1 Trigger Events

The Sender identifies a new report context.

##### 2:3.X3.4.1.2 Message Semantics

This message is an HTTP POST request. The Sender is the User Agent. The Receiver is the Origin Server.

The Sender shall send a HTTP POST request to the Receiver `hub.url`.

The `Content-Type` of the request shall be `application/json`.

The body of the request shall have the attributes according to [Section 2.6.1 Request Context Change body](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body).

The `event.context` shall conform to [DiagnosticReport open Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-1-diagnosticreport-open.html).

Additional, the contexts in the `event.context` shall conform to the following table:

{:.grid}
Key | Optionality | FHIR operation to generate context | Description
--- | --- | --- | ---
`report`| REQUIRED | `DiagnosticReport/{id}?_elements=identifier` | Conform to the RTC-IMR-DiagnosticReport resource
`patient` | REQUIRED | `Patient/{id}?_elements=identifier` | Conform to the RTC-IMR-Patient resource
`study` | REQUIRED | `ImagingStudy/{id}?_elements=identifier,accession` | COnform to the RTC-IMR-ImagingStudy resource

If the Sender retries the same request due to a timeout, then the Sender shall use the same `event.id` such that the Receiver can detect if it is a duplicate message.

If the Sender retries the same request due to an error response from the Receiver, then the Sender shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X3.4.1.3 Expected Actions

The Receiver shall validate the request as follow:

* If `timestamp`, `id` or `event` are not set, then return an error
* If `event.context` does not include `report`, `patient` and `study`, then return an error
* If each context does not conform to the corresponding resource definition, then return an error
* if `event`.`hub.topic` is not a known topic, then return an error

If the Receiver accepts the request, then the Receiver shall set the current context to be the `report` context of the received DiagnosticReport-open event.

#### 2:3.X3.4.2 Connect to Websocket Response Message

##### 2:3.X3.4.2.1 Trigger Events

The Receiver finished process the Change Report Context request.

##### 2:3.X3.4.2.2 Message Semantics

If the Receiver accepted the Change Report Context request, then the Receiver shall send a 2xx HTTP status:

* If the Receiver processed the request successfully, then it shall return 200 OK or 201 Created
* If the Receiver processed the request asynchronously, then it may return 202 Accepted

If the Receiver rejected the Change Report Context request, then the Receiver shall return a 4xx or 5xx HTTP error response code.

##### 2:3.X3.4.2.3 Expected Actions

If the response is a success, then no further action expected.

If the response is an error, then the Sender may consider retrying the request.

### 2:3.X3.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X3.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
