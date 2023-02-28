### 2:3.X5.1 Scope

This transaction is used to add, change or remove contents in a report context.

### 2:3.X5.2 Actors Roles

**Table 2:3.X5.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Sender | Adds, changes or removes report contents | Content Creator |
| Manager | Updates the report context | Hub |
{: .grid}

### 2:3.X5.3 Referenced Standards

**FHIRcast**: [Content Sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html)

**FHIRcast**: [DiagnosticReport update Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-3-diagnosticreport-update.html)

### 2:3.X5.4 Messages

<div>
{%include rad-x5-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X5.4-1: Interaction Diagram**

#### 2:3.X5.4.1 Update Report Content Request Message
The Sender sends an event to the Manager to add, change or remove content relevant to an existing report context. The Sender shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Sender. 

##### 2:3.X5.4.1.1 Trigger Events

The Sender determines new content should be added, existing content should be changed, or existing content should be removed from a report context.

##### 2:3.X5.4.1.2 Message Semantics

This message is a [FHIRcast Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body) request. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The `event.context` shall conform to [DiagnosticReport update Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-3-diagnosticreport-update.html).

The `event`.`context.versionId` shall be the newest version ID of the report context known to the Sender.

The Sender should include referenced resources (with applicable content changes) as inline [contained resources](https://www.hl7.org/fhir/references.html#contained) if possible. However, in some situations, it is beneficial to include other resources by reference instead of by value. In this case, the Sender shall specify the `entry.fullurl` with the uri value that the full content can be retrieved.

> Note: Using contained resources is preferred as most resources in the event are transient. Also other Subscribers that receive the events may or may not have permission to access referenced resources that are not inline.

If the Sender is retrying this context change request due to not receiving a response from the Manager for a prior request, then the Sender shall use the same `event.id`. If the Manager received the original request, this allows it to detect that it is a duplicate message.

If the Sender retries the request due to an error response from the Manager, then the Sender shall assign a new `event.id` to indicate that it is a new request.

##### 2:3.X5.4.1.3 Expected Actions

The Manager shall receive and validate the request. See 2:3.X5.4.2.2 for error conditions.

Per FHIRcast,
- If the `context.versionId` in the request does not match the version ID of the `report` anchor context, then the Manager will not apply any updates.
- The Manager will apply the set of updates in the request *atomically*. i.e. The Manager will apply all updates or none of the updates.
- If the Manager successfully applies all updates in the request, it will assign a new version ID to the `report` anchor context.

#### 2:3.X5.4.2 Update Report Content Response Message

##### 2:3.X5.4.2.1 Trigger Events

The Manager finishes processing the Update Report Content request.

##### 2:3.X5.4.2.2 Message Semantics

This message is a [FHIRcast Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body) response. The Sender is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The Manager shall return `400` Bad Request error if:
* If `timestamp`, `id` or `event` are not set
* If `event.context` does not include `report` and `updates`
* if `event`.`hub.topic` is not a known session
* If `context.versionId` does not match the latest version ID of the `report` anchor context

If the Manager rejected the Update Report Content request, then the Manager shall return a 4xx or 5xx HTTP error response code.

The Manager may return other applicable HTTP error status codes.

##### 2:3.X5.4.2.3 Expected Actions

If the response is an error, then the Sender may consider retrying the request.

### 2:3.X5.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X5.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
