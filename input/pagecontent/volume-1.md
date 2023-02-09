The Realtime Bidirectional Communication for Interactive Multimedia Report (RTC-IMR) Profile specifies how systems can  communicate efficiently in context with realtime content in order to provide a streamlined user experience during reporting.

# 1:XX.1 Realtime Bidirectional Communication for Interactive Multimedia Reporting

This section defines the actors, transactions, and/or content modules in this profile. General
definitions of actors are given in the Technical Frameworks General Introduction [Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html).
IHE Transactions can be found in the Technical Frameworks General Introduction [Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html).
Both appendices are located at <https://profiles.ihe.net/GeneralIntro/>.

Figure 1:XX.1-1 shows the actors directly involved in the RTC-IMR Profile and the relevant transactions
between them. If needed for context, other actors that may be indirectly involved due to their participation
in other related profiles are shown in dotted lines. Actors which have a required
grouping are shown in conjoined boxes (see [Section 1:XX.3](#1xx3-rtc-imr-required-actor-groupings)).

<div>
    <img src="actor_transaction.png" width="80%">
</div>
<br clear="all">

**Figure 1:XX.1-1: RTC-IMR Actor Diagram**

Table 1:XX.1-1 lists the transactions for each actor directly involved in the IMR Profile. To claim compliance with this profile, an actor shall support all required transactions (labeled “R”) and may support the optional transactions (labeled “O”).

**Table 1:XX.1-1: RTC-IMR Profile - Actors and Transactions**

<table class="grid">
  <thead>
    <tr>
      <th>Actors</th>
      <th>Transactions</th>
      <th>Initiator or Responder</th>
      <th>Optionality</th>
      <th>Reference</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="8"><a href="volume-1.html#1xx111-image-display">Image Display</a></td>
      <td>Subscribe Reporting Session [RAD-X1]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 4.X1</a></td>
    </tr>
    <tr>
      <td>Connect Notification Channel [RAD-X2]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 4.X2</a></td>
    </tr>
    <tr>
      <td>Initiate Report Context [RAD-X3]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x3.html">RAD TF-2: 4.X3</a></td>
    </tr>
    <tr>
      <td>Terminate Report Context [RAD-X4]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x4.html">RAD TF-2: 4.X4</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-X7]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 4.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 4.X8</a></td>
    </tr>
    <tr>
      <td>Send Context Event [RAD-X9]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 4.X9</a></td>
    </tr>
    <tr>
      <td>Send SyncError Event [RAD-X10]</td>
      <td>Initiator & Responder</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 4.X10</a></td>
    </tr>
      <tr>
      <td rowspan="8"><a href="volume-1.html#1xx112-report-creator">Report Creator</a></td>
      <td>Subscribe Reporting Session [RAD-X1]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 4.X1</a></td>
    </tr>
    <tr>
      <td>Connect Notification Channel [RAD-X2]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 4.X2</a></td>
    </tr>
    <tr>
      <td>Initiate Report Context [RAD-X3]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x3.html">RAD TF-2: 4.X3</a></td>
    </tr>
    <tr>
      <td>Terminate Report Context [RAD-X4]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x4.html">RAD TF-2: 4.X4</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-X7]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 4.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 4.X8</a></td>
    </tr>
    <tr>
      <td>Send Context Event [RAD-X9]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 4.X9</a></td>
    </tr>
    <tr>
      <td>Send SyncError Event [RAD-X10]</td>
      <td>Initiator & Responder</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 4.X10</a></td>
    </tr>
      <tr>
      <td rowspan="8"><a href="volume-1.html#1xx113-worklist-display">Worklist Client</a></td>
      <td>Subscribe Reporting Session [RAD-X1]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 4.X1</a></td>
    </tr>
    <tr>
      <td>Connect Notification Channel [RAD-X2]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 4.X2</a></td>
    </tr>
    <tr>
      <td>Initiate Report Context [RAD-X3]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x3.html">RAD TF-2: 4.X3</a></td>
    </tr>
    <tr>
      <td>Terminate Report Context [RAD-X4]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x4.html">RAD TF-2: 4.X4</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-X7]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 4.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 4.X8</a></td>
    </tr>
    <tr>
      <td>Send Context Event [RAD-X9]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 4.X9</a></td>
    </tr>
    <tr>
      <td>Send SyncError Event [RAD-X10]</td>
      <td>Initiator & Responder</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 4.X10</a></td>
    </tr>
    <tr>
      <td rowspan="6"><a href="volume-1.html#1xx114-evidence-creator">Evidence Creator</a></td>
      <td>Subscribe Reporting Session [RAD-X1]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 4.X1</a></td>
    </tr>
    <tr>
      <td>Connect Notification Channel [RAD-X2]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 4.X2</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-X7]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 4.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 4.X8</a></td>
    </tr>
    <tr>
      <td>Send Context Event [RAD-X9]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 4.X9</a></td>
    </tr>
    <tr>
      <td>Send SyncError Event [RAD-X10]</td>
      <td>Initiator & Responder</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 4.X10</a></td>
    </tr>
      <tr>
      <td rowspan="2"><a href="volume-1.html#1xx115-report-content-creator">Content Creator</a></td>
      <td>Update Report Content [RAD-X5]</td>
      <td>Initiator</td>
      <td>O (Note 1)</td>
      <td><a href="rad-x5.html">RAD TF-2: 4.X5</a></td>
    </tr>
    <tr>
      <td>Select Report Content [RAD-X6]</td>
      <td>Initiator</td>
      <td>O (Note 1)</td>
      <td><a href="rad-x6.html">RAD TF-2: 4.X6</a></td>
    </tr>
    <tr>
      <td rowspan="6"><a href="volume-1.html#1xx116-watcher">Watcher</a></td>
      <td>Subscribe Reporting Session [RAD-X1]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 4.X1</a></td>
    </tr>
    <tr>
      <td>Connect Notification Channel [RAD-X2]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 4.X2</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-X7]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 4.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 4.X8</a></td>
    </tr>
    <tr>
      <td>Send Context Event [RAD-X9]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 4.X9</a></td>
    </tr>
    <tr>
      <td>Send SyncError Event [RAD-X10]</td>
      <td>Initiator & Responder</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 4.X10</a></td>
    </tr>
    <tr>
      <td rowspan="10"><a href="volume-1.html#1xx118-hub">Hub</a></td>
      <td>Subscribe to Reporting Session [RAD-X1]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 4.X1</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-X2]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 4.X2</a></td>
    </tr>
    <tr>
      <td>Initiate Report Context [RAD-X3]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x3.html">RAD TF-2: 4.X3</a></td>
    </tr>
    <tr>
      <td>Terminate Report Context [RAD-X4]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x4.html">RAD TF-2: 4.X4</a></td>
    </tr>
    <tr>
      <td>Update Report Content [RAD-X5]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x5.html">RAD TF-2: 4.X5</a></td>
    </tr>
    <tr>
      <td>Select Report Content [RAD-X6]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x6.html">RAD TF-2: 4.X6</a></td>
    </tr>
    <tr>
      <td>Unsubscribe from Session [RAD-X7]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 4.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 4.X8</a></td>
    </tr>
    <tr>
      <td>Send Context Event [RAD-X9]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 4.X9</a></td>
    </tr>
    <tr>
      <td>Send SyncError Event [RAD-X10]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 4.X10</a></td>
    </tr>
  </tbody>
