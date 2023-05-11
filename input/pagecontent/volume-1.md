The Integrated Reporting Applications (IRA) Profile helps applications that are used together during reporting (e.g., image display, report creator, clinical applications, AI tools, etc.) to share information using a standard called FHIRcast. Each application can share what it is doing and the data it is creating, referred to as Context and Content, respectively. Other applications are notified so they can then intelligently synchronize their behavior or use the new data.

For example, the report creator could share that the user is starting a new report, and the other applications could synchronize by opening the corresponding study. An AI tool could generate a tumor measurement and the report creator could get that data and add an entry in the report, either automatically or triggered by a command from the radiologist.

# 1:XX.1 Realtime Bidirectional Communication for Interactive Multimedia Reporting

This section defines the actors, transactions, and/or content modules in this profile. General
definitions of actors are given in the Technical Frameworks General Introduction [Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html).
IHE Transactions can be found in the Technical Frameworks General Introduction [Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html).
Both appendices are located at <https://profiles.ihe.net/GeneralIntro/>.

Figure 1:XX.1-1 shows the actors directly involved in the IRA Profile and the relevant transactions
between them. If needed for context, other actors that may be indirectly involved due to their participation
in other related profiles are shown in dotted lines. Actors which have a required
grouping are shown in conjoined boxes (see [Section 1:XX.3](#1xx3-ira-required-actor-groupings)).

<div>
    <img src="actor_transaction.png" width="80%">
</div>
<br clear="all">

**Figure 1:XX.1-1: IRA Actor Diagram**

Table 1:XX.1-1 lists the transactions for each actor directly involved in the IMR Profile. To claim compliance with this profile, an actor shall support all required transactions (labeled “R”) and may support the optional transactions (labeled “O”).

**Table 1:XX.1-1: IRA Profile - Actors and Transactions**

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
      <td>Subscribe to Reporting Session [RAD-X1]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 3.X1</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-X2]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 3.X2</a></td>
    </tr>
    <tr>
      <td>Open Report Context [RAD-X3]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x3.html">RAD TF-2: 3.X3</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-X7]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 3.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 3.X8</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-X9]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 3.X9</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-X10]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 3.X10</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-X11]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x11.html">RAD TF-2: 3.X11</a></td>
    </tr>
    <tr>
      <td rowspan="10"><a href="volume-1.html#1xx112-report-creator">Report Creator</a></td>
      <td>Subscribe to Reporting Session [RAD-X1]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 3.X1</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-X2]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 3.X2</a></td>
    </tr>
    <tr>
      <td>Open Report Context [RAD-X3]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x3.html">RAD TF-2: 3.X3</a></td>
    </tr>
    <tr>
      <td>Close Report Context [RAD-X4]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x4.html">RAD TF-2: 3.X4</a></td>
    </tr>
    <tr>
      <td>Update Report Status [RAD-X12]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x12.html">RAD TF-2: 3.X12</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-X7]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 3.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 3.X8</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-X9]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 3.X9</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-X10]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 3.X10</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-X11]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x11.html">RAD TF-2: 3.X11</a></td>
    </tr>
    <tr>
      <td rowspan="8"><a href="volume-1.html#1xx113-worklist-client">Worklist Client</a></td>
      <td>Subscribe to Reporting Session [RAD-X1]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 3.X1</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-X2]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 3.X2</a></td>
    </tr>
    <tr>
      <td>Open Report Context [RAD-X3]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x3.html">RAD TF-2: 3.X3</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-X7]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 3.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 3.X8</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-X9]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 3.X9</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-X10]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 3.X10</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-X11]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x11.html">RAD TF-2: 3.X11</a></td>
    </tr>
    <tr>
      <td rowspan="7"><a href="volume-1.html#1xx114-evidence-creator">Evidence Creator</a></td>
      <td>Subscribe to Reporting Session [RAD-X1]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 3.X1</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-X2]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 3.X2</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-X7]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 3.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 3.X8</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-X9]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 3.X9</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-X10]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 3.X10</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-X11]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x11.html">RAD TF-2: 3.X11</a></td>
    </tr>
    <tr>
      <td rowspan="7"><a href="volume-1.html#1xx115-stateless-evidence-creator">Stateless Evidence Creator</a></td>
      <td>Subscribe to Reporting Session [RAD-X1]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 3.X1</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-X2]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 3.X2</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-X7]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 3.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 3.X8</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-X9]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 3.X9</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-X10]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 3.X10</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-X11]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x11.html">RAD TF-2: 3.X11</a></td>
    </tr>    
    <tr>
      <td rowspan="2"><a href="volume-1.html#1xx116-content-creator">Content Creator</a></td>
      <td>Update Report Content [RAD-X5]</td>
      <td>Initiator</td>
      <td>O (Note 1)</td>
      <td><a href="rad-x5.html">RAD TF-2: 3.X5</a></td>
    </tr>
    <tr>
      <td>Select Report Content [RAD-X6]</td>
      <td>Initiator</td>
      <td>O (Note 1)</td>
      <td><a href="rad-x6.html">RAD TF-2: 3.X6</a></td>
    </tr>
    <tr>
      <td rowspan="7"><a href="volume-1.html#1xx117-watcher">Watcher</a></td>
      <td>Subscribe to Reporting Session [RAD-X1]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 3.X1</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-X2]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 3.X2</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-X7]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 3.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 3.X8</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-X9]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 3.X9</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-X10]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 3.X10</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-X11]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x11.html">RAD TF-2: 3.X11</a></td>
    </tr>
    <tr>
      <td rowspan="11"><a href="volume-1.html#1xx118-hub">Hub</a></td>
      <td>Subscribe to Reporting Session [RAD-X1]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 3.X1</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-X2]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x2.html">RAD TF-2: 3.X2</a></td>
    </tr>
    <tr>
      <td>Open Report Context [RAD-X3]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x3.html">RAD TF-2: 3.X3</a></td>
    </tr>
    <tr>
      <td>Close Report Context [RAD-X4]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x4.html">RAD TF-2: 3.X4</a></td>
    </tr>
    <tr>
      <td>Update Report Content [RAD-X5]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x5.html">RAD TF-2: 3.X5</a></td>
    </tr>
    <tr>
      <td>Select Report Content [RAD-X6]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x6.html">RAD TF-2: 3.X6</a></td>
    </tr>
    <tr>
      <td>Unsubscribe from Session [RAD-X7]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x7.html">RAD TF-2: 3.X7</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-X8]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x8.html">RAD TF-2: 3.X8</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-X9]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x9.html">RAD TF-2: 3.X9</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-X10]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x10.html">RAD TF-2: 3.X10</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-X11]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x11.html">RAD TF-2: 3.X11</a></td>
    </tr>
  </tbody>
</table>

> Note 1: A Content Creator shall support at least one of the update or select transactions.

### 1:XX.1.1 Actors Description and Actor Profile Requirements
Most requirements are documented in RAD TF-2 Transactions. This section documents any additional requirements on this profile's actors.

