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
      <td rowspan="6"><a href="volume-1.html#1xx111-synchronizing-application">Synchronizing Application (See Note 1)</a></td>
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
      <td rowspan="8"><a href="volume-1.html#1xx112-driving-application">Driving Application (See Note 1)</a></td>
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
      <td rowspan="8"><a href="volume-1.html#1xx113-content-sharing-application">Content Sharing Application (See Note 1)</a></td>
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
      <td>Update Report Content [RAD-X5]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x5.html">RAD TF-2: 4.X5</a></td>
    </tr>
    <tr>
      <td>Select Report Content [RAD-X6]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="rad-x6.html">RAD TF-2: 4.X6</a></td>
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
      <td>Subscribe Reporting Session [RAD-X1]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="rad-x1.html">RAD TF-2: 4.X1</a></td>
    </tr>
    <tr>
      <td>Connect Notification Channel [RAD-X2]</td>
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
      <td>Unsubscribe Session [RAD-X7]</td>
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
    <tr>
      <td><a href="volume-1.html#1xx114-image-display">Image Display</a></td>
      <td>See Note 2</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
    </tr>
    <tr>
      <td><a href="volume-1.html#1xx115-evidence-creator">Evidence Creator</a></td>
      <td>See Note 2</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
    </tr>
    <tr>
      <td><a href="volume-1.html#1xx116-report-creator">Report Creator</a></td>
      <td>See Note 2</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
    </tr>
    <tr>
      <td><a href="volume-1.html#1xx117-worklist-display">Worklist Display</a></td>
      <td>See Note 2</td>
      <td>-</td>
      <td>-</td>
      <td>-</td>
    </tr>
  </tbody>
</table>

> Note 1: These actors are *abstract* actors that cannot be claimed directly. They provide the necessary required transactions for other actors to group with.

> Note 2: These actors are *concrete* actors that an implementation can claim. They are required to group with one or more of the *abstract* actors and hence inherits the corresponding requirements. See the actor description section for specific required grouping details.

### 1:XX.1.1 Actors Description and Actor Profile Requirements
Most requirements are documented in RAD TF-2 Transactions. This section documents any additional requirements on this profile's actors.

#### 1:XX.1.1.1 Synchronizing Application

The Synchronizing Application actor is responsible for listening on events and synchronize according to its internal business logic.

The Synchronizing Application shall specify the events that it can support during subscription.

This is the minimum requirements in this profile.

#### 1:XX.1.1.2 Driving Application

The Driving Application actor is a Synchronizing Application. It is responsible for launching other Synchronizing Applications. it is also responsible for initiating and terminating the report context.

The Driving Application shall provide the URL of the Hub actor as `hub.url` and the reporting session as `hub.topic` to the Synchronizing Application during launch.