</table>

> Note 1: A Content Creator shall support at least one of the update or select transactions.

### 1:XX.1.1 Actors Description and Actor Profile Requirements
Most requirements are documented in RAD TF-2 Transactions. This section documents any additional requirements on this profile's actors.

#### 1:XX.1.1.1 Image Display

The Image Display actor is responsible for presenting patients' studies and relevant information to the user so that the user can make diagnostic decisions on the studies.

The Image Display provides tools for the user to navigate images in a study. It may include a worklist component that let the user select studies to read. It may also include tools to create evidence data such as annotations, key images, etc.

In order to complete a study dictation, the Image Display:
- May launch other applications and synchronize them to the same report context through the Hub
- May be launched by another application, consume reporting events from the Hub and synchronize itself to the same report context

The Image Display shall have the following capabilities:
- Configure the URL of the Hub
- Generate a unique session ID and start a new reporting session by subscribing to the Hub on its own
- Launch one or more actors and provide them the URL of the Hub actor as `hub.url` and the reporting session ID as `hub.topic`
- Launched by another application and use the provided `hub.url` and `hub.topic` to join a reporting session and synchronize itself with the report context received
- Configure to initiate or terminate (or both) report context based on some business logic

> Note that the actual application launch method is out of scope of this profile See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

##### 1:XX.1.1.1.1 Event Handling Requirements

The Image Display shall handle the `report`, `patient` and `study`, `updates` and `select` contexts according to the event handling requirements defined in Table 1:XX.1.1.1.1-1:

**Table 1:XX.1.1.1.1-1**: Event Handling Requirements

| Event | Handling Requirements |
| -- | -- |
| DiagnosticReport-open | Display the study images |
| DiagnosticReport-close | Stop display the study images |
| DiagnosticReport-update | Update the patient or study record, or add/modify/delete received contents, if applicable.<br> Display the changes.<br>Shall support the following resources:<br>- `DiagnosticReport` for report status changes |
| DiagnosticReport-select | Display and put in focus the applicable selected resources |
| SyncError | Notify to the user regarding the synchronization error, including the details of the error reported and the Subscriber that reported the error |
{: .grid}

##### 1:XX.1.1.1.2 Event Producing Requirements

If the Image Display is grouped with a Content Creator to publish additional content events to a reporting session, then it shall publish events using at least one FHIR resource. The Image Display is highly recommended to publish events using one or more of the following FHIR resources that are expected to be useful in reporting:

- `Patient`: patient in the anchor context
- `ImagingStudy`: imaging study in either the anchor context (i.e. the study subject to be reported) or as additional studies (e.g. a comparison study)
- `ImagingSelection`: image / series references and simple annotations
- `Observation`: measurements and annotations

#### 1:XX.1.1.2 Report Creator

The Report Creator actor is responsible for producing a diagnostic report for patients' studies.

In order to complete a study dictation, the Report Creator:
- May launch other applications and synchronize them to the same report context through the Hub
- May be launched by another application, consume reporting events from the Hub and synchronize itself to the same report context

The Report Creator provides tools for the user to insert report content such as findings and impressions. The Report Creator may use the report content shared by other applications through the Hub (e.g. image references shared by Image Display, or measurements shared by Evidence Creator) to directly update the report (e.g. insert measurements) or generate derived report content (e.g. inject hyperlinks from image references)

The Report Creator shall have the following capabilities:
- Configure the URL of the Hub
- Generate a unique session ID and start a new reporting session by subscribing to the Hub on its own
- Launch one or more actors and provide them the URL of the Hub actor as `hub.url` and the reporting session ID as `hub.topic`
- Launched by another application and use the provided `hub.url` and `hub.topic` to join a reporting session and synchronize itself with the report context received
- Configure to initiate or terminate (or both) report context based on some business logic

> Note that the actual application launch method is out of scope of this profile See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

##### 1:XX.1.1.2.1 Event Handling Requirements

The Report Creator shall handle the `report`, `patient` and `study`, `updates` and `select` contexts according to the event handling requirements defined in Table 1:XX.1.1.2.1-1:

**Table 1:XX.1.1.2.1-1**: Event Handling Requirements

