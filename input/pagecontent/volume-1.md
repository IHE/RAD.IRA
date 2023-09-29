The Integrated Reporting Applications (IRA) Profile helps applications that are used together during reporting (e.g., image display, report creator, clinical applications, AI tools, etc.) to share information using a standard called FHIRcast. Each application can share data it is using or creating, referred to as Content. Each application can also signal a change in the patient, study or report being worked on, referred to as Context, so that other applications can switch to that new Context in an automated and synchronized fashion. Other applications are notified so they can then intelligently synchronize their behavior or use the new data.

For example, the report creator could share that the user is starting a new report, and the other applications could synchronize by opening the corresponding study. An AI tool could generate a tumor measurement and the report creator could get that data and add an entry in the report after reviewed by the radiologist.

Note that there are often other supporting activities happening during reporting. For example, an Image Display triggers a tumor analysis application to detect any tumors exist in the study. These supporting activities are out of scope in this profile.

# 1:53.1 IRA Actors, Transactions, and Content Modules
This section defines the actors, transactions, and/or content modules in this profile. General
definitions of actors are given in the Technical Frameworks General Introduction [Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html).
IHE Transactions can be found in the Technical Frameworks General Introduction [Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html).
Both appendices are located at <https://profiles.ihe.net/GeneralIntro/>.

Figure 1:53.1-1 shows the actors directly involved in the IRA Profile and the relevant transactions
between them. If needed for context, other actors that may be indirectly involved due to their participation
in other related profiles are shown in dotted lines. Actors which have a required
grouping are shown in conjoined boxes (see [Section 1:53.3](#1533-ira-required-actor-groupings)).

<div>
    <img src="actor_transaction.png" width="80%">
</div>
<br clear="all">

**Figure 1:53.1-1: IRA Actor Diagram**

Table 1:53.1-1 lists the transactions for each actor directly involved in the IMR Profile. To claim compliance with this profile, an actor shall support all required transactions (labeled “R”) and may support the optional transactions (labeled “O”).

**Table 1:53.1-1: IRA Profile - Actors and Transactions**

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
      <td rowspan="9"><a href="volume-1.html#153111-image-display">Image Display</a></td>
      <td>Subscribe to Reporting Session [RAD-146]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-146.html">RAD TF-2: 4.146</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-147]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-147.html">RAD TF-2: 4.147</a></td>
    </tr>
    <tr>
      <td>Open Report Context [RAD-148]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-148.html">RAD TF-2: 4.148</a></td>
    </tr>
    <tr>
      <td>Close Report Context [RAD-149]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-149.html">RAD TF-2: 4.149</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-152]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-152.html">RAD TF-2: 4.152</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-153]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-153.html">RAD TF-2: 4.153</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-154]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-154.html">RAD TF-2: 4.154</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-155]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-155.html">RAD TF-2: 4.155</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-156]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-156.html">RAD TF-2: 4.156</a></td>
    </tr>
    <tr>
      <td rowspan="9"><a href="volume-1.html#153112-report-creator">Report Creator</a></td>
      <td>Subscribe to Reporting Session [RAD-146]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-146.html">RAD TF-2: 4.146</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-147]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-147.html">RAD TF-2: 4.147</a></td>
    </tr>
    <tr>
      <td>Open Report Context [RAD-148]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-148.html">RAD TF-2: 4.148</a></td>
    </tr>
    <tr>
      <td>Close Report Context [RAD-149]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-149.html">RAD TF-2: 4.149</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-152]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-152.html">RAD TF-2: 4.152</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-153]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-153.html">RAD TF-2: 4.153</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-154]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-154.html">RAD TF-2: 4.154</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-155]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-155.html">RAD TF-2: 4.155</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-156]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-156.html">RAD TF-2: 4.156</a></td>
    </tr>
    <tr>
      <td rowspan="9"><a href="volume-1.html#153113-worklist-client">Worklist Client</a></td>
      <td>Subscribe to Reporting Session [RAD-146]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-146.html">RAD TF-2: 4.146</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-147]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-147.html">RAD TF-2: 4.147</a></td>
    </tr>
    <tr>
      <td>Open Report Context [RAD-148]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-148.html">RAD TF-2: 4.148</a></td>
    </tr>
    <tr>
      <td>Close Report Context [RAD-149]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-149.html">RAD TF-2: 4.149</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-152]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-152.html">RAD TF-2: 4.152</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-153]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-153.html">RAD TF-2: 4.153</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-154]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-154.html">RAD TF-2: 4.154</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-155]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-155.html">RAD TF-2: 4.155</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-156]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-156.html">RAD TF-2: 4.156</a></td>
    </tr>
    <tr>
      <td rowspan="7"><a href="volume-1.html#153114-evidence-creator">Evidence Creator</a></td>
      <td>Subscribe to Reporting Session [RAD-146]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-146.html">RAD TF-2: 4.146</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-147]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-147.html">RAD TF-2: 4.147</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-152]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-152.html">RAD TF-2: 4.152</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-153]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-153.html">RAD TF-2: 4.153</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-154]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-154.html">RAD TF-2: 4.154</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-155]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-155.html">RAD TF-2: 4.155</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-156]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-156.html">RAD TF-2: 4.156</a></td>
    </tr>
    <tr>
      <td rowspan="7"><a href="volume-1.html#153115-stateless-evidence-creator">Stateless Evidence Creator</a></td>
      <td>Subscribe to Reporting Session [RAD-146]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-146.html">RAD TF-2: 4.146</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-147]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-147.html">RAD TF-2: 4.147</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-152]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-152.html">RAD TF-2: 4.152</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-153]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-153.html">RAD TF-2: 4.153</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-154]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-154.html">RAD TF-2: 4.154</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-155]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-155.html">RAD TF-2: 4.155</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-156]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-156.html">RAD TF-2: 4.156</a></td>
    </tr>    
    <tr>
      <td rowspan="2"><a href="volume-1.html#153116-content-creator">Content Creator</a></td>
      <td>Update Report Content [RAD-150]</td>
      <td>Initiator</td>
      <td>O (Note 1)</td>
      <td><a href="rad-150.html">RAD TF-2: 4.150</a></td>
    </tr>
    <tr>
      <td>Select Report Content [RAD-151]</td>
      <td>Initiator</td>
      <td>O (Note 1)</td>
      <td><a href="rad-151.html">RAD TF-2: 4.151</a></td>
    </tr>
    <tr>
      <td rowspan="7"><a href="volume-1.html#153117-watcher">Watcher</a></td>
      <td>Subscribe to Reporting Session [RAD-146]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-146.html">RAD TF-2: 4.146</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-147]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-147.html">RAD TF-2: 4.147</a></td>
    </tr>
    <tr>
      <td>Unsubscribe Session [RAD-152]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-152.html">RAD TF-2: 4.152</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-153]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-153.html">RAD TF-2: 4.153</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-154]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-154.html">RAD TF-2: 4.154</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-155]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-155.html">RAD TF-2: 4.155</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-156]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-156.html">RAD TF-2: 4.156</a></td>
    </tr>
    <tr>
      <td rowspan="11"><a href="volume-1.html#153118-hub">Hub</a></td>
      <td>Subscribe to Reporting Session [RAD-146]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-146.html">RAD TF-2: 4.146</a></td>
    </tr>
    <tr>
      <td>Connect to Notification Channel [RAD-147]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-147.html">RAD TF-2: 4.147</a></td>
    </tr>
    <tr>
      <td>Open Report Context [RAD-148]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-148.html">RAD TF-2: 4.148</a></td>
    </tr>
    <tr>
      <td>Close Report Context [RAD-149]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-149.html">RAD TF-2: 4.149</a></td>
    </tr>
    <tr>
      <td>Update Report Content [RAD-150]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-150.html">RAD TF-2: 4.150</a></td>
    </tr>
    <tr>
      <td>Select Report Content [RAD-151]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-151.html">RAD TF-2: 4.151</a></td>
    </tr>
    <tr>
      <td>Unsubscribe from Session [RAD-152]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-152.html">RAD TF-2: 4.152</a></td>
    </tr>
    <tr>
      <td>Get Current Context [RAD-153]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-153.html">RAD TF-2: 4.153</a></td>
    </tr>
    <tr>
      <td>Distribute Context Event [RAD-154]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-154.html">RAD TF-2: 4.154</a></td>
    </tr>
    <tr>
      <td>Generate SyncError Event [RAD-155]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-155.html">RAD TF-2: 4.155</a></td>
    </tr>
    <tr>
      <td>Notify Error [RAD-156]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-156.html">RAD TF-2: 4.156</a></td>
    </tr>
  </tbody>
