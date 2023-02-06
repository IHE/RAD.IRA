### Issues

#### Open Issues

* Q: Should the application that initiated the report context be the one that terminate the report context?<br><br>Is it valid for one application to initiate the report context and then another application to terminate the same report context? In this case, there is some implicit coordination between these two applications (e.g. by configuration) that is outside the scope of this profile.

* Q: Should Evidence Creator be required to support Initiate Reporting Session [RAD-X1]?<br><br>Often an Evidence Creator is invoked on demand by an Image Display. As a result, it is unlikely that an Evidence Creator is the actor that initiates a reporting session.

* Q: Should simplified JSON representation of DICOM SR be supported as a payload for content sharing?<br><br>DICOM SR with TID 1500 is used in the IHE AIR profile to capture various kind of evidence. In DICOM, [Supp219](https://www.dicomstandard.org/News-dir/ftsup/docs/sups/Sup219.pdf) defines a simplified JSON representation of structured report, with the intention that this is a simpler format to generate and hence can be used as an output from AI models.

#### Closed Issues

* Q: Should [SMART-web-messaging](https://build.fhir.org/ig/HL7/smart-web-messaging/index.html) be included in this profile?<br><br>A: No.<br>SMART-web-messaging currently is limited to web applications running in the same browser only. If there are demand for this integration, a separate profile can be created so that implementations can document what methods they support.

* Q: Should this profile specify other events other than the `DiagnosticReport-*` events?<br><br>For example, can the same topic be used to communicate `ImagingStudy-*` events?<br><br> A: No. This profile focus on the communication need during a reporting session. Other events are allowed but they are not defined in this profile. Hence the semantics of how these other events are used are up to the implementations. It is important to note that these other events may interfere the current context maintained in the hub for the reporting session. This is because the Hub will set the current context to be the last `[FHIR reosurce]-open` event that without a corresponding `[FHIR resource]-close` event. Therefore different events communicating through the same reporting session may unintentionally switch the current context in all connected applications. Therefore a separate session may be beneficial although this is out of scope in this profile. 
