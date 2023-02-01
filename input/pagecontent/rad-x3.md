### 2:4.X3.1 Scope

This transaction is used to initiate a report context that all subscribed applications will be synchronized to.

### 2:4.X3.2 Actors Roles

**Table 2:4.X3.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Initiates a report context | Subscriber |
| Manager | Receivez and maintainz anchor and current context<br>and forwards events to other Receivers | Hub |
| Receiver | Receives events from Manager | Subscriber (See nNte 1) |
{: .grid}

> Note 1: The Receiver Role is played by Subscribers subscribed to the event. This may include the original Sender as well as other Subscribers.

### 2:4.X3.3 Referenced Standards

**FHIRcast**: [Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change)

### 2:4.X3.4 Messages

<div>
{%include rad-x3-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:4.X3.4-1: Interaction Diagram**

#### 2:4.X3.4.1 Open Report Context Request Message
The Sender sends an event to the Manager to initiate a new report context. The Sender shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Sender. 

##### 2:4.X3.4.1.1 Trigger Events

The Sender identifies a new report context.

##### 2:4.X3.4.1.2 Message Semantics

This message is an HTTP POST request. The Sender is the User Agent. The Manager is the Origin Server.

The Sender shall send a HTTP POST request to the Receiver `hub.url`.

The `Content-Type` of the request shall be `application/json`.

The body of the request shall have the attributes according to [Section 2.6.1 Request Context Change body](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body).

The `event.context` shall conform to [DiagnosticReport open Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-1-diagnosticreport-open.html).

In addition, the contexts in the `event.context` shall conform to the following table:

**Table 2:4.X3.4.1.2-1: Requirements for event.context**

Key | Optionality | FHIR operation to generate context | Description
--- | --- | --- | ---
`report`| REQUIRED | `DiagnosticReport/{id}?_elements=identifier` | Conform to the RTC-IMR-DiagnosticReport resource
`patient` | REQUIRED | `Patient/{id}?_elements=identifier` | Conform to the RTC-IMR-Patient resource
`study` | REQUIRED | `ImagingStudy/{id}?_elements=identifier,accession` | Conform to the RTC-IMR-ImagingStudy resource
{:.grid}

If the Sender retries the same request due to a timeout, then the Sender shall use the same `event.id` such that the Manager can detect that it is a duplicate request message.

If the Sender retries the same request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new request message.

##### 2:4.X3.4.1.3 Expected Actions

The Manager shall validate the request as follows:

* If `timestamp`, `id` or `event` are not set, then return an error.
* If `event.context` does not include `report`, `patient` and `study`, then return an error.
* If any context does not conform to the corresponding resource definition, then return an error.
* if `event`.`hub.topic` is not a known topic, then return an error.

If the Manager accepts the request, then the Manager shall set the current context to be the `report` context of the received DiagnosticReport-open event.

The Manager shall broadcast the event to all Senders that subscribed to the received event using Send Context Event [RAD-X9](rad-x9.html).

#### 2:4.X3.4.2 Open Report Context Response Message

##### 2:4.X3.4.2.1 Trigger Events

The Manager finished processing the Open Report Context request.

##### 2:4.X3.4.2.2 Message Semantics

If the Manager accepts the Open Report Context request, then the Manager shall send a 2xx HTTP status:

* If the Manager processed the request successfully, then it shall return 200 OK or 201 Created.
* If the Manager processed the request asynchronously, then it may return 202 Accepted.

If the Manager rejects the Open Report Context request, then the Manager shall return a 4xx or 5xx HTTP error response code.

##### 2:4.X3.4.2.3 Expected Actions

If the response is a success, then no further action is expected.

If the response is an error, then the Sender may retry the request.

#### 2:4.X3.4.3 Initiate Report Context Message

##### 2:4.X3.4.3.1 Trigger Events

The Receiver receives a `DiagnosticReport-open` event from a Manager via Send Context Event [RAD-X9](rad-x9.html).

> Note: This message is not a traditional message in a transaction between two actors; the primary focus is on the required behavior of the Receiver upon receiving the event from the Manager, triggered by the request from the Sender. The Send Context Event [RAD-X9](rad-x9.html) specifies the general requirement between the Manager and the Receiver and that transaction is agnostic about the specific event.

##### 2:4.X3.4.3.1 Message Semantics

The Receiver shall keep track of the `report` context (i.e. the anchor context).

> Note: This is important because although the `DiagnosticReport-open` event includes other associated contexts such as `patient` and `study` in addition to the `report` anchor context, subsequent event(s) for this anchor context will only provide the `report` context. Therefore, keeping track of the `report` anchor context, regardless of whether the Receiver actually uses the context in its business logic, enables the Receiver to match subsequent events and hence react accordingly. 

The Receiver shall *open* the corresponding `event.context` according to its application logic. In particular,
- An Image Display shall display the patient's study corresponding to the `patient` and `study` context.
- A Report Creator shall open the procedure corresponding to the `patient` and `study` context and be ready for reporting. It may use the `id` in the `report` context as the report ID for the eventual created report.
- An Evidence Creator shall process the patient's study corresponding to the `patient` and `study` context.

If the Receiver fails to process the event, it shall return a `syncerror` to the Manager using Send SyncError Event [RAD-X10](rad-10.html).

### 2:4.X3.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:4.X3.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### 2:4.X3.5.1.1 Sender Audit 

''TODO: the specifics''

##### 2:4.X3.5.1.2 Manager Audit 

''TODO: the specifics''

##### 2:4.X3.5.1.3 Receiver Audit 

''TODO: the specifics''