| Event | Handling Requirements |
| -- | -- |
| DiagnosticReport-open | Be ready for reporting for the study |
| DiagnosticReport-close | Stop display the study report. It may use the `id` in the `report` context as the report ID for the eventual created report. |
| DiagnosticReport-update | Update the report, patient or study record, or add/modify/delete received contents, if applicable.<br>Display the changes.<br>Highly recommended to support the following content update resources:<br>- `ImagingStudy` for comparison study<br>- `ImagingSelection` for image references and annotations<br>- `Observation` for measurements and annotations |
| DiagnosticReport-select | Display and put in focus the applicable selected resources |
| SyncError | Notify to the user regarding the synchronization error, including the details of the error reported and the Subscriber that reported the error |
{: .grid}

##### 1:XX.1.1.2.2 Event Producing Requirements

The Report Creator shall be grouped with a Content Creator to publish report status update using the report anchor context DiagnosticReport resource. It may support other content sharing resources.

#### 1:XX.1.1.3 Worklist Client

The Worklist Client actor is responsible for providing a reporting worklist to the user.

When a user selects studies from the worklist, the Worklist Client launches other applications (e.g. Image Display, Report Creator, etc.) if necessary. It initiates a new report context to synchronize other applications through the Hub to enable dictation on the studies.

When a study dictation is complete, the Worklist Client consumes the report anchor context update event so that it can mark the study as dictated and remove it from the worklist.

In order to complete a study dictation, the Worklist Client:
- May launch other applications and synchronize them to the same report context through the Hub
- May be launched by another application, consume reporting events from the Hub and synchronize itself to the same report context

The Worklist Client shall have the following capabilities:
- Configure the URL of the Hub
- Generate a unique session ID and start a new reporting session by subscribing to the Hub on its own
- Launch one or more actors and provide them the URL of the Hub actor as `hub.url` and the reporting session ID as `hub.topic`
- Launched by another application and use the provided `hub.url` and `hub.topic` to join a reporting session and synchronize itself with the report context received
- Configure to initiate or terminate (or both) report context based on some business logic

> Note that the actual application launch method is out of scope of this profile See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

##### 1:XX.1.1.3.1 Event Handling Requirements

The Worklist Client shall handle the `report`, `patient` and `study`, `updates` and `select` contexts according to the event handling requirements defined in Table 1:XX.1.1.3.1-1:

**Table 1:XX.1.1.3.1-1**: Event Handling Requirements

| Event | Handling Requirements |
| -- | -- |
| DiagnosticReport-open | Display the study metadata and report status |
| DiagnosticReport-close | Remove the study from reporting worklist |
| DiagnosticReport-update | Update the report, patient or study record, or add/modify/delete received contents, if applicable.<br> Display the changes.<br>Shall support the following resources:<br>- `DiagnosticReport` for report status changes |
| DiagnosticReport-select | Display and put in focus the applicable selected resources |
| SyncError | Notify to the user regarding the synchronization error, including the details of the error reported and the Subscriber that reported the error |
{: .grid}

##### 1:XX.1.1.3.2 Event Producing Requirements

None

#### 1:XX.1.1.4 Evidence Creator

The Evidence Creator actor is responsible for consuming events in the reporting session and producing evidence data such as annotations, measurements, key image references, etc. for the patients' studies. For example, it may detect lung nodules and produce measurements and bounding boxes of the nodules detected.

The Evidence Creator may capture the evidence data in format such as DICOM SR and shared with other systems using methods outside of this profile (e.g. as Evidence Creator in IHE AIR profile). In this case, other synchronizing applications in the same reporting session may not be aware of the evidence data created by the Evidence Creator.

Alternatively the Evidence Creator may capture the evidence data (e.g. lung nodule measurements as FHIR Observation resource, image references and bounding box as FHIR ImagingSelection resource) and share them by publishing content sharing events back to the reporting session through the Hub.

The Evidence Creator may be a standalone application such as an Specialty AI application, or it may be grouped with another actor such as Image Display.

In order to complete a study dictation, the Evidence Creator shall be capable of being launched by another application (e.g. Image Display). It shall use the provided `hub.url` and `hub.topic` to join a reporting session and synchronize itself with the report context received.

##### 1:XX.1.1.4.1 Event Handling Requirements

The Worklist Client shall handle the `report`, `patient` and `study`, `updates` and `select` contexts according to the event handling requirements defined in Table 1:XX.1.1.4.1-1:

**Table 1:XX.1.1.4.1-1**: Event Handling Requirements

| Event | Handling Requirements |
| -- | -- |
| DiagnosticReport-open | Process the study data |
| DiagnosticReport-close | Stop processing the study data |
| DiagnosticReport-update | Update the report, patient or study record, or add/modify/delete received contents, if applicable. |
| DiagnosticReport-select | Process the applicable selected resources |
| SyncError | Notify to the user, if applicable, regarding the synchronization error, including the details of the error reported and the Subscriber that reported the error |
{: .grid}

##### 1:XX.1.1.4.2 Event Producing Requirements

If the Evidence Creator is grouped with a Content Creator to publish content events to a reporting session, then it shall publish events using at least one FHIR resource. The Evidence Creator is highly recommended to publish events using one or more of the following FHIR resources that are expected to be useful in reporting:

- `ImagingSelection`: image / series references and simple annotations such as bounding boxes
- `Observation`: measurements and annotations

#### 1:XX.1.1.5 Content Creator

The Content Creator actor is responsible for either publishing context and/or content changes (add, modify or delete) as events to a reporting session, or selecting one or more contents and publishing the selection events, or both.

> Note: This actor is intended to be grouped with another actor (excluding the Hub) in this profile to augment the existing actor capabilities with content sharing capabilities. This actor cannot be claimed as a standalone actor since it lacks the capabilities to subscribe to a reporting session.

The specific context or content changes captured by the Content Creator depends on the grouped actor and the specific deployment scenario. For example:

