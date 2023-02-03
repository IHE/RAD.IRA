### 2:3.X4.1 Scope

This transaction is used to terminate a report context that all synchronizing applications will close their respective context.

### 2:3.X4.2 Actors Roles

**Table 2:3.X4.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Terminate a report context | Subscriber |
| Manager | Receives and delete anchor context<br>and forward events to other Receivers | Hub |
| Receiver | Receives termination event and close the context | Subscriber (See note 1) |
{: .grid}

> Note 1: The Receiver Role is played by Subscribers subscribed to the event. This may include the original Sender as well as other Subscribers.

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

The Sender completed an existing report context.

##### 2:3.X4.4.1.2 Message Semantics

This message is an HTTP POST request. The Sender is the User Agent. The Manager is the Origin Server.

The Sender shall send a HTTP POST request to the Receiver `hub.url`.

The `Content-Type` of the request shall be `application/json`.

The body of the request shall have the attributes according to [Section 2.6.1 Request Context Change body](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body).

The `event.context` shall conform to [DiagnosticReport close Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-2-diagnosticreport-close.html).

If the Sender retries the same request due to a timeout, then the Sender shall use the same `event.id` such that the Manager can detect if it is a duplicate message.

If the Sender retries the same request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X4.4.1.3 Expected Actions

The Manager shall validate the request as follow:

* If `timestamp`, `id` or `event` are not set, then return an error
* If `event.context` does not include `report`, then return an error
* If the `report` context does not include `resource.id`, then return an error
* if `event`.`hub.topic` is not a known topic, then return an error

If the Manager accepts the request, then the Manager shall delete the `report` context of the received `DiagnosticReport-close` event, as well as all associated context and content.

The Manager shall set the `current context` to the last context that was initiated by a `[FHIR resource]-open` event and has not been terminated by a corresponding `[FHIR resource]-close` event. If there is no such context, then the Manager shall set the `current context` to *empty*.

The Manager shall broadcast the event to all subscribers that subscribed to the received event using Send Context Event [RAD-X9](rad-x9.html).

#### 2:3.X4.4.2 Close Report Context Response Message

##### 2:3.X4.4.2.1 Trigger Events

The Manager finished process the Close Report Context request.

##### 2:3.X4.4.2.2 Message Semantics

If the Manager accepted the Close Report Context request, then the Manager shall send a 2xx HTTP status:

* If the Manager processed the request successfully, then it shall return 200 OK
* If the Manager processed the request asynchronously, then it may return 202 Accepted

If the Manager rejected the Close Report Context request, then the Manager shall return a 4xx or 5xx HTTP error response code.

##### 2:3.X4.4.2.3 Expected Actions

If the response is a success, then no further action expected.

If the response is an error, then the Sender may consider retrying the request.

#### 2:3.X4.4.3 Terminate Report Context Message

##### 2:3.X4.4.3.1 Trigger Events

The Receiver receives a `DiagnosticReport-close` event from Manager via Send Context Event [RAD-X9](rad-x9.html).

> Note: This message is not a traditional message in a transaction between two devices; the primary focus is on the required behavior of the Receiver upon receiving the event from the Manager triggered by the request from the Sender. The Send Context Event [RAD-X9](rad-x9.html) specifies the general requirement between the Manager and the Receiver and it is agnostic about the specific event.

##### 2:3.X4.4.3.1 Message Semantics

The Receiver shall *close* the corresponding `event.context` according to its application logic. In particular,
- An Image Display shall close the display of patient's study.
- A Report Creator shall close the procedure. It may use the `id` in the `report` context as the report ID for the eventual created report.
- An Evidence Creator shall close the patient's study.

If the Receiver accepted the event initially (i.e. return `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Manager using Send SyncError Event [RAD-X10](rad-10.html).

### 2:3.X4.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X4.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
