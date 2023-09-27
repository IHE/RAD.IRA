## Significant Changes

### Significant Changes From Revision 1.0.0-comment 

This is the initial trial implementation release of the IRA Implementation Guide. It has been updated based on public comments.

## Issues

### Submit an Issue
IHE welcomes [New Issues](https://github.com/IHE/RAD.IRA/issues/new/choose) from the GitHub community. 
For those without GitHub access, issues may be submitted to the [Radiology Public Comment form](https://www.ihe.net/Radiology_Public_Comments/).

As issues are submitted they will be managed on the [IRA GitHub Issues](https://github.com/IHE/RAD.IRA/issues), where discussion and workarounds may be found. These issues, when critical, will be processed using the normal [IHE Change Proposal](https://wiki.ihe.net/index.php/Category:CPs) management and balloting. 
It is important to note that as soon as a Change Proposal is approved, it carries the same weight as a published Implementation Guide (i.e., it is testable at an [IHE Connectathon](https://www.ihe.net/participate/connectathon/) from the time it is approved, even if it will not be integrated until several months later).

### Open Issues

None

### Closed Issues

Q: Are there any other context sharing use cases related to reporting that are not covered in this profile?<br><br>
A: No.<br>
This profile covers the following use cases:
- Two applications context sharing (e.g., between PACS (Image Display) and Reporting System (Report Creator)
- Multiple applications context sharing (e.g., Worklist (Worklist Client) drives PACS (Image Display) and Reporting System (Report Creator), and PACS in turn drives a Specialty App (Evidence Creator))
- Content sharing in additional to context sharing (e.g., share measurement and image references)
- Suspend and Resume
- Error handling from any synchronizing application
- Overread draft report
<br><br>

Q: Should the Evidence Creator be required to support content sharing and update the context with evidence data it generated?<br><br>
A: No.<br>
An Evidence Creator here is a consumer of events. It can be grouped with a Content Creator if it can also support content sharing for the output it generates using update events. An Evidence Creator supports creating evidence data such as measurements, annotations, etc. However, it may not support capturing the evidence using FHIR resources and not able to share them back to the reporting session using Update Request Content [RAD-150].<br><br>

Q: Should [SMART-web-messaging](https://build.fhir.org/ig/HL7/smart-web-messaging/index.html) be included?<br><br>
A: No.<br>
SMART-web-messaging currently is limited to web applications running in the same browser only. If there are demand for this integration, a separate profile can be created so that implementations can document what methods they support.<br><br>

Q: Should this profile specify events other than the `DiagnosticReport-*` events?<br><br>
A: No.<br>
This profile focus on the communication need during a reporting session. Other events such as `ImagingStudy-*` are allowed but they are not defined in this profile. Hence the semantics of how these other events are used are up to the implementations. It is important to note that these other events may interfere the current context maintained in the hub for the reporting session. This is because the Hub will set the current context to the last `[FHIR resource]-open` event sent without a corresponding `[FHIR resource]-close` event. Therefore different events communicating through the same reporting session may unintentionally switch the current context in all connected applications. A separate session may be beneficial although this is out of scope in this profile.<br><br>
Q: Should Evidence Creator be required to support Open Report Context [RAD-148]?<br><br>
A: No.<br>
It is not expected that an Evidence Creator will start a new session and drives other applications by changing report context. Often an Evidence Creator is invoked on demand by an Image Display.<br><br>

Q: Should the Hub be permitted to set/change the current context based on its business logic?<br><br>
A: No.<br>
Current context is fully dictated by `*-open` and `*-close` events, and the Hub is not permitted to originate these events.<br><br>

Q: Should there be a dedicated transaction for report status update and this transaction is required only by the Report Creator?<br><br>
A: No.<br>
Not a separate dedicated transaction because the Report Creator may want to include other updates in the same DiagnosticReport-update event besides status update. This effectively is the existing Update Report Content transaction. So the requirement is stated in the Report Creator actor description. This keeps the transaction general and reusebale while keeping update report status as a profile actor requirement.<br>This also implies other content creators may modify the report status, but this needs to be approached carefully.<br><br>

Q: Should simplified JSON representation of DICOM SR be supported as a payload for content sharing?<br><br>
A: Out of scope for IRA.<br><br>

Q: Should Notify Error [RAD-156] be mandatory for all Subscribers?<br><br>
A: No, it is not mandatory.<br>
Notify Error [RAD-156] is used when a Subscriber initially accepted an event and later returned an error due to processing error. This means technically for a Subscriber that always processes events synchronously, there is no need to support Notify Error. Due to the nature of the expected use cases and the additional complexity in asynchronous processing, not all Subscribers will support it and hence no need to use Notify Error.<br><br>

Q: Should SMART on FHIR application launch be available as a named option?<br><br>
A: No.<br>
IRA is not prescribing a specific application launching mechanism. There are many different mechanisms used in deployment today.<br><br>

Q: Is there a need for the Subscriber to notify the Manager when asynchronous (return `202 Accepted`) processing completed successfully?<br><br>
A: Cannot identify a need for this.<br>
FHIRcast does not specify a method to notify the Hub about successful processing. Error can be communicated using syncerror.<br><br>

Q: Should the Report Creator be required to group with the Report Creator in Interactive Multimedia Report (IMR) profile?<br><br>
A: No.<br>
This grouping is mentioned in [Cross-Profile Considerations](volume-1.html#1536-ira-cross-profile-considerations), but not mandatory.<br><br>

Q: Can a Subscriber return rich error content using OperationOutcome with a 4xx / 5xx response code?<br><br>
A: No.<br>
In FHIRcast, the OperationOutcome is only available in SyncError event in case of an asynchronous response. For synchronous response, it can only return a simple HTTP error status in the response.<br><br>

Q: Should the event include the originating sender?<br><br>
A: Yes, but FHIRcast does not support this, and we do not have time to address this limitation with the FHIRcast working group.<br>
Having this information enables a Subscriber to make decisions on whether it should process the message and how, based on the originating sender.