| Grouped Actor | Potential Use | Relevant Resource |
| -- | -- | -- |
| Report Creator | Communicate report status update | DiagnosticReport |
| Evidence Creator | Image references<br>Bounding Boxes | ImagingSelection<br>Observation |
| Image Display | Comparison study used during reporting | ImagingStudy |
{: .grid}

Furthermore, the Content Creator may use the sharing of content selection to enable more efficient reporting flow. For example, when a user clicks on the bounding box of a detected nodule, the grouped Image Display publishes a selection event referencing the affected images and bounding boxes as an ImagingSelection resource and the corresponding measurements as an Observation. Upon receiving the event, the Report Creator captured the details and show them in a side panel to the user. Finally the user issues a voice command to inject hyperlink. The Report Creator, uses the selected contents as input to the voice command, automatically persisted the resources in database and then inject a hyperlink to access them in the finding section.

#### 1:XX.1.1.6. Watcher

The Watcher actor is responsible for listening to events in a session and perform actions according to it business logic. The specific actions are out of scope of this profile.

For example, the Watcher consumes the initiation and termination of report contexts and calculates the turnaround time for different types of studies in different departments. Another example is that the Watcher monitors how often an Evidence Creator publishes content sharing events and correlates how effective an AI application is with respect to the turnaround time by comparison and time before and after the Evidence Creator is deployed.

##### 1:XX.1.1.6.1 Event Handling Requirements

The Worklist Client shall handle the `report`, `patient` and `study`, `updates` and `select` contexts according to the event handling requirements defined in Table 1:XX.1.1.6.1-1:

**Table 1:XX.1.1.6.1-1**: Event Handling Requirements

| Event | Handling Requirements |
| -- | -- |
| DiagnosticReport-open | Process according to business logic |
| DiagnosticReport-close | Stop processing the report context |
| DiagnosticReport-update | Update the report, patient or study record, or add/modify/delete received contents, if applicable. |
| DiagnosticReport-select | Process the applicable selected resources |
| SyncError | Notify to the user, if applicable, regarding the synchronization error, including the details of the error reported and the Subscriber that reported the error |
{: .grid}

##### 1:XX.1.1.4.2 Event Producing Requirements

None

#### 1:XX.1.1.7 Hub

The Hub actor is responsible for managing event flows between Subscribers in reporting sessions and maintaining the current context and transaction of content sharing in each session.

The Hub is also responsible for authorizing the following:
- which Subscriber has permission to invoke what requests
- which context and content a Subscriber is eligible to access and in what type (e.g. read only, write only or ready and write)

The Hub shall provide basic functionalities to all events it received, including custom events. Specifically:
- It shall receive and send the event to all Subscribers subscribed to the event type
- It shall manage the current context in the session for all context-change events (i.e. *-open and *-close events)
- It shall ensure proper event ordering and transaction handling for all content sharing events (i.e. *-update and *-select) events

The Hub shall NOT be limited to the events prescribed in this profile to support synchronizing applications in reporting sessions.

The Hub shall support content sharing events.

## 1:XX.2 RTC-IMR Actor Options

Options that may be selected for each actor in this implementation guide, are listed in Table 1:XX.2-1 below. Dependencies between options, when applicable, are specified in notes.

**Table 1:XX.2-1: RTC-IMR - Actors and Options**

<table class="grid">
  <thead>
    <tr>
      <th>Actor</th>
      <th>Option Name</th>
      <th>Reference</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Image Display</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td>Report Creator</td>
      <td>SMART on FHIR Launch</td>
      <td><a href="volume-1.html#1xx21-smart-on-fhir-launch">1:XX.2.1</a></td>
    </tr>
    <tr>
      <td>Worklist Client</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td>Evidence Creator</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td>Content Creator</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td>Watcher</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td>Hub</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
  </tbody>
</table>

### 1:XX.2.1 SMART on FHIR Launch