> Note that the actual application launch method is out of scope of this profile. See [Application Launch Scenarios and Session Discovery](https://build.fhir.org/ig/HL7/fhircast-docs/4-1-launch-scenarios.html) for more details.

#### 1:XX.1.1.3 Content Sharing Application

The Content Sharing Application actor is a Synchronizing Application and it is also responsible for sharing content to a given report context with other Synchronizing Applications.

#### 1:XX.1.1.4 Image Display

The Image Display actor is responsible for presenting patients' studies and relevant information to the user.

The Image Display shall be grouped with the Synchronizing Application actor.

The Image Display shall be grouped with the Driving Application actor if it drives the reporting session.

The Image Display is recommended to be grouped with the Content Sharing Application actor to share image references and measurements with other Synchronizing Applications.

#### 1:XX.1.1.5 Evidence Creator

The Evidence Creator actor is responsible for producing evidence data for the patients' studies.

The Evidence Creator shall be grouped with the Synchronizing Application actor.

The Evidence Creator is recommended to be grouped with the Content Sharing Application actor to share captured evidences with other Synchronizing Applications.

#### 1:XX.1.1.6. Report Creator

The Report Creator actor is responsible for producing a diagnostic report for patients' studies.

The Report Creator shall be grouped with the Synchronizing Application actor.

The Report Creator shall be grouped with the Driving Application actor if it drives the reporting session.

#### 1:XX.1.1.7 Worklist Display

The Worklist Display actor is responsible for presenting a worklist for the user and launching other connected applications on demand.

The Worklist Display shall be grouped with the Synchronizing Application actor.

The Worklist Display shall be grouped with the Driving Application actor if it drives the reporting session.

#### 1:XX.1.1.8 Hub

The Hub actor is responsible for managing a context, content and subscribers in communication sessions.

The Hub shall support accepting and sending all events, including events defined in this profile, defined in FHIRcast or custom events.

For all context events (i.e. events defined as `*-open` or `*-close`), the Hub shall support maintaining the context and set the current context. For all other events (including custom events), the Hub may treat the events as opaque events and shall support at least sending the events to other Synchronizing Applications.

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
      <td>Synchronizing Application</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td>Driving Application</td>
      <td>SMART on FHIR Launch</td>
      <td><a href="volume-1.html#1xx21-smart-on-fhir-launch">1:XX.2.1</a></td>
    </tr>
    <tr>
      <td>Content Sharing Application</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td>Image Display</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td>Evidence Creator</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td>Report Creator</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td>Worklist Manager</td>
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
| Evidence Creator | -- | None | -- |
| Report Creator | -- | None | -- |
| Worklist Manager | -- | None | -- |
| Hub | -- | None | -- |
{: .grid}

> Note: This table excludes the *abstract* actors because they cannot be claimed directly.

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

#### 1:XX.4.1.2 Terminology and Data Model

The terminology used in FHIRcast and adopted in this profile can be found in the [Glossary](https://build.fhir.org/ig/HL7/fhircast-docs/5_glossary.html) page.

The following is a representation of the data model:

**Figure 1:XX.4,1.2-1: FHIRcast Concept Data Model**

<div>
    <img src="data_model.png" width="80%">
</div>
<br clear="all">

#### 1:XX.4.1.3 Long Session and Short Context

A `Session` is a communication channel setup between the `Subscribers` via the `Hub`. As long as `Subscribers` are active and have events to communicate with each other, the `Session` can stay open. Therefore a `Session` has a long duration.

A `Context` is used to communicate a subject on which the `Subscribers` should synchronize as appropriate to their business logic. As soon as the subject is complete, then the corresponding `Context` can be closed. Therefore a `Context` has a short duration.

Note that occasionally a `Context` may be _interrupted_ because of _suspension_, meaning that before the `Context` is closed, another `Context` is opened (e.g. a radiologist needs to suspend the current report on a study in order to review another urgent study). In this case, the information of the previous `Context` is still maintained by the `Hub` since it is not closed, but it is _suspended_ (i.e. not the `Current Context`). Instead the `Current Context` is switched to the urgent study being opened. As soon as the user finished reviewing the urgent study and hence has closed the `Context` of the urgent study, the _suspended_ `Context` will resume to be the `Current Context` since it is the last opened `Context`.

#### 1:XX.4.1.4 Events vs Commands

`Events` represent facts that have happened. For example, DiagnosticReport-open represents an event that an application opens a study for reporting. Note that an event has no direct target audience. Any applications subscribed to the event will receive the event and the application can determine how to process the event. The application that is producing the event is not aware of the actions being performed by different consuming applications, unless these consuming applications in turn publishes additional events.

On the other hand, `Commands` represent intention, often associated with specific target audience(s). For example, Send-Study represents an intention to send a study. Therefore the application that sends the commands often has direct knowledge of which applications should execute the commands, or delegate to a proxy service that has the knowledge.

In this profile, the messages that a `Subscriber` sends to the `Hub` represents an `Event`. This RTC-IMR Profile has no support for sending `Commands`.

#### 1:XX.4.1.5 Event Awareness vs Event Consumption

`Event Awareness` means an application, upon receiving an event from the `Hub`, has the knowledge of an event has happened.

`Event Consumption` means an application, upon receiving an event from the `Hub`, reacts to the event and performed some actions according to its business logic.

This means from the driving application perspective, in order to synchronize the context with other applications, it is desirable to publish as many events as reasonable so that other subscribers can be aware of the same context as in the driving application.

On the other hand, from the subscribing application perspective, it is up to its business logic to determine how to react to the received event. This business logic may be automatic or requires additional user input.

For example, in a nodule tracking application, when the user goes through the study images, the user may keep track of (a.k.a. bookmarking) nodules observed (e.g. 1, 2, ..., 9, 10). Then once the user reviewed the full study, the user may select a subset of the nodules (e.g. 2, 3, 5, 9) identified as important to be added to the report. In this scenario, it is highly recommended that the nodule tracking application sends an event for each nodule (i.e. 1, 2, ..., 9, 10) being bookmarked so that the reporting application is aware of all the nodules the user observed (but not necessary added to the report yet). The user can then instruct the reporting application to add a subset of the nodules (i.e. 2, 3, 5, 9) to the report. Note that since the reporting application is aware of all the nodules observed by synchronizing the context with the nodule tracking application, selecting a subset of the nodules is a local operation and can be done in any order (i.e. the action is not required to only apply to the most recent context received).

Note that this implies the reporting application has to keep track of all the contexts in the received events, independent of whether the context will be used in the report later. This is important because there is no `Command` defined in this profile, and the reporting application cannot request past context from the reporting application or the `Hub`. (The reporting application may provide other means to support a query mechanism, but this is out of scope of this profile).

#### 1:XX.4.1.6 Timing of Sending an Event

On one hand, it is desirable for all subscribed applications to be synchronized with the driving application as soon as possible. On the other hand, FHIRcast is a network protocol which incurs a non-trivial cost to send each event. Therefore any implementation should take into account when an action is considered to be complete or stable, and hence ready to be captured and communicated as events.

For example, when a user is making measurements or annotations, instead of capturing every single measurement or annotation as an event, an application may use an idle time threshold to detect if the user completed the action or not.

Furthermore, this profile is designed to communicate _in-progress_ data as soon as possible. Therefore it is not desirable for the driving application to _wait_ too long. For example, if the driving application supports exporting measurements and annotations as DICOM SR or other DICOM objects, it is not necessary to wait until the DICOM objects are created before sending the corresponding event.  

This profile does not mandate any specific implementation design regarding when an application should capture the result of an action as an event.

#### 1:XX.4.1.7 Transient Resource vs Persistent Resource

FHIRcast uses FHIR resources to capture the context and content in an event. These FHIR resources may be transient, meaning that they do not necessarily exist in any system, nor are they expected to be persisted by any system. Furthermore, even an application decides to persist the FHIR resource(s), it is not required to use the same resource ID in the event as the ID of the persisted resource. The application can generate new IDs instead.

Since the FHIR resources specified in the event may or may not exist, to differentiate between the two cases, this profile defines that transient resources are identified by relative references (e.g. Patient/12345) and persisted resources that already exist are identified by full URL (e.g. http://myserver.com/Patient/12345).

#### 1:XX.4.1.8 Communication of Processing Result

Upon receiving an event, the `Hub` and `Subscribers` process the event according to their own business logic. There are several possible outcome:

| Actor | Process Successfully | Process Successfully with no action | Failed Processing |
| -- | -- | -- | -- |
| `Hub` | Forwards to `Subscribers` based on subscription | NA | Return `SyncError` back to driving application |
| `Subscriber` | No action required. May send new events to the `Hub` | No action required | Send `SyncError` to the `Hub` which forwards them back to the driving application and all other `Subscribers` |
{: .grid}

### 1:XX.4.2 Use Cases

#### 1:XX.4.2.1 Use Case \#1: PACS Driven Reporting

This use case shows a simple two actors scenarios in a reporting session. The PACS is the Image Display acting as a combined Driving Application and a Content Sharing Application while the Reporting App is a Report Creator acting as a Synchronizing Application.

Note that Section 1:XX.4.2.1 repeats in its entirety for additional use
cases (replicate as Section 1:XX.4.2.2, 1:XX.4.2.3, etc.).

##### 1:XX.4.2.1.1 PACS Driven Reporting Use Case Description

The Image Display launches the Report Creator when a reporting session starts.

A radiologist using the worklist function in the Image Display to work through the list of studies to be reported. As the radiologist proceeds, when the Image Display displays each study in the worklist, she uses the Report Creator, loaded with the corresponding procedure for the same study, to create the diagnostic report. During reporting, she creates annotations and measurements on some of the images. These annotations and measurements are selected and populated in the report accordingly. Once she completed the report for the study, she signs off the report and proceeds with the next study in the worklist. Eventually she finishes all the studies in the worklist and close the reporting session.

This is intentionally a high level description depicting a reporting session from the user perspective. In the following subsections, each step will be described in more details regarding how this profile can automatically synchronize the Image Display and the Report Creator.

> Note: The hyperlinks provided in the diagram links to the specific detailed description of each step.

##### 1:XX.4.2.1.2 PACS Driven Reporting Process Flow

<div>
{%include ReportingFlow.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.2-1: PACS Driven Reporting Flow in RTC-IMR Profile

Furthermore, the [Examples](example.html) tab, contains sample events following this use case.

###### 1:XX.4.2.1.2.0 Common Subscription Flow

Subscribing to a reporting session is a common starting point for an actor to start communicating with other actors in the reporting session in realtime.

Subscribing to a reporting session involves two transactions:

- Subscribe Reporting Session [RAD-X1]
- Connect Notification Channel [RAD-X2]

For a Synchronizing Application, the session is provided by the Driving Application during launch.

For a Driving Application (which is also a Synchronizing Application), it generates a unique session ID to start a new session.

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

It is necessary for the Driving Application to subscribe to the reporting events:
- Receives its own events as a confirmation
- Receives the version ID of the event which is required for concurrency control
- Receives synchronization error events from the Hub or from other Synchronizing Applications.

Once the Image Display completed its subscription, it launches the Report Creator. The Report Creator, as a Synchronizing Application, can follows the context and content events automatically.

> Note that *launching* the Report Creator (or any Synchronizing Application) by the Image Display (or any Driving Application) may be implemented in different ways. For example, the Synchronizing Application can be started and terminated, or it can be put in focus and minimize when not needed but keep running in the background for efficiency.

When launched, the first thing that the Report Creator does as a Synchronizing Application is to subscribe to the reporting session. The information about the Hub and the session is provided by the Image Display during launch.

Furthermore, the Report Creator as a Synchronizing Application queries the Hub to get the current context. This ensures that the Synchronizing Application has the most recent context and content. If the reporting session just begins, then the result of the query will be empty. This is necessary because the Image Display does not know when the Report Creator completed its subscription. Therefore it is possible the Image Display has already changed context before the subscription is complete.

<div>
{%include step1-open-reporting-session.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-1: Open Reporting Session Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.2 Step 2: Open Study in Context

When the radiologist selects a study in the worklist in the Image Display, as a Driving Application, it initiates a new report context. Once the Hub accepted the event, it broadcasts the event to all Synchronizing Applications.

The Report Creator, as a Synchronizing Application, receives the event and opens the corresponding procedure for the study.

The Image Display, as a Driving Application, also receives its own event because it subscribes to the event as well. This is a confirmation that that the event is received properly by the Hub.

Furthermore, the event has a version ID which is important for all Synchronizing Applications and Driving Applications. For the Image Display as a Driving Application, including the version ID when submitting the next event ensures proper event sequence. For the Report Creator as a Synchronizing Application, keeping track of the version ID enables it to check if it missed any prior events. Event sequencing is important for content sharing because all updates and selects are expected to be applied in the same sequence as they are emitted by the Driving Application.

<div>
{%include step2-open-study-in-context.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-2: Open Study in Context Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.3 Step 3: Add Content (Optional)

Sometimes the radiologist may annotate the images with markups and measurements. When this happened, the Image Display, as a Content Sharing Application, updates the report context at the Hub with new content via Update Report Content [RAD-X5]. The Hub broadcasts the event to all Synchronizing Applications.

When the Report Creator receives the event, it can apply the updates according to its business logic. For example, it may automatically create a hyperlink in the report, or keeps track of the content in a panel for the user to perform other activities later.

For content sharing events, the Report Creator, as a Synchronizing Application, checks if the event is in the right sequence according to the version ID. If it detected that it missed some prior events, then it queries the hub to retrieve the latest context and content and apply accordingly. 

<div>
{%include step3-add-measurements.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-3: Add Content Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.4 Step 4: Select Content (Optional)

Sometimes the radiologist selected certain elements (e.g. images, annotation, specific measurements, etc.) in the Image Display. When this happened, the Image Display, as a Content Sharing Application, sends a event to the Hub via Select Report Content [RAD-X6] indicating what contents have been selected. The Hub broadcasts the event to all Synchronizing Applications.

When the Report Creator receives the event, it can apply the selection according to its business logic. For example, it can highlight to the user what are selected so that the user can perform some actions. In this example, the radiologist uses a voice command to insert a hyperlink in the report. The Report Creator uses the selected content to generate the hyperlink.

Generally, selecting a content means putting the content in 'focus'. Note that this profile is agnostic about the user interface implementation of 'focus', e.g., it may result in the selected contents being highlighted in the user interface, or it may result in the selected contents being flagged in the backend service. Specific behavior depends on the implementation.

<div>
{%include step4-select-measurements.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-4: Select Content Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.5 Step 5: Sign-off Report

When the radiologist completes dictating the report, the radiologist signs off the report. The Report Creator persists the report according to its business logic. The Report Creator, as a Driving Application, terminates the report context immediately via Terminate Report Context [RAD-X4]. The Hub broadcasts the event to all Synchronizing Applications. Furthermore, the Hub closes the report context.

The Image Display, as a Synchronizing Application in this case, marks the study as reported and removes the study from the worklist.

Note that quite often, the Report Creator has some internal mechanism to keep the report for a grace period after signed off and before sending it out to other recipients. The Terminate Report Context [RAD-X4] event enables the Image Display to quickly aware that the Report Creator has completed the sign-off without affected by the grace period.

Note that in this use case example, the initiating Driving Application (Image Display) is not the same actor as the terminating Driving Application (Report Creator). This requires some coordination between the Image Display and the Report Creator. Such coordination is out of scope of this profile. Other arrangement is possible so that the same Image Display being both the initiating and terminating Driving Application.

<div>
{%include step5-signoff-report.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-5: Sign-off Report Flow in RTC-IMR Profile

The flow above shows the simple case with a sequential switching of report context. In this case, a report context is initiated and then terminated before the next report context is opened.

In practice, the radiologist is likely to continue with the next study in the worklist without any awareness of the events happening behind the scene. If the initiating Driving Application and terminating Driving Application are different as in this example, then it is possible that the radiologist moves to the next study and hence the Image Display initiates a new report context before the Image Display receives the Terminate Report Context [RAD-X5] event.

Such rapid context switching is supported by this profile. The Hub and each Synchronizing Application maintain multiple open context simultaneously. As long as the context is not terminated, it still exists. Each event is associated to a particular anchor context. Therefore a Synchronizing Application can reliably match an event to its internal state according to the context ID in the event. 

The following diagram shows what can happen in case of rapid switching of the report context.

<div>
{%include rapid_switch_context.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-5b: Rapid Context Switching Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.6 Step 6: Terminate Reporting Session

Eventually, the radiologist completed all the studies in the worklist and closes the Report Creator. The Report Creator unsubscribes to the reporting session so that it will no longer receives any future events.

The Hub closes the connection to the Report Creator. Note that if there are other Synchronizing Applications on the same session, those applications are not affected and will continue to receive notification on the session.

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

<div>
{%include interruption-and-resume.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.3-1: Interruption and Resume Flow in RTC-IMR Profile

#### 1:XX.4.2.4 Use Case \#4: Error Handling Flow

Error handling can be synchronous or asynchronous:
- Synchronous: When the Hub or the Synchronizing Application receives an event, it processes the event immediately and failed, then it returns an error status `4xx` or `5xx`.
- Asynchronous: When the Hub or the Synchronizing Application receives an event, it immediates responds with `202` Accepted and process the event asynchronously. If it failed to process the event within a threshold (e.g. FHIRcast recommends <10 seconds), then it sends a `syncerror` using Send SyncError Event [RAD-X10].

> Note that if the Synchronizing Application returns `202` Accepted to the Hub, it is the responsibility of the Synchronizing Application to send a `syncerror` event to the Hub later if it failed to process the event or cannot process the event within a threshold. There is no standard mechanism for the Hub to detect if the Synchronizing Application finished processing or not (there is no *process success* confirmation event).

In some situations, the Hub may initiate the `syncerro` events:
- It receives a `4xx` or `5xx` error from a Synchronizing Application. 
- It detected a Synchronizing Application is not available (via missing heartbeat events) or websocket connection is dropped.

<div>
{%include syncerror.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.4-1: Error Handling Flow in RTC-IMR Profile

## 1:XX.5 RTC-IMR Security Considerations

This profile strongly recommends all actors group with an ITI ATNA Secure Application or Secure Node Actor using the Radiology Audit Trail Option.

The ATNA Profile requires actors to implement:
- [Record Audit Event](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html) [ITI-20] transaction which would record when and where analysis results are distributed and displayed.
- [Authenticate Node](https://profiles.ihe.net/ITI/TF/Volume2/ITI-19.html) [ITI-19] transaction to further ensure the integrity of transactions via node authentication and communication encryption.

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
      <td>Worklist Display</td>
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