</table>

> Note 1: A Content Creator shall support at least one of the update or select transactions.

### 1:53.1.1 Actors Description and Actor Profile Requirements
Most requirements are documented in RAD TF-2: Transactions. This section documents any additional requirements on this profile's actors.

> Note: Many actor requirements below assume an understanding of FHIRcast and how this profile uses it. Please refer to the [Concepts](https://profiles.ihe.net/RAD/IRA/volume-1.html#15341-concepts) section.

#### 1:53.1.1.1 Image Display

The Image Display presents patients' studies and relevant information to the user so that the user can make diagnostic decisions on the studies.

The Image Display provides tools for the user to navigate images in a study. It may include a worklist component that lets the user select studies to read. It may also include tools to create evidence data such as annotations, key images, etc.

When the Image Display starts up, it shall obtain `hub.url` and `hub.topic` to join a reporting session.

The Image Display shall be able to launch other applications and synchronize them to the same report context through the Hub. It shall have the following capabilities: 
- Start a new reporting session by generating a unique session ID and subscribing to the Hub on its own
- Launch one or more actors and provide them the URL of the Hub actor as `hub.url` and the reporting session ID as `hub.topic`

> Note that the actual application launch method is out of scope of this profile. See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

##### 1:53.1.1.1.1 Event Handling Requirements

Table 1:53.1.1.1.1-1 specifies behavior requirements for the Image Display when it receives FHIRcast events.

The Image Display shall support all Behaviors shown as “R” in Optionality. The Image Display may support suggested behaviors ("O" in Optionality). For each Received Event in the table, 'Context Key' identifies the context in the Received Event, and 'Resources' specifies the FHIR resource used in the given context.

**Table 1:53.1.1.1.1-1: Event Handling Requirements**

<table class="grid">
  <thead>
    <tr>
      <th>Received Event</th>
      <th>Context Key</th>
      <th>Resource</th>
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
      <td>Display the updated status value (<code class="language-plaintext highlighter-rouge">DiagnosticReport.status</code>) </td>      
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

If the report context is resumed, then the Image Display shall be able to restore the application to a state associated to that report context prior to suspension. It is the responsibility of the implementation to determine what elements of application state are significant to the user to be restored when the application resumes the report context.

> Note: The DiagnosticReport-open event does not explicitly indicate if the report context is new or resumed. See [Subscriber Local Context and Local State](volume-1.html#1534110-resuming-contexts-subscriber-local-context-and-local-state) for design considerations.

##### 1:53.1.1.1.2 Event Producing Requirements

When the Image Display wants to publish content events into a reporting session, then it shall be grouped with a Content Creator to enable it to publish events using one or more FHIR resources. See [Section 1:53.1.1.6](volume-1.html#153116-content-creator) for details.

> Note: The FHIR resources which the actor can publish as FHIRcast contents are documented in its CapabilityStatement.

#### 1:53.1.1.2 Report Creator

The Report Creator produces a diagnostic report for patients' studies.

In order to complete a study dictation, the Report Creator:
- May launch other applications and synchronize them to the same report context through the Hub
- May be launched by another application, consume reporting events from the Hub and synchronize itself to the same report context

The Report Creator provides tools for the user to insert report content such as findings and impressions. The Report Creator may use the report content shared by other applications through the Hub (e.g., image references shared by Image Display, or measurements shared by Evidence Creator) to directly update the report (e.g., insert measurements) or generate derived report content (e.g., inject hyperlinks from image references)

When the Report Creator starts up, it shall obtain `hub.url` and `hub.topic` to join a reporting session.

The Report Creator shall be able to launch other applications and synchronize them to the same report context through the Hub. It shall have the following capabilities: 
- Start a new reporting session by generating a unique session ID and subscribing to the Hub on its own
- Launch one or more actors and provide them the URL of the Hub as `hub.url` and the reporting session ID as `hub.topic`

> Note that the actual application launch method is out of scope of this profile. See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

##### 1:53.1.1.2.1 Event Handling Requirements

Table 1:53.1.1.2.1-1 specifies behavior requirements for the Report Creator when it receives FHIRcast events.

The Report Creator shall support all Behaviors shown as “R” in Optionality. The Report Creator may support suggested behaviors ("O" in Optionality). For each Received Event in the table, 'Context Key' identifies the context in the Received Event, and 'Resources' specifies the FHIR resource used in the given context.

**Table 1:53.1.1.2.1-1: Event Handling Requirements**

<table class="grid">
  <thead>
    <tr>
      <th>Received Event</th>
      <th>Context Key</th>
      <th>Resource</th>
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
      <td>Be ready for reporting for the patient. If re-opening a previously opened report context, resume to the previous state of the report context when it was suspended.</td>      
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">study</code></td>
      <td>ImagingStudy</td>
      <td>R</td>
      <td>Be ready for reporting for the study. If re-opening a previously opened report context, resume to the previous state of the report context when it was suspended.</td>      
    </tr>
    <tr>
      <td rowspan="3">DiagnosticReport-update</td>
      <td><code class="language-plaintext highlighter-rouge">updates</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Make provided report updates (e.g., change in status, add/remove comparison studies available defined in associatedStudy extension attribute, etc.) for reference in the report</td>      
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
      <td>Bring images and/or annotations <i>to focus</i> and be able to apply user commands (See Note 1)</td>      
    </tr>
    <tr>
      <td><code class="language-plaintext highlighter-rouge">select</code></td>
      <td>Observation</td>
      <td>R</td>
      <td>Bring measurements and annotations <i>to focus</i> and be able to apply user commands (See Note 1)</td>      
    </tr>
    <tr>
      <td>DiagnosticReport-close</td>
      <td><code class="language-plaintext highlighter-rouge">report</code></td>
      <td>DiagnosticReport</td>
      <td>R</td>
      <td>Stop display of the study report</td>      
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

> Note 1: The Report Creator may provide application logic that can make use of the selected resources. For example, a nodule (as `ImagingSelection`) and corresponding measurements (as `Observation`) are selected. Then the radiologist issues a voice command "insert hyperlink". In this case, the Report Creator applies the command with the selected resources and inserts a hyperlink reference to the nodule with measurement.

If the report context is resumed, then the Report Creator shall be able to restore the application to a state associated to that report context prior to suspension. It is the responsibility of the implementation to determine what elements of application state are significant to the user to be restored when the application resumes the report context.

> Note: The DiagnosticReport-open event does not explicitly indicate if the report context is new or resumed. See [Subscriber Local Context and Local State](volume-1.html#1534110-resuming-contexts-subscriber-local-context-and-local-state) for design considerations.

##### 1:53.1.1.2.2 Event Producing Requirements

The Report Creator shall be grouped with a Content Creator to publish report status update associated to the report anchor context. In the `DiagnosticReport-update` context change request, the report status update shall be specified in `DiagnosticReport.status` in the `update` context key.

The Report Creator may publish other content updates. See [Section 1:53.1.1.6](volume-1.html#153116-content-creator) for details.

> Note: The Report Creator documents the FHIR Resources it can publish as FHIRcast content in its CapabilityStatement.

#### 1:53.1.1.3 Worklist Client

The Worklist Client provides a reporting worklist to the user.

When a user selects a study from the worklist, the Worklist Client opens a new report context to synchronize other applications through the Hub to enable dictation on the studies.  The Worklist Client may also launch other applications (e.g., Image Display, Report Creator, etc.) if necessary. 

When the Worklist Client starts up, it shall obtain `hub.url` and `hub.topic` to join a reporting session.

The Worklist Client shall be able to launch other applications and synchronize them to the same report context through the Hub. It shall have the following capabilities: 
- Start a new reporting session by generating a unique session ID and subscribing to the Hub on its own
- Launch one or more actors and provide them the URL of the Hub as `hub.url` and the reporting session ID as `hub.topic`

> Note that the actual application launch method is out of scope of this profile. See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

When a study dictation is complete, the Worklist Client consumes the report anchor context update event so that it can mark the study as dictated and remove it from the worklist.

##### 1:53.1.1.3.1 Event Handling Requirements

Table 1:53.1.1.3.1-1 specifies behavior requirements for the Worklist Client when it receives FHIRcast events.

The Worklist Client shall support all Behaviors shown as “R” in Optionality. The Worklist Client may support suggested behaviors ("O" in Optionality). For each Received Event in the table, 'Context Key' identifies the context in the Received Event, and 'Resources' specifies the FHIR resource used in the given context.

**Table 1:53.1.1.3.1-1: Event Handling Requirements**

<table class="grid">
  <thead>
    <tr>
      <th>Received Event</th>
      <th>Context Key</th>
      <th>Resource</th>
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
      <td>Reflect updated status <code class="language-plaintext highlighter-rouge">DiagnosticReport.status</code> in the worklist</td>
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

If the report context is resumed, then the Worklist Client shall be able to restore the application to a state associated to that report context prior to suspension. It is the responsibility of the implementation to determine what elements of application state are significant to the user to be restored when the application resumes the report context.

> Note: The DiagnosticReport-open event does not explicitly indicate if the report context is new or resumed. See [Subscriber Local Context and Local State](volume-1.html#1534110-resuming-contexts-subscriber-local-context-and-local-state) for design considerations.

##### 1:53.1.1.3.2 Event Producing Requirements

When the Worklist Client wants to publish content events into a reporting session, then it shall be grouped with a Content Creator to enable it to publish events using one or more FHIR resources. See [Section 1:53.1.1.6](volume-1.html#153116-content-creator) for details.

> Note: The FHIR resources which the actor can publish as FHIRcast contents are documented in its CapabilityStatement.

#### 1:53.1.1.4 Evidence Creator

The Evidence Creator consumes events in the reporting session and producing evidence data such as annotations, measurements, key image references, etc. for the patients' studies. For example, an Evidence Creator may detect lung nodules and produce measurements and bounding boxes of the nodules detected.

The Evidence Creator may capture the evidence data in FHIR resource format (e.g., lung nodule measurements as FHIR Observation resource, image references and bounding box as FHIR ImagingSelection resource) and share them by publishing content sharing events back to the reporting session through the Hub.

Alternatively, the Evidence Creator may capture the evidence data in formats, such as DICOM SR, that are shared with other systems using methods outside of this profile (e.g., as Evidence Creator in the IHE AIR Profile). In this case, other synchronizing applications in the same reporting session may not be aware of the evidence data created by the Evidence Creator.

The Evidence Creator may be a standalone application such as an Specialty AI application, or it may be grouped with another actor such as Image Display.

When the Evidence Creator starts up, it shall obtain `hub.url` and `hub.topic` to join a reporting session.

> Note that the actual application launch method is out of scope of this profile. See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

##### 1:53.1.1.4.1 Event Handling Requirements

In Table 1:53.1.1.4.1-1 specifies behavior requirements for the Evidence Creator when it receives FHIRcast events.

The Evidence Creator shall support all Behaviors shown as “R” in Optionality. The Evidence Creator may support suggested behaviors ("O" in Optionality). For each Received Event in the table, 'Context Key' identifies the context in the Received Event, and 'Resources' specifies the FHIR resource used in the given context.

**Table 1:53.1.1.4.1-1: Event Handling Requirements**

<table class="grid">
  <thead>
    <tr>
      <th>Received Event</th>
      <th>Context Key</th>
      <th>Resource</th>
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
      <td>Stop display the study and stop sharing new content to the report context (See Note 1)</td>
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

> Note 1: If the Evidence Creator is displaying the study associated to the report context, then it shall stop displaying the study. The Evidence Creator is not prohibited to continue processing the context and content according to its business logic. For example, capturing the results of its processing in a DICOM SR object.

If the report context is resumed, then the Evidence Creator shall be able to restore the application to a state associated to that report context prior to suspension. It is the responsibility of the implementation to determine what elements of application state are significant to the user to be restored when the application resumes the report context.

> Note: The DiagnosticReport-open event does not explicitly indicate if the report context is new or resumed. See [Subscriber Local Context and Local State](volume-1.html#1534110-resuming-contexts-subscriber-local-context-and-local-state) for design considerations.

##### 1:53.1.1.4.2 Event Producing Requirements

When the Evidence Creator wants to publish content events into a reporting session, then it shall be grouped with a Content Creator to enable it to publish events using one or more FHIR resources. See [Section 1:53.1.1.6](volume-1.html#153116-content-creator) for details.

> Note: The FHIR resources which the actor can publish as FHIRcast contents are documented in its CapabilityStatement.

#### 1:53.1.1.5 Stateless Evidence Creator

The Stateless Evidence Creator has the same requirements as the Evidence Creator, except that it is *not* required to detect if the received DiagnosticReport-open event is a new report context or a report context that is resumed, and it is *not* required to restore application state in case of resuming a report context (See Evidence Creator [Event Handling Requirements](volume-1.html#1531141-event-handling-requirements) for details).

#### 1:53.1.1.6 Content Creator

The Content Creator creates and selects additional contents in report contexts of the reporting session which are the basis of synchronization and collaboration between the subscribing actors.

> Note: This actor represents content creation / selection capabilities that may be present in implementation of other actors. As such, the Content Creator is required to be grouped with another actor. This actor cannot be claimed as a standalone actor.

For example, when an Image Display user clicks on the bounding box of a detected nodule, the grouped Content Creator publishes a selection event referencing the affected images and bounding boxes as an ImagingSelection resource, and referencing the corresponding measurements as an Observation resource. Upon receiving the event, a Report Creator might show those details in a side panel to the user. Finally the user issues a voice command to the Report Creator to inject a hyperlink, which is adding to the finding section.

The Content Creator shall support at least one of the following capabilities:
- Publish context and/or content changes as events to a reporting session
- Select one or more contents and publish the selection events

The Content Creator shall use the specified FHIR resource if it implements any of the capabilities listed in Table 1:53.1.1.6-1:

**Table 1:53.1.1.6-1: FHIR Resources Used For Content Sharing Capability** 

| Capability | FHIR Resource |
| -- | -- |
| Update report status  | DiagnosticReport |
| Add, update or remove comparison study used during reporting | DiagnosticReport |
| Capture DICOM series or image references (including image or non-image objects such as GPSP, Structured Report, Segmentation, etc.) | ImagingSelection |
| Capture 2D or 3D regions within an imaging study frame of reference (See Note) | ImagingSelection |
| Capture measurements or textual annotations | Observation |
{: .grid}

The Content Creator may use other resources for purposes other than those defined in this profile.

The Content Creator shall only publish DiagnosticReport-select events for user initiated selection.

When the grouped actor restores the application to a previous known state due to resuming a report context, if there are any contents known to be selected by the user prior to the suspension and the grouped actor is the originator of the corresponding DiagnosticReport-select event, then
- The grouped actor shall prompt the user if the selections are still valid
- If valid, then the Content Creator shall send a DiagnosticReport-select event for the selected resources

#### 1:53.1.1.7 Watcher

The Watcher listens to events in a session and performs actions according to it business logic. The specific actions are out of scope of this profile.

For example, the Watcher consumes the initiation and termination of report contexts and calculates the turnaround time for different types of studies in different departments. Another example is a Watcher that monitors how often an Evidence Creator publishes content sharing events and correlates how effective an AI application is with respect to the turnaround time by comparing the time before and after the Evidence Creator is deployed.

When the Watcher starts up, it shall obtain `hub.url` and `hub.topic` to join a reporting session.

> Note that the actual application launch method is out of scope of this profile. See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

##### 1:53.1.1.7.1 Event Handling Requirements

Table 1:53.1.1.7.1-1 specifies behavior requirements for the Watcher when it receives FHIRcast events.

The Watcher shall support all Behaviors shown as “R” in Optionality. The Watcher may support suggested behaviors ("O" in Optionality). For each Received Event in the table, 'Context Key' identifies the context in the Received Event, and 'Resources' specifies the FHIR resource used in the given context.

**Table 1:53.1.1.7.1-1: Event Handling Requirements**

<table class="grid">
  <thead>
    <tr>
      <th>Received Event</th>
      <th>Context Key</th>
      <th>Resource</th>
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
      <td>Process according to business logic</td>
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

##### 1:53.1.1.7.2 Event Producing Requirements

When the Watcher wants to publish content events into a reporting session, then it shall be grouped with a Content Creator to enable it to publish events using one or more FHIR resources. See [Section 1:53.1.1.6](volume-1.html#153116-content-creator) for details.

> Note: The FHIR resources which the actor can publish as FHIRcast contents are documented in its CapabilityStatement.

#### 1:53.1.1.8 Hub

The Hub manages event flows between Subscribers in reporting sessions and maintaining the current context.

The Hub authorizes the following:
- which Subscriber has permission to invoke what requests
- which context and content a Subscriber is eligible to access and in what type (e.g., read only, write only or ready and write)

> Note: This profile does not mandate a specific authorization mechanism. See [Cross Profile Considerations](volume-1.html#1536-ira-cross-profile-considerations) for recommendations.

The Hub shall support [content sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html).

The Hub shall monitor the established websocket connections. If it detects a websocket connection issue with a Subscriber, then the Hub shall:
- Unsubscribe the Subscriber and drop the websocket connection
- Send a SyncError notification to other Subscribers using \[[RAD-155](rad-155.html)\]

##### 1:53.1.1.8.1 Event Handling Requirements

The Hub shall be able to process all valid events conforming to the FHIRcast [Event Format](https://build.fhir.org/ig/HL7/fhircast-docs/2-3-Events.html) received using FHIRcast [Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html) requests.

> Note: This implies that the Hub cannot only process events defined in this profile. The Hub is required to support other valid events regardless of whether they are defined in the FHIRcast [Event Catalog](https://build.fhir.org/ig/HL7/fhircast-docs/3_Events.html). For example, Subscribers in a reporting session are permitted to send Request Context Change requests with events (e.g., `HeartBeat`, `ImagingStudy-*`, etc.) beyond those explicitly defined in this profile.

For all received events, the Hub shall support the following core behaviors:
- It shall receive and distribute the event to all Subscribers subscribed to that event type (see [Event Notification](https://build.fhir.org/ig/HL7/fhircast-docs/2-5-EventNotification.html))
- It shall manage the current context in the session for all context-change events (i.e., `*-open` and `*-close` events) (see [Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html))
- It shall manage the current content in the session for all content sharing events (i.e., revise the shared FHIR resources in accordance with received `*-update` events) (see [Content Sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html))
- It shall serve as a transaction coordinator to avoid lost updates and other out of sync conditions when processing content sharing events (i.e., `*-update` and `*-select` events) 
- If it receives `*-update`, `*-select` or `*-close` events for a context that is not opened, then it shall return `409` Conflict response.

Additional profile requirements for specific events are defined in the corresponding transactions.

## 1:53.2 IRA Actor Options

Options that may be selected for each actor in this implementation guide, are listed in Table 1:53.2-1 below. Dependencies between options, when applicable, are specified in notes.

**Table 1:53.2-1: IRA - Actors and Options**

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
      <td>Stateless Evidence Creator</td>
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

## 1:53.3 IRA Required Actor Groupings

An actor from this profile (Column 1) shall implement all of the required transactions and/or
content modules in this profile ***in addition to all*** of the requirements for the grouped actor (Column 3).

In some cases, required groupings are defined as at least one of an enumerated set of possible actors; this is designated by merging column one into a single cell spanning multiple potential grouped actors. Notes are used to highlight this situation.

Section 1:53.5 describes some optional groupings that may be of interest for security
considerations and Section 1:52.6 describes some optional groupings in other related profiles.

**Table 1:53.3-1: IRA Required Actor Groupings**

| IRA Actor | Grouping Condition | Actor(s) to be grouped with | Reference |
|-----------|--------------------|-----------------------------|-----------|
| Image Display | -- | None | -- |
| Report Creator | -- | IRA / Content Creator | [RAD TF-1: 53.1.1.2](volume-1.html#153112-report-creator) |
| Worklist Client | -- | None | -- |
| Evidence Creator | -- | None | -- |
| Stateless Evidence Creator | -- | None | -- |
| Content Creator (Note 1) | -- | IRA / Image Display<br>IRA / Report Creator<br>IRA / Worklist Client<br>IRA / Evidence Creator<br>IRA / Stateless Evidence Creator | [RAD TF-1: 53.1.1](volume-1.html#15311-actors-description-and-actor-profile-requirements) |
| Watcher | -- | None | -- |
| Hub | -- | None | -- |
{: .grid}

> Note 1: The Content Creator shall be grouped with at least one of the actors in Column 3.

## 1:53.4 IRA Overview

### 1:53.4.1 Concepts

#### 1:53.4.1.1 Publish and Subscribe Model

At its heart, this profile synchronizes a group of applications using a Publish and Subscribe model as implemented by [FHIRcast](https://build.fhir.org/ig/HL7/fhircast-docs/index.html) which in turn is an implementation of [WebSub](https://www.w3.org/TR/websub/).

The following are some key concepts:
- Participating applications are `Subscribers` that register with and communicate with a `Hub`
- The `Hub` only communicates with authenticated `Subscribers`
- `Subscribers` do not communicate with other `Subscribers` directly
- When `Subscribers` generate data that should be made available to other applications, or perform actions of which other applications should be aware, they *publish* it by sending an event request with the relevant details to the Hub
- A Starting Application is a `Subscriber` that may launch other applications, providing them with the address of the `Hub` and the `topic ID` so they can join the same `session`
- The `Hub` forwards accepted event requests from a `Subscriber` to other `Subscribers` subscribed to that type of event
- `Subscribers` can configure their subscription to limit what types of events the `Hub` forwards to them
- `Subscribers` react to events from the `Hub` based on their internal business logic
- It is not necessary (nor possible) for `Subscribers` to be aware of what other `Subscribers` (if any) are receiving an event they requested to be forwarded by the `Hub`, nor how other `Subscribers` react to the event
- The `Hub` maintains the current state of content (if any) associated with all open contexts
- `Subscribers` can request the current context and associated contents from the `Hub`
- The `Hub` can simultaneously manage multiple groups of `Subscribers` and their associated data in different `sessions`
- Each `session` is identified by a unique “topic ID”

#### 1:53.4.1.2 Terminology and Model

The terminology used in FHIRcast and adopted in this profile can be found in the [FHIRcast Glossary](https://build.fhir.org/ig/HL7/fhircast-docs/5_glossary.html).

Figure 1:53.4.1.2-1 is a representation of the data model.

**Figure 1:53.4.1.2-1: FHIRcast Concept Data Model**

<div>
    <img src="data_model.png" width="80%">
</div>
<br clear="all">

**Figure 1:53.4.1.2-1: FHIRcast Concept Data Model**

Figure 1:53.4.1.2-2 is a representation of the interaction model.

<div>
    <img src="interaction_model.png" width="80%">
</div>
<br clear="all">

**Figure 1:53.4.1.2-2: IRA Concept Interaction Model**

#### 1:53.4.1.3 Long Session and Short Context

A `Session` is an abstract concept representing a shared workspace, such as a user's login session across multiple applications or a shared view of one application distributed to multiple users. A session results from a user logging into an application and can encompass one or more workflows.

For instance, a reporting session is a shared workspace across multiple applications to communicate activities of a user, such as initiating a new report context when opening a study for reporting. These applications as `Subscribers` share events using the `Hub`. As long as there are `Subscribers` associated to a `Session`, the `Session` stays open. Therefore a `Session` has a long duration.

A `Context` is a FHIR resource associated with a `Session` which indicates a subject on which applications should synchronize as appropriate to their functionality. As soon as the subject is complete, the corresponding `Context` can be closed. Therefore a `Context` has a limited duration within a `Session`.

#### 1:53.4.1.4 Events vs Commands

Communication patterns between two systems fall in two general categories: `Events` and `Commands`.

`Events` represent facts that have happened. For example, `DiagnosticReport-open` represents an event that an application has opened a study for reporting. Note that an event has an initiator but no target recipient(s). It is the responsibility of any applications that are interested in such events to subscribe to them. Any applications subscribed to the event will receive the event and the application can determine how to process the event. The application that is producing the event is not aware of the actions being performed by the consuming applications, unless these consuming applications in turn publishes additional events.

In this profile, the messages that a `Subscriber` sends to the `Hub` represents an `Event`. Each event captures what has happened, and there is no explicit recipient(s) specified.

On the other hand, `Commands` represent intention. In addition to an initiator, `Commands` have specific target recipient(s). For example, Send-Study represents an intention to send a study. The application that sends the commands often has direct knowledge of which applications should execute the commands, or delegate to a proxy service that has the knowledge.

> Note: Some implementations may define commands using [Extensions](https://build.fhir.org/ig/HL7/fhircast-docs/2-8-Extensions.html) or custom events with explicit recipient(s). These are out of scope of this profile.

#### 1:53.4.1.5 Timing of Sending an Event

A starting application is a subscriber that initiates a context change request. From the starting application perspective, it is desirable for all subscribers to be synchronized as soon as possible. On the other hand, FHIRcast is a network protocol which incurs a non-trivial cost to send each event. Therefore, a starting application should take into account when an action is considered to be complete or stable, and hence ready to be captured and communicated as events.

For example, when a user is actively making measurements or annotations, instead of capturing every change a user makes (e.g., incremental changes in size or location of a shape) as an event which can result in many intermittent and partial events, a starting application may use specific triggers (e.g., when a user saves the changes) or an idle time threshold to detect when the user completed making the changes. The application then creates the corresponding event(s) to capture the result.

On the other hand, this profile is designed to communicate _in-progress_ data as soon as possible. Therefore it is not desirable for the starting application to _wait_ too long. For example, if the starting application supports exporting measurements and annotations as DICOM SR or other DICOM objects, it is not appropriate to wait until the DICOM objects are created before sending the corresponding event.

A reasonable approach could be for an application to acquire a complete measurement and perhaps some measurement characteristics, then send an event request containing this information to the Hub.

This profile does not mandate any specific implementation design regarding when a starting application should capture the result of an action as an event. The intention is that the starting application will send an event as soon as feasible so that all subscribers in a reporting session can be synchronized and provide a good user experience.

#### 1:53.4.1.6 Event Awareness vs Event Consumption

`Event Awareness` means a synchronizing application, upon receiving an event from the `Hub`, has the knowledge that an event has happened.

`Event Consumption` means a synchronizing application, upon receiving an event from the `Hub`, reacts to the event and performs some actions according to its business logic.

This means from the content sharing application perspective, in order to synchronize the context with other applications, it may be desirable for a starting application to publish events frequently so that other subscribers can be aware of the same context as in the content sharing application.

On the other hand, from the subscribing application perspective, it is up to its business logic to determine how to react to the received event. This business logic may be automatic or require additional user input.

For example, when the user goes through the study images in Image Display (a content sharing application), for each nodule that the user identified (e.g., 1, 2, ..., 9, 10), the Image Display publishes a corresponding event. In the Report Creator (a synchronizing application), for each event received, it keeps track of the nodule in its nodule tracking bookmark. Once the user finished reviewing the full study, the user uses the nodule tracking bookmark in the Report Creator and selects the top 3 (e.g., 2, 5, 9) to include in the final report. Note that since the Report Creator is aware of all the nodules observed by synchronizing the context with the Image Display, selecting a subset of the nodules to be included in the final report (i.e., event consumption) is an operation internal to the Report Creator.

#### 1:53.4.1.7 FHIRcast event-based content sharing vs FHIR server based content sharing

FHIRcast uses FHIR resources to capture the context and content in an event. These FHIR resources may be transient, meaning that they do not necessarily exist in any system, nor are they expected to be persisted by any system. Furthermore, even if an application decides to persist the FHIR resource(s), it is not required to use the same resource ID in the event as the ID of the persisted resource. The application can generate new IDs instead. See [Content Sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html) for details.

#### 1:53.4.1.8 Local Tracking of Context

The `DiagnosticReport-open` event includes both the `report` anchor context and associated contexts `patient` and `study`. Subsequent event(s) for this anchor context will only provide the `report` context. Therefore, it is up to the Subscriber to record internally the `patient` and `study` contexts associated with the `report` anchor context if that information is relevant to its business logic. 

#### 1:53.4.1.9 Suspend and Resume Report Context

Occasionally a report context may be _suspended_, meaning that a starting application opens a subsequent report context without closing an initial report context. For example, a radiologist needs to suspend a report on a study in order to review an urgent study.

The `Hub` switches the `Current Context` to the urgent study being opened. The `Hub` distributes the open event to all subscribers to keep them synchronized. The initial report context is still maintained by the `Hub` since it is not closed, but it is _suspended_ (i.e., not the `Current Context`). 

When the user finishes reviewing the urgent study, the report context of the urgent study is closed and all subscribers receive the close event. The `Hub` sets the `Current Context` to *empty* after closing the `Current Context`.

The starting application sends a *new* open event for the _suspended_ report context to make it the `Current Context`. All subscribers receive the open event and resume to the _suspended_ report context. Alternatively the starting application could choose to open any other report context as appropriate.

See [Use Case #3](volume-1.html#153423-use-case-3-suspend-and-resume-flow) for more details.

#### 1:53.4.1.10 Resuming contexts: Subscriber Local Context and Local State

`Local context` and `local state` refers to the information specific to each Subscriber that it maintains locally for each report context in the session that it participates in. When resuming to a previous context, this information, if present, would enable the subscribing application to restore to the same state associated to the report context as before the suspension.

`Local context` refers to the Subscriber's view / copy of the shared context maintained in the Hub.

`Local state` refers to information related to a given context that is not replicated into the Hub This `local state` may keep track of application specific information, such as

- layout of the viewports
- image frames displayed in each viewport
- any user activity (e.g., user selected the image frame in a viewport)

Upon receiving events from the `Hub`, a Subscriber maintains its `local context` according to its need. i.e., the Subscriber is not to maintained a full copy of the context that is in the Hub, since some parts of the context may not be relevant to the Subscriber activities.

It is up to the Subscriber to decide on implementation details, such as:

- How much state that it can resume?
- How long should open contexts be maintained?
- How to detect if open contexts become stale?
- How to handle stale contexts?

#### 1:53.4.1.11 Deployment Considerations

The Hub can be a standalone application or embedded within another application (e.g., the Image Manager, Report Creator and Worklist Client are grouped with the Hub independently). As a result, which Hub to use for the reporting session needs to be configurable during deployment.

The Hub can be deployed on premises or in the cloud. The other actors may or may not be deployed in the same location as the Hub. Since this profile is aimed at providing streamline user experience for all integrated applications, the effectiveness of this profile depends on timely communications with the Hub, whether it is the context change request, or the subsequent event distribution. Therefore it is important to have a reliable low latency network connection between applications and the Hub, taking into account all the network appliances in between (e.g., firewall, reverse proxy, load balancer, etc.).

#### 1:53.4.1.12 Selection Synchronization

When a user selects some content in an application, for example, an image frame with an observed nodule in the Image Display, this can trigger the application to send a [DiagnosticReport-select](https://build.fhir.org/ig/HL7/fhircast-docs/3-6-4-DiagnosticReport-select.html) event referencing the corresponding selected content (e.g., an image frame). This event enables other applications to trigger corresponding synchronization logic based on the selected content. There are several different behavioral patterns a receiving application can implement:

- A receiving application can react to the selected content directly. For example, an Evidence Creator can retrieve the referenced image frame in the event and trigger a nodule analysis algorithm comparing this nodule with a same nodule in a prior study.
- A receiving application can react to the selected content indirectly. For example, a Report Creator can keep track of the referenced image frame in the event. Then the user can issue a voice command (e.g., 'insert hyperlink') to the Report Creator which triggers the Report Creator to insert a hyperlink in the report based on the selected image frame. 

These behavioral patterns can be bidirectional. For example, an Evidence Creator selects a nodule in its analysis, which triggers the Evidence Creator to sends a DiagnosicReport-select event referencing this nodule and the corresponding image frame. Upon receiving this event, the Image Display displays the referenced image frame along with other annotations automatically.

It is important to note the following characteristics of the FHIRcast `*-select` events:

- There is a single selection within a session
- A new selection implicitly unselect any previously selected resources

As a result, selection is intended for user initiated synchronization. It is not suitable for automatic background navigation synchronization due to potential race condition.

Furthermore, due to the implicit unselect semantics, if multiple items are intended to be selected and processed together, then it is necessary to select all the items first and then send a single `DiagnosticReport-select` event with all selected items, rather than sending multiple select events, each with a single item.

### 1:53.4.2 Use Cases

#### 1:53.4.2.1 Use Case \#1: Basic Reporting

In a basic reporting session, a user uses two actors, the Image Display and the Report Creator, to complete reporting on a study.

##### 1:53.4.2.1.1 Basic Reporting Use Case Description

The Basic Reporting Use Case is intended to capture the common reporting activities happened during a reporting session. The Image Display handles all user needs for displaying the study and the Report Creator handles all user needs for report creation.

> Note: Figure 1:53.4.2.1.2-1 shows a high level workflow and highlights the user interaction with the two actors involved. This use case is broken down into multiple steps. The steps shown in the diagram are not actual transactions. The interactions between the Image Display and Report Creator during a reporting session are omitted to highlight the user interactions more clearly. The hyperlinks provided in the diagram link to the subsections that describe the corresponding steps with actual transactions in details. Furthermore, the [Examples](example.html) tab contains sample events following this use case.

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

> Note: In more complex scenarios, a separate Worklist Client can be used to drive the Image Display and Report Creator, while the Image Display can launch a separate Evidence Creator on demand to perform advanced visualization and measurements. See [Use Case 2](volume-1.html#153422-use-case-2-complex-reporting) for an example.

##### 1:53.4.2.1.2 Basic Reporting Process Flow

<div>
{%include ReportingFlow.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.1.2-1: Basic Reporting Flow in IRA Profile**

###### 1:53.4.2.1.2.1 Step 1: Open Reporting Session

When a radiologist starts reporting, the Image Display, as a Starting Application, starts a reporting session.

Note that there is no explicit creation of a session. If the Hub receives a session (i.e., topic ID) that does not already exist, then the Hub will automatically create the session and add the subscriber (i.e., Image Display) to the session.

The Image Display subscribes to events so that it can:
- Receive events published by other Subscribers.
- Receive the version ID of any events necessary for content sharing (see [Responsibilities of a FHIRcast Hub and a Subscriber](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-ContentSharing.html#responsibilities-of-a-fhircast-hub-and-a-subscriber) for more information).
- Receive synchronization error events from the Hub or from other Subscribers.

Once the Image Display completes its subscription, it launches the Report Creator. The Report Creator, as a Synchronizing Application, can follow the context and content events automatically.

> Note that *launching* the Report Creator (or any Synchronizing Application) by the Image Display (or any Starting Application) may be implemented in different ways. For example, the Synchronizing Application can be started and terminated, or it can be put in focus and minimized when not needed but kept running in the background for efficiency, or any combination thereof.

When launched, the first thing that the Report Creator does as a Synchronizing Application is to subscribe to the reporting session. The information about the Hub and the session is provided by the Image Display during launch.

Furthermore, the Report Creator queries the Hub to get the current context to ensure it has the latest context and content. Since the reporting session has just begun, and the Image Display has not yet opened any report context, the result of the query will be empty.

<div>
{%include step1-open-reporting-session.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.1.2.1-1: Open Reporting Session Flow in IRA Profile**

###### 1:53.4.2.1.2.2 Step 2: Open Study in Context

When the radiologist selects a study in the worklist, the Image Display, as a Starting Application, opens a new report context. Once the Hub accepts the event, it broadcasts the event to all Subscribers.

The Report Creator, as a Synchronizing Application, receives the event and opens the corresponding procedure for the study.

Furthermore, the event has a version ID. For the Image Display as a Starting Application, including the version ID when submitting the next event allows the Hub to ensure proper event sequence. For the Report Creator as a Synchronizing Application, keeping track of the version ID enables it to check if it missed any prior events. Event sequencing is important for content sharing because all updates and selects are expected to be applied in the same sequence as they are emitted by one or more Content Creators (See [FHIRcast event-based content sharing](https://build.fhir.org/ig/HL7/fhircast-docs/2-10-1-ContentSharingFHIRcastMessaging.html) for details).

<div>
{%include step2-open-study-in-context.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.1.2.2-1: Open Study in Context Flow in IRA Profile**

> Note: Amending a report uses the same workflow as in Step 2. A *new* report context is opened with the same patient and study context as the original report. 
>
> Having opened the new report context, it will be up to the Report Creator to determine whether the original report is being amended or a new report is being added to the study. A *new* report context is used in either case because the report context associated with the original report was transient and is no longer available for use.
>
> It is possible that actors such as the Report Creator may choose to populate content related to the original report back into the new report context, e.g., to facilitate further editing.

###### 1:53.4.2.1.2.3 Step 3: Add Content (Optional)

Sometimes the radiologist may annotate the images with markups and measurements. When this happens, the Image Display, grouped with the Content Creator, updates the report context at the Hub with new content using Update Report Content [RAD-150]. The Hub broadcasts the event to all Synchronizing Applications.

When the Report Creator receives and accepts the event, it can apply the updates according to its business logic. For example, it may automatically create a hyperlink in the report, or keep track of the content in a panel for the user to perform other activities later.

<div>
{%include step3-add-measurements.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.1.2.3-1: Add Content Flow in IRA Profile**

###### 1:53.4.2.1.2.4 Step 4: Select Content (Optional)

Occasionally it is desirable to trigger activities on Subscribers based on user navigation. With FHIRcast, this can be achieved using the content selection events.

Content selection can be used in various ways:
- as input for a follow up action (e.g., images or measurements selected by a user in the Image Display as input for hyperlink in the Report Creator)
- to bring something to focus (e.g., user clicks on a measurement in a report in the Report Creator which triggers the Image Display to bring the corresponding images to focus)

Sometimes the radiologist selects certain elements (e.g., images, annotation, specific measurements, etc.) in the Image Display. When this happens, the Image Display, grouped with the Content Creator, sends a event to the Hub using Select Report Content [RAD-151] indicating what contents have been selected. The Hub broadcasts the event to all Subscribers.

When the Report Creator receives the event, it can apply the selection according to its business logic. For example, it can highlight to the user what is selected so that the user can perform an appropriate action. In this example, the radiologist uses a voice command to insert a hyperlink in the report. The Report Creator uses the selected content to generate the hyperlink.

Generally, selecting a content means putting the content in 'focus'. Note that this profile is agnostic about the user interface implementation of 'focus', e.g., selection may result in the content being highlighted in the user interface, or it may result in the selected content being flagged in the backend service. Specific behavior depends on the implementation.

<div>
{%include step4-select-measurements.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.1.2.4-1: Select Content Flow in IRA Profile**

###### 1:53.4.2.1.2.5 Step 5: Sign-off Report

The radiologist completes dictation and signs off the report on the Report Creator. The Report Creator sends an update event notifying about the report status change (e.g., draft, preliminary, final, amended, etc.) The Image Display updates the status of the study in its worklist.

> Note: The report status is a critical attribute in a reporting workflow. Usually the Report Creator is the only actor that updates the report status. Alternative workflows where other content creators modify the report status need to be approached carefully.

In this diagram, the Report Creator closes the report context after it sends the report status update event. Recall that this report context was opened by the Image Display. 

> Note: Alternatively, the Image Display can close the report context upon successfully processing the report status update event. Both scenarios are valid and which method is used is determined by site configuration of the Image Display and Report Creator.

The Hub sends the update event and the termination event to all Subscribers. Once the Hub successfully processed the termination event, it disallows any further interaction of that closed report context.

Upon receiving the termination event, the Image Display removes the study from its worklist.

> Note: The Image Display may have different behavior when processing the termination event depending on the report status of the study. For example, if the status is *draft completed*, then the Image Display may set the study in a separate Draft worklist for later follow up.

The Report Creator may have some internal mechanism to keep the report for a grace period after the report is signed off and before sending the report to other recipients. The Report Creator persists the report according to its business logic.

<div>
{%include step5-signoff-report.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.1.2.5-1: Sign-off Report Flow in IRA Profile**

> Note 1: It is important to note that in common cases, Report Creator is the actor to close the report context. Occasionally, Image Display or Worklist Client can close the report context. This should be carefully considered and ensure all actors are configured appropriately. See [Use Case #3: Suspend and Resume Flow](volume-1.html#153423-use-case-3-suspend-and-resume-flow) for example.

> Note 2: The Report Creator, if it receives the report close context, it may save the content and re-open the context if necessary.

The flow above shows the simple case with a sequential switching of report context. In this case, a report context is opened and then closed before the next report context is opened.

In practice, the radiologist is likely to continue with the next study in the worklist without any awareness of the events happening behind the scene. If the initiating Starting Application and terminating Starting Application are different as in this example, then when the radiologist moves to the next study, it is possible that the Image Display opens a new report context before the Image Display receives the Close Report Context [RAD-149] event of the reported study.

Such rapid context switching is supported by this profile. The Hub and each Subscriber maintains multiple open contexts simultaneously. As long as the context is not closed, it still exists. Each event is associated to a particular anchor context. Therefore a Subscriber can reliably match an event to its internal state according to the context ID of the anchor context in the event. 

The following diagram shows what can happen in case of rapid switching of the report context.

<div>
{%include rapid_switch_context.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.1.2.5-2: Rapid Context Switching Flow in IRA Profile**

###### 1:53.4.2.1.2.6 Step 6: Close Reporting Session

Eventually, the radiologist completes all the studies in the worklist and closes the Report Creator. The Report Creator unsubscribes to the reporting session so that it will no longer receive any future events.

The Hub closes the connection to the Report Creator. Note that if there are other Subscribers on the same session, those applications are not affected and will continue to receive notification on the session.

<div>
{%include step6-terminate-reporting-session.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.1.2.6-1: Close Reporting Session Flow in IRA Profile**

#### 1:53.4.2.2 Use Case \#2: Complex Reporting

This reporting workflow is more complex because there are 5 actors collaborating closely:

- Worklist Client: Manages a set of studies waiting for reporting
- Image Display: Displays the selected study and patient metadata
- Report Creator: Captures dictation from the radiologist and creates report
- Evidence Creator: Processes study, provides advanced visualization and produces clinical results
- Hub: Manages the different application subscriptions, maintains report context and distributes events

In this diagram, a single Evidence Creator performs multiple functions. Alternatively, there can be multiple Evidence Creators, each performing a specific function.

In this use case,
- The Worklist Client has a set of studies waiting for reporting
- Radiologist uses the worklist to select studies to report
- Before reporting starts, the Worklist Client starts the reporting session and launches the Image Display and Report Creator to join the session
- When the radiologist opens a study in the Worklist Client,
  - Image Display automatically synchronizes and views the corresponding study images and patient metadata
  - Report Creator automatically synchronizes and opens a new report for the corresponding study
- While viewing the study in Image Display, the radiologist clicks the advanced processing button in Image Display to execute the integrated Evidence Creator
- When launched, Evidence Creator automatically synchronizes and processes the study
- After finished processing, Evidence Creator shares the outputs back with other applications in the reporting session
- Image Display automatically shows the outputs from Evidence Creator
- Radiologist accepts the results in Image Display, which in turn shares the radiologist's decisions as observation with other applications in the reporting session
- Report Creator automatically updates the report with the radiologist decisions according to the observation
- Radiologist completes and signs off the report and moves on to the next study in the worklist
- Eventually, the radiologist finishes all studies in the reporting worklist and closes the applications

Note that at Step 7, since all the necessary applications have already been started, there is no need to relaunch the applications and re-establish their subscriptions. However, it may be desirable for some specialty applications that are not in common use to be terminated and restarted if their capabilities are later required.

<div>
{%include multi_app.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.2-1: Complex Reporting in IRA Profile**

#### 1:53.4.2.3 Use Case \#3: Suspend and Resume Flow

Occasionally a radiologist is interrupted while reporting on a study. She needs to open a different study (e.g., for consultation purpose) before the study that is currently in progress is ready for sign-off.

This profile permits a new report context to be opened before the previous report context is closed. The Hub can maintain multiple anchor contexts simultaneously within a reporting session. The current context is the most recent anchor context that has been opened but not yet closed. This current context enables all Synchronizing Applications to be synchronized and working on the same context all the time.

Once the *interrupting* study is complete, the Report Creator closes the report context of the *interrupting* study. The Hub removes the context of the *interrupting* study and sets the current context to *empty*.

> Note: In some situations, the user can complete the work required for the *interrupting* study without using the Report Creator. In these occasions, the Image Display (or Worklist Client, not shown in the diagram) is permitted to close the report context.
>
> If the Report Creator business logic determines that the 'close' event sent by the Image Display was premature and the Report Creator still needed to do some work, then the Report Creator may 're-open' the report context, synchronize and close the report context.

The Image Display, as the Starting Application in this example, resumes the report context back to the previously opened study. It restores its application state associated to the report context prior to suspension and then re-opens the same report context to the Hub. Note that all associated context and contents remain in the Hub.

As a result, all subscribers will resume to the same report context. If an application has business logic to resume something else rather than the previous report context, that application should send a new Open Report Context [RAD-148] event to set the new report context accordingly.

<div>
{%include interruption-and-resume.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.3-1: Suspend and Resume Flow in IRA Profile**

#### 1:53.4.2.4 Use Case \#4: Error Handling Flow

Error handling is driven by two factors:
- Synchronous vs Asynchronous
- Subscriber initiated vs Hub initiated

<div>
{%include syncerror.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.4-1: Error Handling Flow in IRA Profile**

Figure 1:53.4.2.4-2 shows two sample use cases for how error handling can be used in reporting.

<div>
{%include syncerror_use_case.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.4-2: Error Handling Example Flows in IRA Profile**

#### 1:53.4.2.5 Use Case \#5: Overread Draft Report

A radiologist wants to review a draft report created by a resident. She opens the draft report in the Report Creator. The Report Creator opens a new report context for the draft report, including the corresponding patient and study context. The Image Display receives the event distributed by the Hub and opens the study in context. The radiologist reviews the study associated to the report using the Image Display.

Later a radiologist selects a nodule measurement on the report. The Report Creator sends a content selection event for the observation. The Image Display receives the event and display the observation on the study.

In case a reporting session has not been started when the radiologist reviews the draft report, the Report Creator can start a new reporting session and launch the Image Display to join it.

<div>
{%include report-overread.svg%}
</div>
<br clear="all">

**Figure 1:53.4.2.5-1: Overread Draft Report Flows in IRA Profile**

## 1:53.5 IRA Security Considerations

This profile strongly recommends all actors to consider the FHIRcast [Security Considerations](https://build.fhir.org/ig/HL7/fhircast-docs/4-3-security-considerations.html).

This profile strongly recommends all actors group with an ITI ATNA Secure Application or Secure Node Actor using the Radiology Audit Trail Option.

The ATNA Profile requires actors to implement:
- [Record Audit Event](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html) [ITI-20] transaction which would record when and where analysis results are distributed and displayed.
- [Authenticate Node](https://profiles.ihe.net/ITI/TF/Volume2/ITI-19.html) [ITI-19] transaction to further ensure the integrity of transactions using node authentication and communication encryption.

Furthermore, for the HTTP-based transactions, this profile strongly recommends the use of ITI [Internet User Authorization](https://profiles.ihe.net/ITI/TF/Volume1/ch-34.html) (IUA) Profile to ensure that communications are only allowed for authenticated and authorized users and/or systems.

Additionally, although this profile does not specify any particular method for an application to launch other synchronizing applications, this profile strongly recommends the use of [SMART App Launch](http://www.hl7.org/fhir/smart-app-launch/app-launch.html) for application launching. In addition to the use of OAuth2 as specified in the ITI IUA Profile, FHIRcast extends SMART App Launch with FHIRcast specific OAuth2 scopes that can be used by the Hub to validate if the Subscriber is authorized to invoke the transaction. Furthermore, the authorization server returns the FHIRcast SMART launch parameters which can be used by the synchronizing applications to join the session. See [Section 4.1.1 SMART on FHIR](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html#smart-on-fhir) for more details.

The events as defined in this profile contain personal demographic information and clinical information. It is appropriate for products implementing the this profile to include appropriate PHI controls. Specifying such mechanisms and features is outside the scope of this profile.

> Note: Once the websocket connections are established, the Hub will distribute events to Subscribers according to their subscription. If some contents are not appropriate for certain Subscribers (e.g., a Subscriber should not receive any PHI), then separate sessions may be considered.

## 1:53.6 IRA Cross-Profile Considerations

Table 1:53.6-1 describes various actors in various other profiles that might be useful to group with IRA Profile actors.

**Table 1:53.6-1: IRA - Optional Actor Groupings**

<table class="grid">
  <thead>
    <tr>
      <th>IRA Actor</th>
      <th>Might group with</th>
      <th>Potential Purpose</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="3">Report Creator</td>
      <td><a href="https://profiles.ihe.net/RAD/IMR/index.html">IMR Report Creator</a></td>
      <td>To produce multi-media interactive report using the context and content (e.g., image references, measurements, etc.) received in a reporting session.<br><br>To share report contents (e.g., findings, impressions) with other Subscribers in a reporting session.</td>
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
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIW-I.pdf">AIW-I Watcher</a></td>
      <td>To watch an additional infrastructure for events.</td>
    </tr>
    <tr>
      <td>Hub</td>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Resource Server</a></td>
      <td>To enforce only authorized access to the resources stored in the repository.</td>
    </tr>
  </tbody>
</table>