> Note: Many actor requirements below assume an understanding of FHIRcast and how this profile uses it. Please refer to the [Concept section](https://profiles.ihe.net/RAD/IRA/volume-1.html#1xx41-concepts).

#### 1:XX.1.1.1 Image Display

The Image Display is responsible for presenting patients' studies and relevant information to the user so that the user can make diagnostic decisions on the studies.

The Image Display provides tools for the user to navigate images in a study. It may include a worklist component that let the user select studies to read. It may also include tools to create evidence data such as annotations, key images, etc.

The Image Display shall be capable of being launched by another application. When launched, it shall use the provided `hub.url` and `hub.topic` to join a reporting session.

The Image Display shall be able to launch other applications and synchronize them to the same report context through the Hub. It shall have the following capabilities: 
- Start a new reporting session by generating a unique session ID and subscribing to the Hub on its own
- Launch one or more actors and provide them the URL of the Hub actor as `hub.url` and the reporting session ID as `hub.topic`
- Open report context based on some business logic

> Note that the actual application launch method is out of scope of this profile. See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

##### 1:XX.1.1.1.1 Event Handling Requirements

In Table 1:XX.1.1.1.1-1, for each Received Event, Context Key specifies the context in the received event (including the special `updates` and `select` contexts used in content sharing) and Resources specifies the FHIR resources used in the given context.
The Image Display shall support all Behaviors shown as “R” in Optionality. The Image Display may support suggested behaviors ("O" in Optionality).

**Table 1:XX.1.1.1.1-1: Event Handling Requirements**

<table class="grid">
  <thead>
    <tr>
      <th>Received Event</th>
      <th>Context Key</th>
      <th>Resources</th>
      <th>Optionality</th>
      <th>Behavior</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="3">DiagnosticReport-open</td>
      <td><code class="language-plaintext highlighter-rouge">report</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Maintain association of report context to associated patient and study</td>
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">patient</code></td>
      <td>Patient</td>
      <td>R</td>
      <td>Display the patient metadata</td>
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">study</code></td>
      <td>ImagingStudy</td>
      <td>R</td>
      <td>Display the study images</td>
    </tr>
    <tr>
      <td rowspan="4">DiagnosticReport-update</td>
      <td><code class="language-plaintext highlighter-rouge">updates</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Reflect updated status (<code class="language-plaintext highlighter-rouge">DiagnosticReport.status</code>) in worklist</td>      
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">updates</code></td>
      <td>DiagnosticReport</td>
      <td>O</td>
      <td>Display the comparison study (<code class="language-plaintext highlighter-rouge">DiagnosticReport.associatedStudy</code>)</td>      
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">updates</code></td>
      <td>ImagingSelection</td>
      <td>O</td>
      <td>Display annotations to selected images</td>      
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">updates</code></td>
      <td>Observation</td>
      <td>O</td>
      <td>Display measurements and annotations</td>
    </tr>
    <tr>
      <td rowspan="2">DiagnosticReport-select</td>
      <td><code class="language-plaintext highlighter-rouge">select</code></td>
      <td>ImagingStudy</td>
      <td>O</td>
      <td>Bring the comparison study to focus</td>
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">select</code></td>
      <td>ImagingSelection</td>
      <td>O</td>
      <td>Bring selected images and annotations to focus</td>      
    </tr>
    <tr>
      <td>DiagnosticReport-close</td>
      <td><code class="language-plaintext highlighter-rouge">report</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Stop display the study images associated to the report context</td>      
    </tr>
    <tr>
      <td>SyncError</td>
      <td><code class="language-plaintext highlighter-rouge">operationoutcome</code></td>
      <td>OperationOutcome</td>
      <td>O</td>
      <td>Notify the user regarding the synchronization error, including the details of the error reported and the Subscriber that reported the error</td>
    </tr>
  </tbody>
</table>

If the report context is resumed, then the Image Display shall be able to restore the application to the same state associated to the report context as before the interruption.

> Note: The DiagnosticReport-open event does not explicitly indicate if the report context is new or resumed. See [Subscriber Local Context and Local State](volume-1.html#1xx4110-subscriber-local-context-and-local-state) for design considerations.

TODO: Figure out what baseline requirements to avoid disfunctionality. Or may be just leave it to product implementation?

##### 1:XX.1.1.1.2 Event Producing Requirements

If the Image Display accepted an event initially (i.e., returning `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Hub using Notify Error [RAD-X11](rad-x11.html).

If the Image Display is grouped with a Content Creator to publish additional content events to a reporting session, then it shall publish events using at least one FHIR resource. The Image Display is highly recommended to publish events using one or more of the following FHIR resources that are expected to be useful in reporting:

- `ImagingSelection`: image / series references and simple annotations
- `Observation`: measurements and annotations
- `DiagnosticReport`: add/remove associated (e.g. comparison) study

#### 1:XX.1.1.2 Report Creator

The Report Creator is responsible for producing a diagnostic report for patients' studies.

In order to complete a study dictation, the Report Creator:
- May launch other applications and synchronize them to the same report context through the Hub
- May be launched by another application, consume reporting events from the Hub and synchronize itself to the same report context

The Report Creator provides tools for the user to insert report content such as findings and impressions. The Report Creator may use the report content shared by other applications through the Hub (e.g., image references shared by Image Display, or measurements shared by Evidence Creator) to directly update the report (e.g., insert measurements) or generate derived report content (e.g., inject hyperlinks from image references)

The Report Creator shall be capable of being launched by another application. When launched, it shall use the provided `hub.url` and `hub.topic` to join a reporting session.

The Report Creator shall be able to launch other applications and synchronize them to the same report context through the Hub. It shall have the following capabilities: 
- Start a new reporting session by generating a unique session ID and subscribing to the Hub on its own
- Launch one or more actors and provide them the URL of the Hub as `hub.url` and the reporting session ID as `hub.topic`
- Open or close (or both) report context based on some business logic

> Note that the actual application launch method is out of scope of this profile. See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

##### 1:XX.1.1.2.1 Event Handling Requirements

In Table 1:XX.1.1.2.1-1, for each Received Event, Context Key specifies the context in the received event (including the special `updates` and `select` contexts used in content sharing) and Resources specifies the FHIR resources used in the given context.
The Report Creator shall support all Behaviors shown as “R” in Optionality. The Report Creator may support suggested behaviors ("O" in Optionality).

**Table 1:XX.1.1.2.1-1: Event Handling Requirements**

<table class="grid">
  <thead>
    <tr>
      <th>Received Event</th>
      <th>Context Key</th>
      <th>Resources</th>
      <th>Optionality</th>
      <th>Behavior</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="3">DiagnosticReport-open</td>
      <td><code class="language-plaintext highlighter-rouge">report</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Maintain association of report context to associated patient and study</td>
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">patient</code></td>
      <td>Patient</td>
      <td>R</td>
      <td>Be ready for reporting for the patient. If re-open a previously opened report context, resume to the previous state of the report context when it was interrupted.</td>      
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">study</code></td>
      <td>ImagingStudy</td>
      <td>R</td>
      <td>Be ready for reporting for the study. If re-open a previously opened report context, resume to the previous state of the report context when it was interrupted.</td>      
    </tr>
    <tr>
      <td rowspan="3">DiagnosticReport-update</td>
      <td><code class="language-plaintext highlighter-rouge">updates</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Make provided report updates (e.g. change in status, add/remove comparison studies available defined in associatedStudy extension attribute, etc.) for reference in the report</td>      
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">updates</code></td>
      <td>ImagingSelection</td>
      <td>R</td>
      <td>Make images and/or annotations in the ImageSelection resource available for reference in the report</td>      
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">updates</code></td>
      <td>Observation</td>
      <td>R</td>
      <td>Make provided measurements and annotations available for reference in the report</td>      
    </tr>
    <tr>
      <td rowspan="2">DiagnosticReport-select</td>
      <td><code class="language-plaintext highlighter-rouge">select</code></td>
      <td>ImagingSelection</td>
      <td>R</td>
      <td>Bring images and/or annotations <i>to focus</i> and able to apply user commands (See Note 1)</td>      
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">select</code></td>
      <td>Observation</td>
      <td>R</td>
      <td>Bring measurements and annotations <i>to focus</i> and able to apply user commands (See Note 1)</td>      
    </tr>
    <tr>
      <td>DiagnosticReport-close</td>
      <td><code class="language-plaintext highlighter-rouge">report</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Stop display the study report</td>      
    </tr>    
    <tr>
      <td>SyncError</td>
      <td><code class="language-plaintext highlighter-rouge">operationoutcome</code></td>
      <td>OperationOutcome</td>
      <td>O</td>
      <td>Notify the user regarding the synchronization error, including the details of the error reported and the Subscriber that reported the error</td>      
    </tr>
  </tbody>
</table>

> Note 1: The Report Creator may provide application logic that can make use of the selected resources. For example, a nodule (as `ImagingSelection`) and corresponding measurements (as `Observation`) are selected. Then the radiologist issues a voice command "insert hyperlink". In this case, the Report Creator applies the command with the selected resources and insert a hyperlink reference to the nodule with measurement.

In addition to the requirements in the Table 1:XX.1.1.2.1-1, when received a DiagnosticReport-open event, the Report Creator shall detect if the report context is a new report context or a report context that is resumed.

> Note: The DiagnosticReport-open event does not explicitly indicate if the report context is new or resumed. See [Subscriber Local Context and Local State](volume-1.html#1xx4110-subscriber-local-context-and-local-state) for design considerations.

If the report context is resumed, then the Report Creator shall be able to restore the application to the same state associated to the report context as before the interruption.

##### 1:XX.1.1.2.2 Event Producing Requirements

If the Report Creator accepted an event initially (i.e., returning `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Hub using Notify Error [RAD-X11](rad-x11.html).

The Report Creator shall be grouped with a Content Creator to publish report status update associated to the report anchor context. In the `DiagnosticReport-update` context change request, the report status update shall be specified in `DiagnosticReport.status` in the `update` context key. It may support other content sharing resources.

- `Observation`: clinical findings or impressions

#### 1:XX.1.1.3 Worklist Client

The Worklist Client is responsible for providing a reporting worklist to the user.

When a user selects studies from the worklist, the Worklist Client launches other applications (e.g., Image Display, Report Creator, etc.) if necessary. It opens a new report context to synchronize other applications through the Hub to enable dictation on the studies.

When a study dictation is complete, the Worklist Client consumes the report anchor context update event so that it can mark the study as dictated and remove it from the worklist.

The Worklist Client shall be capable of being launched by another application. When launched, it shall use the provided `hub.url` and `hub.topic` to join a reporting session.

The Worklist Client shall be able to launch other applications and synchronize them to the same report context through the Hub. It shall have the following capabilities: 
- Start a new reporting session by generating a unique session ID and subscribing to the Hub on its own
- Launch one or more actors and provide them the URL of the Hub as `hub.url` and the reporting session ID as `hub.topic`
- Open report context based on some business logic

> Note that the actual application launch method is out of scope of this profile. See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

##### 1:XX.1.1.3.1 Event Handling Requirements

In Table 1:XX.1.1.3.1-1, for each Received Event, Context Key specifies the context in the received event (including the special `updates` and `select` contexts used in content sharing) and Resources specifies the FHIR resources used in the given context.
The Worklist Client shall support all Behaviors shown as “R” in Optionality. The Worklist Client may support suggested behaviors ("O" in Optionality).

**Table 1:XX.1.1.3.1-1: Event Handling Requirements**

<table class="grid">
  <thead>
    <tr>
      <th>Received Event</th>
      <th>Context Key</th>
      <th>Resources</th>
      <th>Optionality</th>
      <th>Behavior</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="3">DiagnosticReport-open</td>
      <td><code class="language-plaintext highlighter-rouge">report</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Maintain association of report context to associated patient and study.</td>
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">patient</code></td>
      <td>Patient</td>
      <td>R</td>
      <td>Display the patient metadata</td>
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">study</code></td>
      <td>ImagingStudy</td>
      <td>R</td>
      <td>Display the study metadata</td>
    </tr>
    <tr>
      <td>DiagnosticReport-update</td>
      <td><code class="language-plaintext highlighter-rouge">updates</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Reflect updated status <code class="language-plaintext highlighter-rouge">DiagnosticReport.status</code> in worklist</td>
    </tr>
    <tr>
      <td>DiagnosticReport-select</td>
      <td><code class="language-plaintext highlighter-rouge">select</code></td>
      <td>Any</td>
      <td>O</td>
      <td>Process selected resources if applicable</td>
    </tr>
    <tr>
      <td>DiagnosticReport-close</td>
      <td><code class="language-plaintext highlighter-rouge">report</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Stop processing the study associated to the report context</td>
    </tr>    
    <tr>
      <td>SyncError</td>
      <td><code class="language-plaintext highlighter-rouge">operationoutcome</code></td>
      <td>OperationOutcome</td>
      <td>O</td>
      <td>Notify the user regarding the synchronization error, including the details of the error reported and the Subscriber that reported the error</td>
    </tr>
  </tbody>
</table>

> Note 1: This does not trigger the Worklist Client to change the report context to the referenced study in the event.

In addition to the requirements in the Table 1:XX.1.1.3.1-1, when received a DiagnosticReport-open event, the Worklist Client shall detect if the report context is a new report context or a report context that is resumed.

> Note: The DiagnosticReport-open event does not explicitly indicate if the report context is new or resumed. See [Subscriber Local Context and Local State](volume-1.html#1xx4110-subscriber-local-context-and-local-state) for design considerations.

If the report context is resumed, then the Worklist Client shall be able to restore the application to the same state associated to the report context as before the interruption.

##### 1:XX.1.1.3.2 Event Producing Requirements

If the Worklist Client accepted an event initially (i.e., returning `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Hub using Notify Error [RAD-X11](rad-x11.html).

#### 1:XX.1.1.4 Evidence Creator

The Evidence Creator is responsible for consuming events in the reporting session and producing evidence data such as annotations, measurements, key image references, etc. for the patients' studies. For example, it may detect lung nodules and produce measurements and bounding boxes of the nodules detected.

The Evidence Creator may capture the evidence data in format such as DICOM SR and shared with other systems using methods outside of this profile (e.g., as Evidence Creator in the IHE AIR Profile). In this case, other synchronizing applications in the same reporting session may not be aware of the evidence data created by the Evidence Creator.

Alternatively the Evidence Creator may capture the evidence data (e.g., lung nodule measurements as FHIR Observation resource, image references and bounding box as FHIR ImagingSelection resource) and share them by publishing content sharing events back to the reporting session through the Hub.

The Evidence Creator may be a standalone application such as an Specialty AI application, or it may be grouped with another actor such as Image Display.

The Evidence Creator shall be capable of being launched by another application. When launched, it shall use the provided `hub.url` and `hub.topic` to join a reporting session.

##### 1:XX.1.1.4.1 Event Handling Requirements

In Table 1:XX.1.1.4.1-1, for each Received Event, Context Key specifies the context in the received event (including the special `updates` and `select` contexts used in content sharing) and Resources specifies the FHIR resources used in the given context.
The Evidence Creator shall support all Behaviors shown as “R” in Optionality. The Evidence Creator may support suggested behaviors ("O" in Optionality).

**Table 1:XX.1.1.4.1-1: Event Handling Requirements**

<table class="grid">
  <thead>
    <tr>
      <th>Received Event</th>
      <th>Context Key</th>
      <th>Resources</th>
      <th>Optionality</th>
      <th>Behavior</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="3">DiagnosticReport-open</td>
      <td><code class="language-plaintext highlighter-rouge">report</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Maintain association of report context to associated patient and study</td>
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">patient</code></td>
      <td>Patient</td>
      <td>R</td>
      <td>Process the patient data</td>
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">study</code></td>
      <td>ImagingStudy</td>
      <td>R</td>
      <td>Process the study data</td>
    </tr>
    <tr>
      <td>DiagnosticReport-update</td>
      <td>Any</td>
      <td>Any</td>
      <td>O</td>
      <td>Update the report, patient or study record, or add/modify/delete received contents, if applicable.</td>
    </tr>
    <tr>
      <td>DiagnosticReport-select</td>
      <td>Any</td>
      <td>Any</td>
      <td>O</td>
      <td>Process the applicable selected resources</td>
    </tr>
    <tr>
      <td>DiagnosticReport-close</td>
      <td><code class="language-plaintext highlighter-rouge">report</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Stop processing the study data associated to the report context</td>
    </tr>    
    <tr>
      <td>SyncError</td>
      <td><code class="language-plaintext highlighter-rouge">operationoutcome</code></td>
      <td>OperationOutcome</td>
      <td>O</td>
      <td>Notify the user regarding the synchronization error, including the details of the error reported and the Subscriber that reported the error</td>
    </tr>
  </tbody>
</table>

In addition to the requirements in the Table 1:XX.1.1.4.1-1, when received a DiagnosticReport-open event, the Evidence Creator shall detect if the report context is a new report context or a report context that is resumed.

> Note: The DiagnosticReport-open event does not explicitly indicate if the report context is new or resumed. See [Subscriber Local Context and Local State](volume-1.html#1xx4110-subscriber-local-context-and-local-state) for design considerations.

If the report context is resumed, then the Evidence Creator shall be able to restore the application to the same state associated to the report context as before the interruption.

##### 1:XX.1.1.4.2 Event Producing Requirements

If the Evidence Creator accepted an event initially (i.e., returning `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Hub using Notify Error [RAD-X11](rad-x11.html).

If the Evidence Creator is grouped with a Content Creator to publish content events to a reporting session, then it shall publish events using at least one FHIR resource. The Evidence Creator is highly recommended to publish events using one or more of the following FHIR resources that are expected to be useful in reporting:

- `ImagingSelection`: image / series references and simple annotations such as bounding boxes
- `Observation`: measurements and annotations
- `DocumentReference`: results from IHE AI Results Profile using the [JSON Representation of DICOM SR](https://www.dicomstandard.org/News-dir/ftsup/docs/sups/Sup219.pdf), or other documents |

#### 1:XX.1.1.5 Stateless Evidence Creator

The Stateless Evidence Creator has the same requirements as the Evidence Creator, except that it is *not* required to detect if the received DiagnosticReport-open event is a new report context or a report context that is resumed, and it is *not* required to restore application state in case of resuming a report context (See Evidence Creator [Event Handling Requirements](volume-1.html#1xx1141-event-handling-requirements) for details).

#### 1:XX.1.1.6 Content Creator

The Content Creator is responsible for the creation and selection of the contents of the reporting session which are the basis of synchronization and collaboration between the subscribing actors.

> Note: This actor represents content creation / selection capabilities that may be present in implementation of other actors. As such, the Content Creator is required to be grouped with another actor. This actor cannot be claimed as a standalone actor.

For example, when an Image Display user clicks on the bounding box of a detected nodule, the grouped Content Creator publishes a selection event referencing the affected images and bounding boxes as an ImagingSelection resource, and referencing the corresponding measurements as an Observation resource. Upon receiving the event, a Report Creator might show those details in a side panel to the user. Finally the user issues a voice command to the Report Creator to inject a hyperlink, which is adding to the finding section.

The Content Creator may publish context and/or content changes as events to a reporting session. The Content Creator may select one or more contents and publish the selection events.

The specific context or content changes captured by the Content Creator depends on the grouped actor and the specific deployment scenario. For example:

| Grouped Actor | Potential Use | Relevant Resource |
| -- | -- | -- |
| Report Creator | Communicate report status update | DiagnosticReport |
| Evidence Creator | Image references<br>Bounding Boxes | ImagingSelection<br>Observation |
| Image Display | Comparison study used during reporting | ImagingStudy |
{: .grid}

The Content Creator shall only publish DiagnosticReport-select events for user initiated selection.

When the grouped actor restores the application to a previous known state due to resuming a report context, if there are any contents known to be selected by the user prior to the interruption and the grouped actor is the originator of the corresponding DiagnosticReport-select event, then
- The grouped actor shall prompt the user if the selections are still valid
- If valid, then the Content Creator shall send a DiagnosticReport-select event for the selected resources

#### 1:XX.1.1.7 Watcher

The Watcher is responsible for listening to events in a session and perform actions according to it business logic. The specific actions are out of scope of this profile.

For example, the Watcher consumes the initiation and termination of report contexts and calculates the turnaround time for different types of studies in different departments. Another example is that the Watcher monitors how often an Evidence Creator publishes content sharing events and correlates how effective an AI application is with respect to the turnaround time by comparison and time before and after the Evidence Creator is deployed.

The Watcher shall be capable of being launched by another application. When launched, it shall use the provided `hub.url` and `hub.topic` to join a reporting session.

##### 1:XX.1.1.7.1 Event Handling Requirements

In Table 1:XX.1.1.7.1-1, for each Received Event, Context Key specifies the context in the received event (including the special `updates` and `select` contexts used in content sharing) and Resources specifies the FHIR resources used in the given context.
The Watcher shall support all Behaviors shown as “R” in Optionality. The Watcher may support suggested behaviors ("O" in Optionality).

**Table 1:XX.1.1.7.1-1: Event Handling Requirements**

<table class="grid">
  <thead>
    <tr>
      <th>Received Event</th>
      <th>Context Key</th>
      <th>Resources</th>
      <th>Optionality</th>
      <th>Behavior</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="3">DiagnosticReport-open</td>
      <td><code class="language-plaintext highlighter-rouge">report</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Maintain association of report context to associated patient and study</td>
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">patient</code></td>
      <td>Patient</td>
      <td>R</td>
      <td>Process according to business logic</td>
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">study</code></td>
      <td>ImagingStudy</td>
      <td>R</td>
      <td>Process according to business logic</td>
    </tr>
    <tr>
      <td>DiagnosticReport-update</td>
      <td>Any</td>
      <td>Any</td>
      <td>O</td>
      <td>Update the report, patient or study record, or add/modify/delete received contents, if applicable.</td>
    </tr>
    <tr>
      <td>DiagnosticReport-select</td>
      <td>Any</td>
      <td>Any</td>
      <td>O</td>
      <td>Process the applicable selected resources</td>
    </tr>
    <tr>
      <td>DiagnosticReport-close</td>
      <td><code class="language-plaintext highlighter-rouge">report</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Stop processing the report context</td>
    </tr>    
    <tr>
      <td>SyncError</td>
      <td><code class="language-plaintext highlighter-rouge">operationoutcome</code></td>
      <td>OperationOutcome</td>
      <td>O</td>
      <td>Process the synchronization error, including the details of the error reported and the Subscriber that reported the error</td>
    </tr>
  </tbody>
</table>

##### 1:XX.1.1.7.2 Event Producing Requirements

If the Watcher accepted an event initially (i.e., returning `202` Accepted) and later decided to refuse the context or failed to process the event, then it shall send a `syncerror` event back to the Hub using Notify Error [RAD-X11](rad-x11.html).

#### 1:XX.1.1.8 Hub

The Hub is responsible for managing event flows between Subscribers in reporting sessions and maintaining the current context.

The Hub is responsible for authorizing the following:
- which Subscriber has permission to invoke what requests
- which context and content a Subscriber is eligible to access and in what type (e.g., read only, write only or ready and write)

> Note: This profile does not mandate a specific authorization mechanism. See [Cross Profile Considerations](volume-1.html#1xx6-ira-cross-profile-considerations) for recommendations.

The Hub shall support [content sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html).

The Hub shall monitor the established websocket connections. If it detects a websocket connection issue with a Subscriber, then the Hub shall
- Unsubscribe the Subscriber and drop the websocket connection
- Send a SyncError notification to other Subscribers using [RAD-X10](rad-x10.html)

##### 1:XX.1.1.8.1 Event Handling Requirements

The Hub shall be able to process all valid events conforming to the FHIRcast [Event Format](https://build.fhir.org/ig/HL7/fhircast-docs/2-3-Events.html) received using FHIRcast [Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html) requests.

> Note: This implies that the Hub cannot only process events defined in this profile. The Hub is required to support other valid events regardless of whether they are defined in the FHIRcast [Event Catalog](https://build.fhir.org/ig/HL7/fhircast-docs/3_Events.html). For example, Subscribers in a reporting session are permitted to send Request Context Change requests with events (e.g., `HeartBeat`, `ImagingStudy-*`, etc.) beyond those explicitly defined in this profile.

For all received events, the Hub shall support the following core behaviors:
- It shall receive and distribute the event to all Subscribers subscribed to that event type (see [Event Notification](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html))
- It shall manage the current context in the session for all context-change events (i.e., `*-open` and `*-close` events) (see [Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html))
- It shall serve as a transaction coordinator to avoid lost updates and other out of sync conditions when processing content sharing events (i.e., `*-update` and `*-select` events) (see [Content Sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html))
- If it receives `*-update`, `*-select` or `*-close` events for a context that is not opened, then it shall return `409` Conflict response.

Additional profile requirements for specific events are defined in the corresponding transactions.

## 1:XX.2 IRA Actor Options

Options that may be selected for each actor in this implementation guide, are listed in Table 1:XX.2-1 below. Dependencies between options, when applicable, are specified in notes.

**Table 1:XX.2-1: IRA - Actors and Options**

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
      <td>-</td>
    </tr>
    <tr>
      <td>Report Creator</td>
      <td>No options defined</td>
      <td>-</td>
    </tr>
    <tr>
      <td>Worklist Client</td>
      <td>No options defined</td>
      <td>-</td>
    </tr>
    <tr>
      <td>Evidence Creator</td>
      <td>No options defined</td>
      <td>-</td>
    </tr>
    <tr>
      <td>Resumable Evidence Creator</td>
      <td>No options defined</td>
      <td>-</td>
    </tr>
    <tr>
      <td>Content Creator</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td>Watcher</td>
      <td>No options defined</td>
      <td>-</td>
    </tr>
    <tr>
      <td>Hub</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
  </tbody>
</table>

## 1:XX.3 IRA Required Actor Groupings

An actor from this profile (Column 1) shall implement all of the required transactions and/or
content modules in this profile ***in addition to all*** of the requirements for the grouped actor (Column 3).

In some cases, required groupings are defined as at least one of an enumerated set of possible actors; this is designated by merging column one into a single cell spanning multiple potential grouped actors. Notes are used to highlight this situation.

Section 1:XX.5 describes some optional groupings that may be of interest for security
considerations and Section 1:52.6 describes some optional groupings in other related profiles.

**Table 1:XX.3-1: IRA Required Actor Groupings**

| IRA Actor | Grouping Condition | Actor(s) to be grouped with | Reference |
|-----------|--------------------|-----------------------------|-----------|
| Image Display | -- | None | -- |
| Report Creator | -- | None | -- |
| Worklist Client | -- | None | -- |
| Evidence Creator | -- | None | -- |
| Resumable Evidence Creator | -- | None | -- |
| Content Creator | -- | IRA / Image Display<br>IRA / Report Creator<br>IRA / Worklist Client<br>IRA / Evidence Creator<br>IRA / Resumable Evidence Creator | [IRA TF-1: 1.1](volume-1.html#1xx11-actors-description-and-actor-profile-requirements) |
| Watcher | -- | None | -- |
| Hub | -- | None | -- |
{: .grid}

## 1:XX.4 IRA Overview

### 1:XX.4.1 Concepts

#### 1:XX.4.1.1 Publish and Subscribe Model

At its heart, this profile synchronizes a group of applications using a Publish and Subscribe model as implemented by [FHIRcast](https://build.fhir.org/ig/HL7/fhircast-docs/index.html) which in turn is an implementation of [WebSub](https://www.w3.org/TR/websub/).

The following are some key concepts:
- Participating applications are `Subscribers` that register with and communicate with a `Hub`
- `Subscribers` do not communicate with other `Subscribers` directly.
- The `Hub` only communicates with authenticated `Subscribers`
- `Subscribers` can configure their subscription to limit what types of events the `Hub` forwards to them.
- When `Subscribers` generate data that should be made available to other applications, or perform actions of which other applications should be aware, they *publish* it by sending an event request with the relevant details to the Hub
- The `Hub` forwards accepted event requests from a `Subscriber` to other `Subscribers` subscribed to that type of event
- `Subscribers` react to events from the `Hub` based on their internal business logic
- It is not necessary (nor possible) for `Subscribers` to be aware of what other `Subscribers` (if any) are receiving an event they requested to be forwarded by the `Hub`, nor how other `Subscribers` react to the event
- The `Hub` maintains the current state of content (if any) associated with all open contexts
- `Subscribers` can request the current context and associated contents from the `Hub`
- The `Hub` can simultaneously manage multiple groups of `Subscribers` and their associated data in different `sessions`
- Each `session` is identified by a unique “topic ID”
- The `Subscriber` which opens a context typically is responsible for closing that context and is informally referred to as the Driving Application. A Driving Application (or other `Subscribers`) may launch other applications, providing them with the address of the `Hub` and the `topic ID` so they can join the same `session`.

#### 1:XX.4.1.2 Terminology and Model

The terminology used in FHIRcast and adopted in this profile can be found in the [Glossary](https://build.fhir.org/ig/HL7/fhircast-docs/5_glossary.html) page.

The following is a representation of the data model.

**Figure 1:XX.4.1.2-1: FHIRcast Concept Data Model**

<div>
    <img src="data_model.png" width="80%">
</div>
<br clear="all">

The following is a representation of the interaction model.

> Note: The term `Driving Application` and `Synchronizing Application` in the diagram are *convenient* terms instead of actual defined terms. They are used here to highlight the additional capabilities a driving application can do, in particular:
> - Start a new reporting session
> - Launch another application
> - Open (including resume) or close a report context

**Figure 1:XX.4.1.2-1: FHIRcast Concept Interaction Model**

<div>
    <img src="interaction_model.png" width="80%">
</div>
<br clear="all">

#### 1:XX.4.1.3 Long Session and Short Context

A `Session` is an abstract concept representing a shared workspace, such as a user's login session across multiple applications or a shared view of one application distributed to multiple users. A session results from a user logging into an application and can encompass one or more workflows.

For instance, a reporting session is a shared workspace across multiple applications to communicate activities of a user, such as initiating a new report context when opening a study for reporting. These applications as `Subscribers` share events using the `Hub`. As long as there are `Subscribers` associated to a `Session`, the `Session` stays open. Therefore a `Session` has a long duration.

A `Context` is a FHIR resource associated with a `Session` which indicates a subject on which applications should synchronize as appropriate to their functionality. As soon as the subject is complete, the corresponding `Context` can be closed. Therefore a `Context` has a limited duration within a `Session`.

#### 1:XX.4.1.4 Events vs Commands

Communication patterns between two systems fall in two general categories: `Commands` and `Events`.

`Events` represent facts that have happened. For example, `DiagnosticReport-open` represents an event that an application has opened a study for reporting. Note that an event has an initiator but no target recipient(s). It is the responsibility of any applications that are interested in such events to subscribe to them. Any applications subscribed to the event will receive the event and the application can determine how to process the event. The application that is producing the event is not aware of the actions being performed by the consuming applications, unless these consuming applications in turn publishes additional events.

On the other hand, `Commands` represent intention. In addition to an initiator, `Commands` have specific target recipient(s). For example, Send-Study represents an intention to send a study. The application that sends the commands often has direct knowledge of which applications should execute the commands, or delegate to a proxy service that has the knowledge.

In this profile, the messages that a `Subscriber` sends to the `Hub` represents an `Event`. Each event captures what has happened, and there is no explicit recipient(s) specified.

> Note: Some implementations may define commands using [Extensions](https://build.fhir.org/ig/HL7/fhircast-docs/2-8-Extensions.html) or custom events with explicit recipient(s). These are out of scope of this profile.

#### 1:XX.4.1.5 Timing of Sending an Event

A driving application is a subscriber that initiates a context change request. From the driving application perspective, it is desirable for all subscribers to be synchronized as soon as possible. On the other hand, FHIRcast is a network protocol which incurs a non-trivial cost to send each event. Therefore any implementation should take into account when an action is considered to be complete or stable, and hence ready to be captured and communicated as events.

For example, when a user is actively making measurements or annotations, instead of capturing every change a user made (e.g., incremental changes in size or location of a shape) as an event which can result in many intermittent and partial events, an application may use specific triggers (e.g., when a user saves the changes) or an idle time threshold to detect when the user completed making the changes. The application then creates the corresponding event(s) to capture the result.

On the other hand, this profile is designed to communicate _in-progress_ data as soon as possible. Therefore it is not desirable for the driving application to _wait_ too long. For example, if the driving application supports exporting measurements and annotations as DICOM SR or other DICOM objects, it is not appropriate to wait until the DICOM objects are created before sending the corresponding event.

A reasonable approach could be for an application to acquire a complete measurement and perhaps some measurement characteristics, then send an event request containing this information to the Hub.

This profile does not mandate any specific implementation design regarding when an application should capture the result of an action as an event. The intention is that the driving application will send an event as soon as feasible so that all subscribers in a reporting session can be synchronized and provide a good user experience.

#### 1:XX.4.1.6 Event Awareness vs Event Consumption

`Event Awareness` means an application, upon receiving an event from the `Hub`, has the knowledge that an event has happened.

`Event Consumption` means an application, upon receiving an event from the `Hub`, reacts to the event and performs some actions according to its business logic.

This means from the content sharing application perspective, in order to synchronize the context with other applications, it may be desirable to publish events frequently so that other subscribers can be aware of the same context as in the content sharing application.

On the other hand, from the subscribing application perspective, it is up to its business logic to determine how to react to the received event. This business logic may be automatic or require additional user input.

For example, when the user goes through the study images in Image Display (a content sharing application), for each nodule that the user identified (e.g., 1, 2, ..., 9, 10), the Image Display publishes a corresponding event. In the Report Creator (a subscribing application), for each event received, it keeps track of the nodule in its nodule tracking bookmark. Once the user finished reviewing the full study, the user uses the nodule tracking bookmark in the Report Creator and selects the top 3 (e.g., 2, 5, 9) to include in the final report. Note that since the Report Creator is aware of all the nodules observed by synchronizing the context with the Image Display, selecting a subset of the nodules to be included in the final report (i.e., event consumption) is an operation internal to the Report Creator.

#### 1:XX.4.1.7 Transient Resource vs Persistent Resource

FHIRcast uses FHIR resources to capture the context and content in an event. These FHIR resources may be transient, meaning that they do not necessarily exist in any system, nor are they expected to be persisted by any system. Furthermore, even an application decides to persist the FHIR resource(s), it is not required to use the same resource ID in the event as the ID of the persisted resource. The application can generate new IDs instead.

Since the FHIR resources specified in the event may or may not be persisted in any FHIR server, to differentiate between the two cases, this profile defines that transient resources are identified by relative references (e.g., Patient/12345) and persisted resources that already exist are identified by full URL (e.g., http://myserver.com/Patient/12345).

#### 1:XX.4.1.8 Local Tracking of Context

The `DiagnosticReport-open` event includes both the `report` anchor context and associated contexts `patient` and `study`. Subsequent event(s) for this anchor context will only provide the `report` context. Therefore, it is up to the Subscriber to record internally the `patient` and `study` contexts associated with the `report` anchor context if that information is relevant to its business logic. 

#### 1:XX.4.1.9 Suspend and Resume Report Context

Occasionally a report context may be _suspended_, meaning that a driving application opens a subsequent report context without closing an initial report context. For example, a radiologist needs to suspend a report on a study in order to review an urgent study.

The `Hub` switches the `Current Context` to the urgent study being opened. The `Hub` distributes the open event to all subscribers to keep them synchronized. The initial report context is still maintained by the `Hub` since it is not closed, but it is _suspended_ (i.e., not the `Current Context`). 

When the user finishes reviewing the urgent study, the report context of the urgent study is closed and all subscribers receive the close event. The `Hub` sets the `Current Context` to *empty* after closing the `Current Context`.

The driving application sends a *new* open event for the _suspended_ report context to make it the `Current Context`. All subscribers receive the open event and resume to the _suspended_ report context. Alternatively the driving application could choose to open any other report context as appropriate.

See [Use Case #3](volume-1.html#1xx423-use-case-3-interruption-and-resume-flow) for more details.

#### 1:XX.4.1.10 Resuming contexts: Subscriber Local Context and Local State

`Local context` and `local state` refers to the information specific to each Subscriber that it maintains locally for each report context in the session that it participates in. When resuming to a previous context, this information, if present, would enable the subscribing application to restore to the same state associated to the report context as before the suspension.

`Local context` refers to the Subscriber's view / copy of the shared context maintained in the Hub.

`Local state` refers to information related to a given context that is not replicated into the Hub This `local state` may keep track of application specific information, such as

- layout of the viewports
- image frames displayed in each viewport
- any user activity (e.g. user selected the image frame in a viewport)

Upon receiving events from the `Hub`, a Subscriber maintains its `local context` according to its need. i.e. the Subscriber is not to maintained a full copy of the context that is in the Hub, since some parts of the context may not be relevant to the Subscriber activities.

It is up to the Subscriber to decide on implementation details, such as:

- How much state that it can resume?
- How long should open contexts be maintained?
- How to detect if open contexts become stale?
- How to handle stale contexts?

#### 1:XX.4.1.11 Deployment Considerations

The Hub can be a standalone application or embedded within another application (e.g., the Image Manager, Report Creator and Worklist Client are grouped with the Hub independently). As a result, which Hub to use for the reporting session needs to be configurable during deployment.

The Hub can be deployed on premises or in the cloud. The other actors may or may not be deployed in the same location as the Hub. Since this profile is aimed at providing streamline user experience for all integrated applications, the effectiveness of this profile depends on timely communications with the Hub, whether it is the context change request, or the subsequent event distribution. Therefore it is important to have a reliable low latency network connection between applications and the Hub, taking into account all the network appliances in between (e.g., firewall, reverse proxy, load balancer, etc.).

#### 1:XX.4.1.12 FHIRcast Beyond Reporting

FHIRcast is a generic event distribution mechanism. Most transactions in this profile are generally applicable to any events. Any applications are permitted to use FHIRcast and the Hub for use cases beyond reporting. In this case, the application may consider using different sessions and events for different purposes. For example, an Image Manager may setup a separate *advanced visualization* session with an Evidence Creator and uses `ImagingStudy-*` events for communication.

> Note: The FHIRcast specification [Event Format](https://build.fhir.org/ig/HL7/fhircast-docs/2-3-Events.html#event-format) indicates that [FHIR resource]-(open | close | update | select) events should be supported even for FHIR resources not included in the specification's event library.

Furthermore, the Hub used in these cases may be different from the Hub used for the reporting session. Therefore an application needs to be prepared to support different sessions with different Hubs, and know which session to use for what purpose.

### 1:XX.4.2 Use Cases

#### 1:XX.4.2.1 Use Case \#1: Basic Reporting

In a basic reporting session, a user uses two systems, the Image Display and the Report Creator, to complete reporting on a study.

##### 1:XX.4.2.1.1 Basic Reporting Use Case Description

The Basic Reporting Use Case is intended to capture the common reporting activities happened during a reporting session. The Image Display handles all user needs for displaying the study and the Report Creator handles all user needs for report creation.

> Note: Figure 1:XX.4.2.2-1 shows a high level workflow and highlights the user interaction with the two actors involved. This use case is broken down into multiple steps. The steps shown in the diagram are not actual transactions. The interactions between the Image Display and Report Creator during a reporting session are omitted to highlight the user interactions more clearly. The hyperlinks provided in the diagram link to the subsections that describe the corresponding steps with actual transactions in details. Furthermore, the [Examples](example.html) tab contains sample events following this use case.

In this use case,
- Before reporting starts, the Image Display launches the Report Creator to join a reporting session
- The Image Display, with the built-in worklist function, has a set of studies waiting for reporting
- Radiologist uses the worklist to select studies to report
- Radiologist opens a study in Image Display to view the study images and patient metadata
- Radiologist reports on the study using the Report Creator
- While reporting on the study, Radiologist performs measurements and adds annotations on the images using tools provided by the Image Display
- Radiologist selects some of the measurements made and uses voice commands to auto-populate the report with the selected measurements
- Radiologist completes and signs off the report and moves on to the next study in the worklist
- Eventually, Radiologist finishes all studies in the reporting worklist and closes the applications

> Note: In more complex scenarios, separate Worklist Client can be used to drive the Image Display and Report Creator, while the Image Display can launch separate Evidence Creator on demand to perform advanced visualization and measurements. See [Use Case 2](volume-1.html#1xx422-use-case-2-complex-reporting) for an example.

##### 1:XX.4.2.1.2 Basic Reporting Process Flow

<div>
{%include ReportingFlow.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2-1: Basic Reporting Flow in IRA Profile

###### 1:XX.4.2.1.2.1 Step 1: Open Reporting Session

When a radiologist starts reporting, the Image Display, as a Driving Application, starts a reporting session.

Note that there is no explicit creation of a session. If the Hub receives a session (i.e., topic ID) that does not already exist, then the Hub will automatically create the session and add the subscriber (i.e., Image Display) to the session.

The Image Display subscribes to events so that it can:
- Receive events published by other Subscribers
- Receive the version ID of any events necessary for content sharing (see [Responsibilities of a FHIRcast Hub and a Subscriber](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html#responsibilities-of-a-fhircast-hub-and-a-subscriber) for more information)
- Receive synchronization error events from the Hub or from other Subscribers.

Once the Image Display completed its subscription, it launches the Report Creator. The Report Creator, as a Synchronizing Application, can follow the context and content events automatically.

> Note that *launching* the Report Creator (or any Synchronizing Application) by the Image Display (or any Driving Application) may be implemented in different ways. For example, the Synchronizing Application can be started and terminated, or it can be put in focus and minimized when not needed but kept running in the background for efficiency, or any combination thereof.

When launched, the first thing that the Report Creator does as a Synchronizing Application is to subscribe to the reporting session. The information about the Hub and the session is provided by the Image Display during launch.

Furthermore, the Report Creator queries the Hub to get the current context to ensure it has the latest context and content. Since the reporting session has just begun, and the Image Display has not yet opened any report context, the result of the query will be empty.

<div>
{%include step1-open-reporting-session.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.1.2.1-1: Open Reporting Session Flow in IRA Profile**

###### 1:XX.4.2.1.2.2 Step 2: Open Study in Context

When the radiologist selects a study in the worklist in the Image Display, as a Driving Application, opens a new report context. Once the Hub accepted the event, it broadcasts the event to all Subscribers.

The Report Creator, as a Synchronizing Application, receives the event and opens the corresponding procedure for the study.

Furthermore, the event has a version ID. For the Image Display as a Driving Application, including the version ID when submitting the next event allows the Hub to ensure proper event sequence. For the Report Creator as a Synchronizing Application, keeping track of the version ID enables it to check if it missed any prior events. Event sequencing is important for content sharing because all updates and selects are expected to be applied in the same sequence as they are emitted by one or more Content Creators (See [FHIRcast event-based content sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-1-ContentSharingFHIRcastMessaging.html) for details).

<div>
{%include step2-open-study-in-context.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.1.2.2-1: Open Study in Context Flow in IRA Profile**

###### 1:XX.4.2.1.2.3 Step 3: Add Content (Optional)

Sometimes the radiologist may annotate the images with markups and measurements. When this happened, the Image Display, grouped with the Content Creator, updates the report context at the Hub with new content using Update Report Content [RAD-X5]. The Hub broadcasts the event to all Synchronizing Applications.

When the Report Creator receives and accepts the event, it can apply the updates according to its business logic. For example, it may automatically create a hyperlink in the report, or keeps track of the content in a panel for the user to perform other activities later.

<div>
{%include step3-add-measurements.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.1.2.3-1: Add Content Flow in IRA Profile**

###### 1:XX.4.2.1.2.4 Step 4: Select Content (Optional)

Occasionally it is desirable to trigger activities on subscribers based on user navigation. With FHIRcast, this can be achieved using the content selection events.

Content selection can be used in various way:
- as input for a follow up action (e.g., images or measurements selected by a user in the Image Display as input for hyperlink in the Report Creator)
- bring something to focus (e.g., user clicks on a measurement in a report in the Report Creator which triggers the Image Display to bring the corresponding images to focus)

Sometimes the radiologist selected certain elements (e.g., images, annotation, specific measurements, etc.) in the Image Display. When this happened, the Image Display, grouped with the Content Creator, sends a event to the Hub using Select Report Content [RAD-X6] indicating what contents have been selected. The Hub broadcasts the event to all Subscribers.

When the Report Creator receives the event, it can apply the selection according to its business logic. For example, it can highlight to the user what is selected so that the user can perform an appropriate action. In this example, the radiologist uses a voice command to insert a hyperlink in the report. The Report Creator uses the selected content to generate the hyperlink.

Generally, selecting a content means putting the content in 'focus'. Note that this profile is agnostic about the user interface implementation of 'focus', e.g., it may result in the selected contents being highlighted in the user interface, or it may result in the selected contents being flagged in the backend service. Specific behavior depends on the implementation.

<div>
{%include step4-select-measurements.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.1.2.4-1: Select Content Flow in IRA Profile**

###### 1:XX.4.2.1.2.5 Step 5: Sign-off Report

The radiologist completes dictation and signs off the report on the Report Creator. The Report Creator sends an update event notifying about the report status change (e.g., complete normally, draft complete, sent to transcriptionist, etc.) The Image Display updates the status of the study in its worklist.

In this diagram, the Report Creator closes the report context after it sent the report status update event. Recall that this report context was opened by the Image Display. 

> Note: Alternatively, the Image Display can close the report context upon successfully processing the report status update event. Both scenarios are valid and which method is used is determined by site configuration of the Image Display and Report Creator.

The Hub sends the update event and the termination event to all Subscribers. Once the Hub successfully processed the termination event, it disallows any further interaction of that closed report context.

Upon receiving the termination event, the Image Display removes the study from its worklist.

> Note: The Image Display may have different behavior when processing the termination event depending on the report status of the study. For example, if the status is *draft completed*, then the Image Display may set the study in a separate Draft worklist for later follow up.

The Report Creator may have some internal mechanism to keep the report for a grace period after the report is signed off and before sending the report to other recipients. The Report Creator persists the report according to its business logic.

<div>
{%include step5-signoff-report.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.1.2.5-1: Sign-off Report Flow in IRA Profile**

The flow above shows the simple case with a sequential switching of report context. In this case, a report context is opened and then closed before the next report context is opened.

In practice, the radiologist is likely to continue with the next study in the worklist without any awareness of the events happening behind the scene. If the initiating Driving Application and terminating Driving Application are different as in this example, then it is possible that the radiologist moves to the next study and hence the Image Display opens a new report context before the Image Display receives the Close Report Context [RAD-X4] event of the reported study.

Such rapid context switching is supported by this profile. The Hub and each Subscriber maintain multiple open contexts simultaneously. As long as the context is not closed, it still exists. Each event is associated to a particular anchor context. Therefore a Subscriber can reliably match an event to its internal state according to the context ID of the anchor context in the event. 

The following diagram shows what can happen in case of rapid switching of the report context.

<div>
{%include rapid_switch_context.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.1.2.5-2: Rapid Context Switching Flow in IRA Profile**

###### 1:XX.4.2.1.2.6 Step 6: Close Reporting Session

Eventually, the radiologist completed all the studies in the worklist and closes the Report Creator. The Report Creator unsubscribes to the reporting session so that it will no longer receives any future events.

The Hub closes the connection to the Report Creator. Note that if there are other Subscribers on the same session, those applications are not affected and will continue to receive notification on the session.

<div>
{%include step6-terminate-reporting-session.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.1.2.6-1: Close Reporting Session Flow in IRA Profile**

#### 1:XX.4.2.2 Use Case \#2: Complex Reporting

This reporting workflow is more complex because there are 5 systems collaborating closely:

- Worklist Client: Manages a set of studies waiting for reporting
- Image Display: Displays the selected study and patient metadata
- Report Creator: Captures dictation from Radiologist and creates report
- Evidence Creator: Processes study, provides advanced visualization and produces clinical results
- Hub: Manages the different application subscriptions, maintains report context and distributes events

In this diagram, a single Evidence Creator performs multiple functions. Alternatively, there can be multiple Evidence Creators, each performing a specific function.

In this use case,
- The Worklist Client has a set of studies waiting for reporting
- Radiologist uses the worklist to select studies to report
- Before reporting starts, the Worklist Client starts the reporting session and launches the Image Display and Report Creator to join the session
- When Radiologist opens a study in Worklist Client,
  - Image Display automatically synchronizes and views the corresponding study images and patient metadata
  - Report Creator automatically synchronizes and opens a new report for the corresponding study
- While viewing the study in Image Display, Radiologist clicks the advanced processing button in Image Display to execute the integrated Evidence Creator
- After launched, Evidence Creator automatically synchronizes and processes the study
- After finished processing, Evidence Creator shares the outputs back with other applications in the reporting session
- Image Display automatically shows the outputs from Evidence Creator
- Radiologist accepts the results in Image Display, which in turn shares the Radiologist decisions as observation with other applications in the reporting session
- Report Creator automatically updates the report with the Radiologist decisions according to the observation
- Radiologist completes and signs off the report and moves on to the next study in the worklist
- Eventually, Radiologist finishes all studies in the reporting worklist and closes the applications

Note that at Step 7, since all the necessary applications have already been started, there is no need to relaunch the applications and re-establish their subscriptions. However, it may be desirable for some specialty applications that are not in common use to be terminated and restarted if their capabilities are later required.

<div>
{%include multi_app.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.2-1: Complex Reporting in IRA Profile**

#### 1:XX.4.2.3 Use Case \#3: Interruption and Resume Flow

Occasionally a radiologist is interrupted while reporting on a study. She needs to open a different study (e.g., for consultation purpose) before the study that is currently in progress is ready for sign-off.

This profile permits a new report context to be opened before the previous report context is closed. The Hub can maintain multiple anchor contexts simultaneously within a reporting session. The current context is the most recent anchor context that has been opened but not yet closed. This current context enables all Synchronizing Applications to be synchronized and working on the same context all the time.

Once the *interrupting* study is complete, the Image Display closes the report context of the *interrupting* study. The Hub removes the context of the *interrupting* study and set the current context to *empty*. The Image Display, as the Driving Application in this example, resumes the report context back to the previously opened study. It restores its application state associated to the report context the same as prior to the interruption and then re-opens the same report context to the Hub. Note that all associated context and contents remain in the Hub.

As a result, all subscribers will resume to the same report context. If an application has business logic to resume something else rather than the previous report context, that application should send a new Open Report Context [RAD-X3] event to set the new report context accordingly.

<div>
{%include interruption-and-resume.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.3-1: Interruption and Resume Flow in IRA Profile**

#### 1:XX.4.2.4 Use Case \#4: Error Handling Flow

Error handling is driven by two factors:
- Synchronous vs Asynchronous
- Subscriber initiated vs Hub initiated

<div>
{%include syncerror.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.4-1: Error Handling Flow in IRA Profile**

Figure 1:XX.4.2.4-2 shows two sample use cases how error handling can be used in reporting.

<div>
{%include syncerror_use_case.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.4-2: Error Handling Example Flows in IRA Profile**

#### 1:XX.4.2.5 Use Case \#5: Overread Draft Report

A radiologist wants to review a draft report created by a residence. She opens the draft report in the Report Creator. The Report Creator opens a new report context for the draft report, including the corresponding patient and study context. The Image Display receives the event distributed by the Hub and opens the study in context. The radiologist reviews the study associated to the report using the Image Display.

Later a radiologist selects a nodule measurement on the report. The Report Creator sends a content selection event for the observation. The Image Display receives the event and display the observation on the study.

In case a reporting session has not been started when the radiologist reviews the draft report, the Report Creator can start a new reporting session and launch the Image Display to join it.

<div>
{%include report-overread.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.5-1: Overread Draft Report Flows in IRA Profile**

## 1:XX.5 IRA Security Considerations

This profile strongly recommends all actors to consider the FHIRcast [Security Considerations](https://build.fhir.org/ig/HL7/fhircast-docs/4-3-security-considerations.html).

This profile strongly recommends all actors group with an ITI ATNA Secure Application or Secure Node Actor using the Radiology Audit Trail Option.

The ATNA Profile requires actors to implement:
- [Record Audit Event](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html) [ITI-20] transaction which would record when and where analysis results are distributed and displayed.
- [Authenticate Node](https://profiles.ihe.net/ITI/TF/Volume2/ITI-19.html) [ITI-19] transaction to further ensure the integrity of transactions using node authentication and communication encryption.

Furthermore, for the HTTP-based transactions, this profile strongly recommends the use of ITI [Internet User Authorization](https://profiles.ihe.net/ITI/TF/Volume1/ch-34.html) (IUA) Profile to ensure that communications are only allowed for authenticated and authorized users and/or systems.

Additionally, although this profile does not specify any particular method for an application to launch other synchronizing applications, this profile strongly recommends the use of [SMART App Launch](http://www.hl7.org/fhir/smart-app-launch/app-launch.html) for application launching. In addition to the use of OAuth2 as specified in the ITI IUA Profile, FHIRcast extends SMART App Launch with FHIRcast specific OAuth2 scopes that can be used by the Hub to validate if the Subscriber is authorized to invoke the transaction. Furthermore, the authorization server returns the FHIRcast SMART launch parameters which can be used by the synchronizing applications to join the session. See [Section 4.1.1 SMART on FHIR](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html#smart-on-fhir) for more details.

Note that with FHIRcast, the authentication and authorization is controlled at the time of subscription and per context change request. Once the websocket connections are established, there is no further authorization for event distribution.

The events as defined in this profile contain personal demographic information and clinical information. It is appropriate for products implementing the this profile to include appropriate PHI controls. Specifying such mechanisms and features is outside the scope of this profile.

## 1:XX.6 IRA Cross-Profile Considerations

Table 1:XX.6-1 describes various actors in various other profiles that might be useful to group with IRA Profile actors.

**Table 1:XX.6-1: IRA - Optional Actor Groupings**

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
      <td rowspan="3">Report Creator</td>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf">IMR Report Creator</a></td>
      <td>To produce multi-media interactive report using the context and content received.</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor.</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/RAD/IMR/index.html">IMR Report Creator</a></td>
      <td>To receive image references and measurements input from Image Display for the interactive hyperlinks.</td>
    </tr>
    <tr>
      <td rowspan="3">Image Display</td>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol1.pdf">SWF.b Image Display</a></td>
      <td>To display patients' studies and share context and content with other synchronized applications</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor.</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/RAD/IMR/index.html">IMR Image Display</a></td>
      <td>To enhance the interactivity with the Report Creator after the Image Display is launched.</td>
    </tr>
    <tr>
      <td>Worklist Client</td>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor.</td>
    </tr>
    <tr>
      <td rowspan="4">Evidence Creator</td>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol1.pdf">SWF.b Evidence Creator</a></td>
      <td>To provide measurements and other evidence data and share the content with other synchronized applications.</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor.</td>
    </tr>
    <tr>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIW-I.pdf">AIW-I Task Performer</a></td>
      <td>To provide an additional method to share the output with other synchronizing applications in a reporting session.</td>
    </tr>
    <tr>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIR.pdf">AIR Evidence Creator</a></td>
      <td>To support creating the various AI results.</td>
    </tr>
    <tr>
      <td rowspan="4">Resumable Evidence Creator</td>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol1.pdf">SWF.b Evidence Creator</a></td>
      <td>To provide measurements and other evidence data and share the content with other synchronized applications.</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor.</td>
    </tr>
    <tr>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIW-I.pdf">AIW-I Task Performer</a></td>
      <td>To provide an additional method to share the output with other synchronizing applications in a reporting session.</td>
    </tr>
    <tr>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIR.pdf">AIR Evidence Creator</a></td>
      <td>To support creating the various AI results.</td>
    </tr>
    <tr>
      <td rowspan="2">Watcher</td>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor.</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">AIW-I Watcher</a></td>
      <td>To watch an additional infrastructure for events.</td>
    </tr>
    <tr>
      <td>Hub</td>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Resource Server</a></td>
      <td>To enforce only authorized access to the resources stored in the repository.</td>
    </tr>
  </tbody>
</table>