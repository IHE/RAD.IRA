## Significant Changes

### Significant Changes From Previous Revision 

This is the trial implementation release of the IRA Implementation Guide.

## Issues

### Submit an Issue
IHE welcomes [New Issues](https://github.com/IHE/RAD.IRA/issues/new/choose) from the GitHub community. 
For those without GitHub access, issues may be submitted to the [Radiology Public Comment form](https://www.ihe.net/Radiology_Public_Comments/).

As issues are submitted they will be managed on the [IRA GitHub Issues](https://github.com/IHE/RAD.IRA/issues), where discussion and workarounds may be found. These issues, when critical, will be processed using the normal [IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting. 
It is important to note that as soon as a Change Proposal is approved, it carries the same weight as a published Implementation Guide (i.e., it is testable at an [IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is approved, even if it will not be integrated until several months later).

### Open Issues

- Q: Are there any other context sharing use cases related to reporting that are not covered in this profile?<br><br>This profile covers the following use cases:
    - Two applications context sharing (e.g., between PACS (Image Display) and Reporting System (Report Creator)
    - Multiple applications context sharing (e.g., Worklist (Worklist Client) drives PACS (Image Display) and Reporting System (Report Creator), and PACS in turn drives a Specialty App (Evidence Creator))
    - Content sharing in additional to context sharing (e.g., share measurement and image references)
    - Suspend and Resume
    - Error handling from any synchronizing application
      
- Q: Should the Evidence Creator actor be required to support content sharing and update the context with evidence data it generated?<br><br>An Evidence Creator supports creating evidence data such as measurements, annotations, etc. However, it may not support capturing the evidence using FHIR resources and not able to share them back to the reporting session using Update Request Content [RAD-150]. Therefore there may be two levels of support on this profile by an Evidence Creator: (1) as a consumer only, (2) can also publish evidence as FHIR resources and share back to the reporting session.

- Q: Should simplified JSON representation of DICOM SR be supported as a payload for content sharing?<br><br>DICOM SR with TID 1500 is used in the IHE AIR profile to capture various kind of evidence. In DICOM, [Supp219](https://www.dicomstandard.org/News-dir/ftsup/docs/sups/Sup219.pdf) defines a simplified JSON representation of structured report, with the intention that this is a simpler format to generate and hence can be used as an output from AI models.

- Q: Should SMART on FHIR application launch be available as a named option?

- Q: If a Subscriber performs the event asynchronously and return `202 Accepted`, should there be a way to notify the Manager if the processing eventually completed successfully?<br><br>FHIRcast does not specify a method to notify the Hub about successful processing. Error can be communicated using syncerror.

- Q: Should Hub be required to be capable of sending `DiagnosticReport-open` / `DiagnosticReport-update` / `DiagnosticReport-select` events when it resumes a previous report context?<br><br>In Hub [Event Producing Requirements](volume-1.html#1531172-event-producing-requirements), the Hub is required to be capable of implicitly send the corresponding `DiagnosticReport-*` event when it establishes a new context after closing a report context. If so, should the Hub be capable of support all three events, or only the `DiagnosticReport-open` event?

- Q: Should the Report Creator in this profile be grouped with the Report Creator in Interactive Multimedia Report (IMR) profile?<br><br>The Report Creator in this profile is generally applicable in a reporting session. On the other hand, the Report Creator in IMR can group with the Report Creator in this profile to leverage the `DiagnosticReport-* events` to create the multimedia report content. Current this grouping is mentioned in cross profile considerations, but not mandatory.

- Q: Should Notify Error [RAD-156] be mandatory for all Subscribers?<br><br>Notify Error [RAD-156] is used when a Subscriber initially accepted an event and later returned an error due to processing error. This means technically for a Subscriber that always processes events synchronously, there is no need to support Notify Error. However, asynchronous processing is expected to be widely supported due to better scalability and user experience.

- Q: Can a Subscriber returns rich error content using OperationOutcome when it turns a 4xx / 5xx response code?<br><br>In FHIRcast, the OperationOutcome is only available in SyncError event in case of an asynchronous response. For synchronous response, it can only returns a simple HTTP error status in the response.

- Q: Should the event includes the originating sender?<br><br>Currently FHIRcast event does not include the originating sender. However, having this information enables a Subscriber to make decisions on whether it should process the message and how, if the processing of the event depends on who originates it.

#### Closed Issues

- Q: Should [SMART-web-messaging](https://build.fhir.org/ig/HL7/smart-web-messaging/index.html) be included in this profile?<br><br>A: No.<br>SMART-web-messaging currently is limited to web applications running in the same browser only. If there are demand for this integration, a separate profile can be created so that implementations can document what methods they support.

- Q: Should this profile specify other events other than the `DiagnosticReport-*` events?<br><br>For example, can the same session be used to communicate `ImagingStudy-*` events?<br><br> A: No. This profile focus on the communication need during a reporting session. Other events are allowed but they are not defined in this profile. Hence the semantics of how these other events are used are up to the implementations. It is important to note that these other events may interfere the current context maintained in the hub for the reporting session. This is because the Hub will set the current context to be the last `[FHIR resource]-open` event that without a corresponding `[FHIR resource]-close` event. Therefore different events communicating through the same reporting session may unintentionally switch the current context in all connected applications. Therefore a separate session may be beneficial although this is out of scope in this profile. 

- Q: Should Evidence Creator be required to support Open Report Context [RAD-148]?<br><br>Often an Evidence Creator is invoked on demand by an Image Display. As a result, it is unlikely that an Evidence Creator is the actor that opens a report context.<br><br>A: No. It is not expected that an Evidence Creator will start a new session and drives other applications by changing report context.

- Q: Should the application that opened the report context be the one that close the report context?<br><br>Is it valid for one application to open the report context and then another application to close the same report context? In this case, there is some implicit coordination between these two applications (e.g., by configuration) that is outside the scope of this profile.<br><br>A: No. FHIRcast stated that the app that opens a new context may not be the app that closes the same context.

- Q: Can the Hub provide additional business logic to determine which context is the current context?<br><br>A: FHIRcast stated that the current context is the context in which there is a `*-open` event and there is no corresponding `*-close` event (Section [2.9.2 Get Current Context Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-9-GetCurrentContext.html#get-current-context-response)). The intention is to keep the Hub as simple as possible. Also since it does not have the business logic exists in the synchronized applications, it is more appropriate for the different Subscribers to change context if desired.

- Q: Should there be a dedicated transaction for report status update and this transaction is required only by the Report Creator?<br><br>A: Not a separate dedicated transaction because the Report Creator may want to include other updates in the same DiagnosticReport-update event besides status update. This effectively is the existing Update Report Content transaction. So the requirement is stated in the Report Creator actor description. This keeps the transaction general and reusebale while keeping update report status as a profile actor requirement.<br><br>This also implies other content creators may modify the report status, but this needs to be approached carefully.