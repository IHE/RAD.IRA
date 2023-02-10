### Issues

#### Open Issues

* Q: Should the Evidence Creator actor be required to support content sharing and update the context with evidence data it generated?<br><br>An Evidence Creator supports creating evidence data such as measurements, annotations, etc. However, it may not support capturing the evidence using FHIR resources and not able to share them back to the reporting session using Update Request Content [RAD-X5]. Therefore there may be two levels of support on this profile by an Evidence Creator: (1) as a consumer only, (2) can also publish evidence as FHIR resources and share back to the reporting session.

* Q: Should simplified JSON representation of DICOM SR be supported as a payload for content sharing?<br><br>DICOM SR with TID 1500 is used in the IHE AIR profile to capture various kind of evidence. In DICOM, [Supp219](https://www.dicomstandard.org/News-dir/ftsup/docs/sups/Sup219.pdf) defines a simplified JSON representation of structured report, with the intention that this is a simpler format to generate and hence can be used as an output from AI models.

* Q: Should SMART on FHIR application launch be available as a named option?

#### Closed Issues

* Q: Should [SMART-web-messaging](https://build.fhir.org/ig/HL7/smart-web-messaging/index.html) be included in this profile?<br><br>A: No.<br>SMART-web-messaging currently is limited to web applications running in the same browser only. If there are demand for this integration, a separate profile can be created so that implementations can document what methods they support.

* Q: Should this profile specify other events other than the `DiagnosticReport-*` events?<br><br>For example, can the same session be used to communicate `ImagingStudy-*` events?<br><br> A: No. This profile focus on the communication need during a reporting session. Other events are allowed but they are not defined in this profile. Hence the semantics of how these other events are used are up to the implementations. It is important to note that these other events may interfere the current context maintained in the hub for the reporting session. This is because the Hub will set the current context to be the last `[FHIR reosurce]-open` event that without a corresponding `[FHIR resource]-close` event. Therefore different events communicating through the same reporting session may unintentionally switch the current context in all connected applications. Therefore a separate session may be beneficial although this is out of scope in this profile. 

* Q: Should Evidence Creator be required to support Initiate Reporting Session [RAD-X1]?<br><br>Often an Evidence Creator is invoked on demand by an Image Display. As a result, it is unlikely that an Evidence Creator is the actor that initiates a reporting session.<br><br>A: No. It is not expected that an Evidence Creator will start a new session and drives other applications.

* Q: Should the application that initiated the report context be the one that terminate the report context?<br><br>Is it valid for one application to initiate the report context and then another application to terminate the same report context? In this case, there is some implicit coordination between these two applications (e.g. by configuration) that is outside the scope of this profile.<br><br>No. FHIRcast stated that the app that initiates a new context may not be the app that terminates the same context.