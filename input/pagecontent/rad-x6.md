### 2:3.X6.1 Scope

This transaction is used to select report context and content.

### 2:3.X6.2 Actors Roles

**Table 2:3.X6.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Selects report content(s) | Content Creator |
| Manager | Manages contents in the context that are selected and notifies Subscribers | Hub |
{: .grid}

### 2:3.X6.3 Referenced Standards

**FHIRcast**: [Content Sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html)

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

The Sender determines some report context / content are selected automatically or manually by a user, and coordinates the selection with other Subscribers.

The Sender determines that the selected content are no longer required and reset the selection.

##### 2:3.X6.4.1.2 Message Semantics

This message is a [FHIRcast Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body) request. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The `event.context` shall conform to [DiagnosticReport select Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-4-diagnosticreport-select.html).

The `event`.`context.versionId` shall be the newest version ID of the report context known to the Sender.

The Sender shall include all selected resources in the event, including resources that were selected previously and remain selected for this event.

> Note: This is necessary because there is an implicit unselect of any previously selected resources for each new `DiagnosticReport-select` event received. See [DiagnosticReport select Event Workflow](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-4-diagnosticreport-select.html#workflow) for details.

If the Sender retries the same request due to a timeout, then the Sender shall use the same `event.id` so the Manager can detect that it is a duplicate message.

If the Sender retries the same request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X6.4.1.3 Expected Actions

The Manager shall validate the request as follow:

* If `timestamp`, `id` or `event` are not set, then return an error
* If `event.context` does not include `report` and `select`, then return an error
* if `event`.`hub.topic` is not a known session, then return an error
* If `context.versionId` does not match the latest version ID of the `report` anchor context, then return an error

The Manager shall keep track of what contents are being selected. In particular:
- All previously selected contents shall be unselected
- All referenced resources in the request shall be selected

The Manager shall ignore any selected resources in the request that are not known based on any previous `DiagnosticReport-open` or `DiagnosticReport-update` events.

#### 2:3.X6.4.2 Select Report Content Response Message

##### 2:3.X6.4.2.1 Trigger Events

The Manager finishes processing the Select Report Content request.

##### 2:3.X6.4.2.2 Message Semantics

This message is a [FHIRcast Request Context Change]() response. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X6.4.2.3 Expected Actions

If the response is an error, then the Sender may consider retrying the request.

### 2:3.X6.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X6.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
