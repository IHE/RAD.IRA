### 2:4.X12.1 Scope

This transaction is used to update report status in a report context.

### 2:4.X12.2 Actors Roles

**Table 2:4.X12.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Update report status in a report context | Report Creator |
| Manager | Updates the report status | Hub |
{: .grid}

### 2:4.X12.3 Referenced Standards

**FHIRcast**: [Content Sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html)

**FHIRcast**: [DiagnosticReport update Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-3-diagnosticreport-update.html)

**FHIR R5**: [DiagnosticReport resource](https://hl7.org/fhir/R5/diagnosticreport.html)

### 2:4.X12.4 Messages

<div>
{%include rad-x12-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:4.X12.4-1: Interaction Diagram**

#### 2:4.X12.4.1 Update Report Status Request Message
The Sender sends an event to the Manager to update the report status to an existing report context. The Sender shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Sender. 

##### 2:4.X12.4.1.1 Trigger Events

The Sender determines to update the report status of a report context.

##### 2:4.X12.4.1.2 Message Semantics

This message is a [FHIRcast Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body) request. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The `event.context` shall conform to [DiagnosticReport update Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-3-diagnosticreport-update.html).

The `event`.`context.versionId` shall be the newest version ID of the report context known to the Sender.

The Sender shall include a `DiagnosticReport` resource with updated status (conform to [DiagnosticReportStatusUpdate](StructureDefinition-diagnosticreportstatusupdate.html)). The Sender may include other applicable content changes as inline [contained resources](https://www.hl7.org/fhir/references.html#contained). However, in some situations, it is beneficial to include other resources by reference instead of by value. In this case, the Sender shall specify the `entry.fullurl` with the uri value that the full content can be retrieved.

> Note: Using contained resources is preferred as most resources in the event are transient. Also other Subscribers that receive the events may or may not have permission to access referenced resources that are not inline.

If the Sender is retrying this context change request due to not receiving a response from the Manager for a prior request, then the Sender shall use the same `event.id`. If the Manager received the original request, this allows it to detect that it is a duplicate message.

If the Sender retries the request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new request.

##### 2:4.X12.4.1.3 Expected Actions

The Manager shall receive and validate the request. See Section 2:4.X12.4.2.2 for error conditions.

Per FHIRcast,
- If the `context.versionId` in the request does not match the version ID of the `report` anchor context, then the Manager will not apply any updates.
- The Manager will apply the report status update as well as other applicable context changes in the request *atomically*. i.e. The Manager will apply all updates or none of the updates.
- If the Manager successfully applies all updates in the request, it will assign a new version ID to the `report` anchor context.

#### 2:4.X12.4.2 Update Report Status Response Message

##### 2:4.X12.4.2.1 Trigger Events

The Manager finishes processing the Update Report Content request.

##### 2:3.X12.4.2.2 Message Semantics

This message is a [FHIRcast Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body) response. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The Manager shall return `400` Bad Request error:
- if `timestamp`, `id` or `event` are not set
- if `event.context` does not include `report` and `updates`
- if `event`.`hub.topic` is not a known session
- if `context.versionId` does not match the latest version ID of the `report` anchor context
- if `updates` context key includes an entry to delete the `patient` context or update the patient ID in the resource `identifier`
- if `updates` context key includes an entry to delete the `study` context or update the study instance UID or accession number in the resource `identifier`

> Note: If the report context is opened with incorrect patient and/or study, the Subscriber should close the report context and open a new report context with the correct patient and/or study context, rather than using a DiagnosticReport-update event to correct the context.

If the Manager rejected the Update Report Content request, then the Manager shall return a 4xx or 5xx HTTP error response code.

The Manager may return other applicable HTTP error status codes.

##### 2:4.X12.4.2.3 Expected Actions

If the response is an error, then the Sender may consider retrying the request.

### 2:4.X12.5 Security Considerations

See [IRA Security Considerations](volume-1.html#1xx5-ira-security-considerations).

Local policy should consider what users and systems have permissions to update report content and configure appropriately. 

#### 2:4.X12.5.1 Security Audit Considerations

This transaction is not associated with an ATNA Trigger Event.