The Driving Application that supports the SMART on FHIR Launch option shall use the [SMART on FHIR](http://www.hl7.org/fhir/smart-app-launch/) to launch an application.

Additionally, the Driving Application shall use the FHIRcast [OAuth 2.0 Authorization Scope](https://build.fhir.org/ig/HL7/fhircast-docs/2-2-FhircastScopes.html) to request a token with the authorized events.

See FHIRcast [Section 4.1.1 SMART on FHIR](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html#smart-on-fhir) for more details and examples.

## 1:XX.3 RTC-IMR Required Actor Groupings

An actor from this profile (Column 1) shall implement all of the required transactions and/or
content modules in this profile ***in addition to all*** of the requirements for the grouped actor (Column 3).

In some cases, required groupings are defined as at least one of an enumerated set of possible actors; this is designated by merging column one into a single cell spanning multiple potential grouped actors. Notes are used to highlight this situation.

Section 1:XX.5 describes some optional groupings that may be of interest for security
considerations and Section 1:52.6 describes some optional groupings in other related profiles.

**Table 1:XX.3-1: RTC-IMR Required Actor Groupings**

| IMR Actor | Grouping Condition | Actor(s) to be grouped with | Reference |
|-----------|--------------------|-----------------------------|-----------|
| Image Display | -- | None | -- |
| Report Creator | -- | None | -- |
| Worklist Client | -- | None | -- |
| Evidence Creator | -- | None | -- |
| Content Creator | -- | None | -- |
| Watcher | -- | None | -- |
| Hub | -- | None | -- |
{: .grid}

## 1:XX.4 RTC-IMR Overview

### 1:XX.4.1 Concepts

#### 1:XX.4.1.1 Publish and Subscribe Model

At its heart, this profile synchronizes a group of applications using a Publish and Subscribe model as implemented by [FHIRcast](https://build.fhir.org/ig/HL7/fhircast-docs/index.html) which in turn is an implementation of [WebSub](https://www.w3.org/TR/websub/).

The following are some key concepts:
- Participating applications are `Subscribers` that register with and communicate with a `Hub`
- `Subscribers` do not communicate with other `Subscribers` directly.
- Typically the `Hub` only communicates with authenticated `Subscribers`
- When `Subscribers` generate data that needs to be made available to other applications, or perform actions that the other applications should be notified of, they *publish* it by sending an event with the relevant details to the Hub
- The `Hub` forwards events received from Driving Applications to the other Synchronizing Applications
- `Subscribers` can configure their subscription to limit what types of events the `Hub` sends to them.
- `Subscribers` react to events from the `Hub` based on their internal business logic
- `Subscribers` do not need to be explicitly aware of what other subscribers (if any) are receiving their events or how they react to them
- The `Hub` also maintains the collection of data it has received, organized them according to the context
- `Subscribers` can request the current context and associated contents from the `Hub`
- The `Hub` can simultaneously manage multiple groups of `Subscribers` and their associated data in different `sessions`
- Each `session` is identified by a unique “topic ID”
- The `Subscriber` that initiates and terminates context is referred to as the Driving Application. A Driving Application usually also launches other applications, providing them with the address of the `Hub` and the `topic ID` so they can join the same `session`.

TODO: Replace the FHIRcast link to the published version if ready by the time of publication.

#### 1:XX.4.1.2 Terminology and Model

The terminology used in FHIRcast and adopted in this profile can be found in the [Glossary](https://build.fhir.org/ig/HL7/fhircast-docs/5_glossary.html) page.

The following is a representation of the data model.

**Figure 1:XX.4,1.2-1: FHIRcast Concept Data Model**

<div>
    <img src="data_model.png" width="80%">
</div>
<br clear="all">

The following is a representation of the interaction model.

> Note: The term `Driving Application` and `Synchronizing Application` in the diagram are *convenient* terms instead of actual defined terms. They are used here to highlight the additional capabilities a driving application can do, in particular:
> - Start a new reporting session
> - Launch another application
> - Initiate or terminate a report context

**Figure 1:XX.4,1.2-1: FHIRcast Concept Interaction Model**

<div>
    <img src="interaction_model.png" width="80%">
</div>
<br clear="all">

#### 1:XX.4.1.3 Long Session and Short Context

A `Session` is a communication channel setup between the `Subscribers` using the `Hub`. As long as `Subscribers` are active and have events to communicate with each other, the `Session` can stay open. Therefore a `Session` has a long duration.

TODO: A `Session` represents the activity of a user in a reporting session. Typically a session started ... shared workspace ... It is a scope for the events in the pub/sub model. Glossary Session: an abstract concept representing a shared workspace, such as a user's login session across multiple applications or a shared view of one application distributed to multiple users. A session results from a user logging into an application and can encompass one or more workflows.

TODO: What it represents (conceptually) and what it does (practically)

A `Context` is used to communicate a subject on which the `Subscribers` should synchronize as appropriate to their business logic. As soon as the subject is complete, then the corresponding `Context` can be closed. Therefore a `Context` has a limited duration within a `Session`.

TODO: Reference the interruption use case #3 - put it in a separate concept section.

Note that occasionally a `Context` may be _interrupted_ because of _suspension_, meaning that before the `Context` is closed, another `Context` is opened (e.g. a radiologist needs to suspend the current report on a study in order to review another urgent study). In this case, the information of the previous `Context` is still maintained by the `Hub` since it is not closed, but it is _suspended_ (i.e. not the `Current Context`). Instead the `Current Context` is switched to the urgent study being opened. As soon as the user finished reviewing the urgent study and hence has closed the `Context` of the urgent study, the _suspended_ `Context` will resume to be the `Current Context` since it is the last opened `Context`.

#### 1:XX.4.1.4 Events vs Commands

Communication patterns between two systems fall in two general categories: `Commands` and `Events`. In this profile, the messages that a `Subscriber` sends to the `Hub` represents an `Event`. This RTC-IMR Profile has no support for sending `Commands`.

TODO: Mention the initiator and the recipient(s)

`Events` represent facts that have happened. For example, DiagnosticReport-open represents an event that an application opens a study for reporting. Note that an event has no direct target audience. Any applications subscribed to the event will receive the event and the application can determine how to process the event. The application that is producing the event is not aware of the actions being performed by different consuming applications, unless these consuming applications in turn publishes additional events.

On the other hand, `Commands` represent intention, often associated with specific target audience(s). For example, Send-Study represents an intention to send a study. Therefore the application that sends the commands often has direct knowledge of which applications should execute the commands, or delegate to a proxy service that has the knowledge.

TODO: Soften the text. In this profile, there is nothing explicitly define as Command in this profile. Some implementation may define a command out of band.

#### 1:XX.4.1.5 Event Awareness vs Event Consumption

`Event Awareness` means an application, upon receiving an event from the `Hub`, has the knowledge of an event has happened.

`Event Consumption` means an application, upon receiving an event from the `Hub`, reacts to the event and performed some actions according to its business logic.

This means from the content sharing application perspective, in order to synchronize the context with other applications, it may be desirable to publish frequent events so that other subscribers can be aware of the same context as in the content sharing application.

On the other hand, from the subscribing application perspective, it is up to its business logic to determine how to react to the received event. This business logic may be automatic or requires additional user input.

For example, in a nodule tracking application, when the user goes through the study images, the user may keep track of (a.k.a. bookmarking) nodules observed (e.g. 1, 2, ..., 9, 10). Then once the user reviewed the full study, the user may select a subset of the nodules (e.g. 2, 3, 5, 9) identified as important to be added to the report. In this scenario, it is highly recommended that the nodule tracking application sends an event for each nodule (i.e. 1, 2, ..., 9, 10) being bookmarked so that the reporting application is aware of all the nodules the user observed (but not necessary added to the report yet). The user can then instruct the reporting application to add a subset of the nodules (i.e. 2, 3, 5, 9) to the report. Note that since the reporting application is aware of all the nodules observed by synchronizing the context with the nodule tracking application, selecting a subset of the nodules is a local operation and can be done in any order (i.e. the action is not required to only apply to the most recent context received).

Note that this implies the reporting application has to keep track of all the contexts in the received events, independent of whether the context will be used in the report later. This is important because there is no `Command` defined in this profile, and the reporting application cannot request past context from the reporting application or the `Hub`. (The reporting application may provide other means to support a query mechanism, but this is out of scope of this profile).

TODO: Add a counter example that too many events have negative impact. So choose wisely what are reasonable to share.

#### 1:XX.4.1.6 Timing of Sending an Event

On one hand, it is desirable for all subscribed applications to be synchronized with the driving application as soon as possible. On the other hand, FHIRcast is a network protocol which incurs a non-triusingl cost to send each event. Therefore any implementation should take into account when an action is considered to be complete or stable, and hence ready to be captured and communicated as events.

For example, when a user is making measurements or annotations, instead of capturing every single measurement or annotation as an event, an application may use an idle time threshold to detect if the user completed the action or not.

Furthermore, this profile is designed to communicate _in-progress_ data as soon as possible. Therefore it is not desirable for the driving application to _wait_ too long. For example, if the driving application supports exporting measurements and annotations as DICOM SR or other DICOM objects, it is not necessary to wait until the DICOM objects are created before sending the corresponding event.  

This profile does not mandate any specific implementation design regarding when an application should capture the result of an action as an event.

#### 1:XX.4.1.7 Transient Resource vs Persistent Resource

FHIRcast uses FHIR resources to capture the context and content in an event. These FHIR resources may be transient, meaning that they do not necessarily exist in any system, nor are they expected to be persisted by any system. Furthermore, even an application decides to persist the FHIR resource(s), it is not required to use the same resource ID in the event as the ID of the persisted resource. The application can generate new IDs instead.

Since the FHIR resources specified in the event may or may not be persisted in any FHIR server, to differentiate between the two cases, this profile defines that transient resources are identified by relative references (e.g. Patient/12345) and persisted resources that already exist are identified by full URL (e.g. http://myserver.com/Patient/12345).

#### 1:XX.4.1.8 Local Tracking of Context

The `DiagnosticReport-open` event includes both the `report` anchor context and associated contexts `patient` and `study`. Subsequent event(s) for this anchor context will only provide the `report` context. Therefore, it is up to the Subscriber to record internally the `patient` and `study` contexts associated with the `report` anchor context if that information is relevant to its business logic. 

### 1:XX.4.2 Use Cases

#### 1:XX.4.2.1 Use Case \#1: PACS Driven Reporting

This use case shows a simple two actors scenarios, Image Display and Report Creator, in a reporting session.

Note that Section 1:XX.4.2.1 repeats in its entirety for additional use
cases (replicate as Section 1:XX.4.2.2, 1:XX.4.2.3, etc.).

##### 1:XX.4.2.1.1 PACS Driven Reporting Use Case Description

##### TODO: Add a subtitle for user perspective
The Image Display launches the Report Creator when a reporting session starts.

TODO: Include the 'setup' phase to get the workspace up with the necessary applications ready

TODO: Rework this paragraph
- Worklist has a set of studies
- Radiologist use worklist to select one study to report
- ...

A radiologist using the worklist function in the Image Display to work through the list of studies to be reported. As the radiologist proceeds, when the Image Display displays each study in the worklist, she uses the Report Creator, loaded with the corresponding procedure for the same study, to create the diagnostic report. During reporting, she creates annotations and measurements on some of the images. These annotations and measurements are selected and populated in the report accordingly. Once she completed the report for the study, she signs off the report and proceeds with the next study in the worklist. Eventually she finishes all the studies in the worklist and close the reporting session.

This is intentionally a high level description. Actors which do not interact with the users are not shown. No actual transactions are shown, instead interaction between the systems are shown with hyperlinks that connect to diagrams that shows the details.

> Note: The hyperlinks provided in the diagram links to the specific detailed description of each step.

> Note: In this use case, the Image Display does ... Alternatively separate Evidence Creator, Worklist Client, etc. ... See Use Case 2 ... TODO

TODO: Change all transactions to be italic

##### 1:XX.4.2.1.2 PACS Driven Reporting Process Flow

<div>
{%include ReportingFlow.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.2-1: PACS Driven Reporting Flow in RTC-IMR Profile

Furthermore, the [Examples](example.html) tab, contains sample events following this use case.

###### 1:XX.4.2.1.2.0 Common Subscription Flow

Subscribing to a reporting session is a common starting point for any `Subscriber` to start communicating with other `Subscribers` using the `Hub` in a reporting session.

Subscribing to a reporting session involves two transactions:

- Subscribe Reporting Session [RAD-X1]
- Connect Notification Channel [RAD-X2]

For a Synchronizing Application, the session is provided by the Driving Application during launch.

For a Driving Application, it generates a unique session ID to start a new session.

<div>
{%include common-subscription.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.0-1: Common Subscription Flow in RTC-IMR Profile

To simplify the subsequent use case flows for readability, this common subscription flow will be represented as a single line as a meta transaction [RAD-Sub]. The following is an example between the Image Display and the Hub.

<div>
{%include condensed-subscription-transaction.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.0-2: Condensed Subscription Transaction in RTC-IMR Profile

###### 1:XX.4.2.1.2.1 Step 1: Open Reporting Session

When a radiologist starts reporting, the Image Display, as a Driving Application, starts a reporting session.

Note that there is no explicit creation of a session. If the Hub receives a session ID (i.e. topic) that does not already exist, then the Hub will automatically create the session and add the subscriber (i.e. Image Display) to the session.

The Image Display subscribes to events so that it can:
- Receive events published by other Subscribers
- Receive the version ID of any events which is required for concurrency control (See Section ... for more information about content sharing TODO)
- Receive synchronization error events from the Hub or from other Subscribers.

Once the Image Display completed its subscription, it launches the Report Creator. The Report Creator, as a Synchronizing Application, can follow the context and content events automatically.

> Note that *launching* the Report Creator (or any Synchronizing Application) by the Image Display (or any Driving Application) may be implemented in different ways. For example, the Synchronizing Application can be started and terminated, or it can be put in focus and minimize when not needed but keep running in the background for efficiency, or a combination.

When launched, the first thing that the Report Creator does as a Synchronizing Application is to subscribe to the reporting session. The information about the Hub and the session is provided by the Image Display during launch.

Furthermore, the Report Creator queries the Hub to get the current context to ensure it has the latest context and content. Since the reporting session has just begun, and the Image Display has not yet initiated any report context, the result of the query will be empty.

<div>
{%include step1-open-reporting-session.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-1: Open Reporting Session Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.2 Step 2: Open Study in Context

When the radiologist selects a study in the worklist in the Image Display, as a Driving Application, initiates a new report context. Once the Hub accepted the event, it broadcasts the event to all Subscribers.

The Report Creator, as a Synchronizing Application, receives the event and opens the corresponding procedure for the study.

Furthermore, the event has a version ID. For the Image Display as a Driving Application, including the version ID when submitting the next event allows the Hub to ensure proper event sequence. For the Report Creator as a Synchronizing Application, keeping track of the version ID enables it to check if it missed any prior events. Event sequencing is important for content sharing because all updates and selects are expected to be applied in the same sequence as they are emitted by the Content Creator.

<div>
{%include step2-open-study-in-context.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-2: Open Study in Context Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.3 Step 3: Add Content (Optional)

Sometimes the radiologist may annotate the images with markups and measurements. When this happened, the Image Display, grouped with the Content Creator, updates the report context at the Hub with new content using Update Report Content [RAD-X5]. The Hub broadcasts the event to all Synchronizing Applications.

When the Report Creator receives the event, it can apply the updates according to its business logic. For example, it may automatically create a hyperlink in the report, or keeps track of the content in a panel for the user to perform other activities later.

For content sharing events, the Report Creator checks if the event is in the right sequence according to the version ID. If it detected that it missed some prior events, then it queries the hub to retrieve the latest context and content and apply accordingly. 

TODO: Description of version ID based verification and retrieval

<div>
{%include step3-add-measurements.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-3: Add Content Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.4 Step 4: Select Content (Optional)

TODO: Add more specific example and language how select is used

TODO: Selection can be used in various way:
- as input for a follow up action (ImagingSelecion selected as input for hyperlink)
- bring something to focus (e.g. being the measurement to focus) and follow up action
- It is the recipient of the event decides on what action to take, may be with input from the user rather than fully automated

Sometimes the radiologist selected certain elements (e.g. images, annotation, specific measurements, etc.) in the Image Display. When this happened, the Image Display, grouped with the Content Creator, sends a event to the Hub using Select Report Content [RAD-X6] indicating what contents have been selected. The Hub broadcasts the event to all Subscribers.

When the Report Creator receives the event, it can apply the selection according to its business logic. For example, it can highlight to the user what are selected so that the user can perform some actions. In this example, the radiologist uses a voice command to insert a hyperlink in the report. The Report Creator uses the selected content to generate the hyperlink.

Generally, selecting a content means putting the content in 'focus'. Note that this profile is agnostic about the user interface implementation of 'focus', e.g., it may result in the selected contents being highlighted in the user interface, or it may result in the selected contents being flagged in the backend service. Specific behavior depends on the implementation.

<div>
{%include step4-select-measurements.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-4: Select Content Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.5 Step 5: Sign-off Report

The radiologist completes dictation and signs off the report on the Report Creator.

TODO: Review this
TODO: Image Display can terminate context triggered by receiving the Content Change event regarding report status.
In this diagram, the Report Creator terminates the report context. Recall that this report context was initiated by the Image Display. Alternatively the site product may have been configured for the termination of the report context to be done by the Image Display.

The Hub broadcasts the termination event to all Subscribers and disallows any further interaction of that terminated report context.

TODO: May delete
> Note that in this use case example, the initiating Driving Application (Image Display) is not the same actor as the terminating Driving Application (Report Creator). This requires some coordination between the Image Display and the Report Creator. Such coordination is out of scope of this profile. Other arrangement is possible so that the same Image Display being both the initiating and terminating Driving Application.

Upon receiving the termination event, the Image Display updates its worklist to mark the study as reported.

TODO: Support for reason to terminate the report (e.g. complete normally, drafted complete, radiologist finished and sent to transcriptionist, etc.)

TODO: Describe what other actors might do upon receiving the terminating event

TODO: Right before close, the Report Creator can send an update to change the report status. Make this a requirement.

The Report Creator may have some internal mechanism to keep the report for a grace period after signed off and before sending it out to other recipients. The Report Creator persists the report according to its business logic.

TODO: Describe what Image Display does when receive the message.

TODO: Add at the beginning of this use case the role of each actor in this use case.

<div>
{%include step5-signoff-report.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-5: Sign-off Report Flow in RTC-IMR Profile

The flow above shows the simple case with a sequential switching of report context. In this case, a report context is initiated and then terminated before the next report context is opened.

In practice, the radiologist is likely to continue with the next study in the worklist without any awareness of the events happening behind the scene. If the initiating Driving Application and terminating Driving Application are different as in this example, then it is possible that the radiologist moves to the next study and hence the Image Display initiates a new report context before the Image Display receives the Terminate Report Context [RAD-X5] event of the reported study.

Such rapid context switching is supported by this profile. The Hub and each Subscriber maintain multiple open context simultaneously. As long as the context is not terminated, it still exists. Each event is associated to a particular anchor context. Therefore a Subscriber can reliably match an event to its internal state according to the context ID of the anchor context in the event. 

The following diagram shows what can happen in case of rapid switching of the report context.

<div>
{%include rapid_switch_context.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-5b: Rapid Context Switching Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.6 Step 6: Terminate Reporting Session

Eventually, the radiologist completed all the studies in the worklist and closes the Report Creator. The Report Creator unsubscribes to the reporting session so that it will no longer receives any future events.

The Hub closes the connection to the Report Creator. Note that if there are other Subscribers on the same session, those applications are not affected and will continue to receive notification on the session.

<div>
{%include step6-terminate-reporting-session.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-6: Terminate Reporting Session Flow in RTC-IMR Profile

#### 1:XX.4.2.2 Use Case \#2: Worklist Manager Driven Reporting

<div>
{%include multi_app.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.2-1: Worklist Manager Driven Reporting in RTC-IMR Profile

#### 1:XX.4.2.3 Use Case \#3: Interruption and Resume Flow

Occasionally a radiologist is interrupted while reporting on a study. She needs to open a different study (e.g. for consultation purpose) before the study that is currently in progress is ready for sign-off.

This profile enables a new report context to be initiated before the previous report context is terminated. The Hub can maintain multiple anchor context simultaneously within a reporting session. It maintains the notion of a current context to be the last anchor context that has been initiated but not yet terminated. This current context enables all Synchronizing Applications to be synchronized and working on the same context all the time.

Once the *interrupting* study is complete, the Image Display terminates the report context of the *interrupting* study. The Hub removes the context of the *interrupting* study and set the current context back to the previously opened study. Note that all associated context and contents remain in the Hub.

All `Synchronizing Applications` may resume to the previous report context in one of the following methods:
- Internally keep track of received context and hence knows which context is current.
- Use the Get Current Context [RAD-X8] transaction to query the Hub for which context is current

<div>
{%include interruption-and-resume.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.3-1: Interruption and Resume Flow in RTC-IMR Profile

#### 1:XX.4.2.4 Use Case \#4: Error Handling Flow

Error handling can be synchronous or asynchronous:
- Synchronous: When the Hub or any Subscriber receives an event, it processes the event immediately and failed, then it returns an error status `4xx` or `5xx`.
- Asynchronous: When the Hub or any Subcriber receives an event, it immediately responds with `202` Accepted and processes the event asynchronously. If it failed to process the event within a threshold (e.g. FHIRcast recommends <10 seconds), then it sends a `syncerror` using Send SyncError Event [RAD-X10].

> Note that if the Subscriber returns `202` Accepted to the Hub, it is the responsibility of the Subscriber to send a `syncerror` event to the Hub later if it failed to process the event or cannot process the event within a threshold. There is no standard mechanism for the Hub to detect if the Subscriber finished processing or not (there is no *process success* confirmation event).

In some situations, the Hub may initiate the `syncerro` events:
- It receives a `4xx` or `5xx` error from a Subscriber. 
- It detected a Subscriber is not available (using missing heartbeat events) or websocket connection is dropped.

<div>
{%include syncerror.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.4-1: Error Handling Flow in RTC-IMR Profile

## 1:XX.5 RTC-IMR Security Considerations

This profile strongly recommends all actors group with an ITI ATNA Secure Application or Secure Node Actor using the Radiology Audit Trail Option.

The ATNA Profile requires actors to implement:
- [Record Audit Event](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html) [ITI-20] transaction which would record when and where analysis results are distributed and displayed.
- [Authenticate Node](https://profiles.ihe.net/ITI/TF/Volume2/ITI-19.html) [ITI-19] transaction to further ensure the integrity of transactions using node authentication and communication encryption.

Furthermore, for the HTTP-based transactions, this profile strongly recommends the use of ITI [Internet User Authorization](https://profiles.ihe.net/ITI/TF/Volume1/ch-34.html) (IUA) Profile to ensure that communications are only allowed for authenticated and authorized users and/or systems.

Additionally, although this profile does not specify any particular method for the driving application to launch the synchronizing application, this profile strongly recommends the use of SMART on FHIR for application launching. In addition to the use of OAuth2 as specified in the ITI IUA profile, SMART on FHIR defines custom scopes that can be used by the Hub to validate if the Subscriber is authorized to invoke the transaction.

Note that with FHIRcast, the authentication and authorization is controlled by the HTTP requests. Once the websocket connections are established, there is no further authorization per events.

The events as defined in this profile contain personal demographic information and clinical information. It is appropriate for products implementing the this profile to include appropriate PHI controls. Specifying such mechanisms and features is outside the scope of this profile.

## 1:XX.6 RTC-IMR Cross-Profile Considerations

Table 1:XX.6-1 describes various actors in various other profiles that might be useful to group with RTC-IMR Profile actors.

**Table 1:XX.6-1: RTC-IMR - Optional Actor Groupings**

<table class="grid">
  <thead>
    <tr>
      <th>IMR Actor</th>
      <th>Might group with</th>
      <th>Potential Purpose</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="2">Report Creator</td>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf">IMR Report Creator</a></td>
      <td>To produce multi-media interactive report using the context and content received.</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor.</td>
    </tr>
    <tr>
      <td rowspan="2">Image Display</td>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol1.pdf">SWF.b Image Display</a></td>
      <td>To display patients' studies and share context and content with other synchronized applications</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor.</td>
    </tr>
    <tr>
      <td rowspan="2">Evidence Creator</td>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol1.pdf">SWF.b Evidence Creator</a></td>
      <td>To provide measurements and other evidence data and share the content with other synchronized applications.</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor.</td>
    </tr>
    <tr>
      <td>Worklist Client</td>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor.</td>
    </tr>
    <tr>
      <td>Hub</td>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Resource Server</a></td>
      <td>To enforce only authorized access to the resources stored in the repository.</td>
    </tr>
  </tbody>
</table>