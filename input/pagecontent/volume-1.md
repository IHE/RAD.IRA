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
      <td rowspan="10"><a href="volume-1.html#1xx111-read-only-subscriber">Read-Only Subscriber</a></td>
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
      <td>O</td>
      <td><a href="rad-x3.html">RAD TF-2: 4.X3</a></td>
    </tr>
    <tr>
      <td>Terminate Report Context [RAD-X4]</td>
      <td>Initiator</td>
      <td>O</td>
      <td><a href="rad-x4.html">RAD TF-2: 4.X4</a></td>
    </tr>
    <tr>
      <td>Update Report Content [RAD-X5]</td>
      <td>Initiator</td>
      <td>O</td>
      <td><a href="rad-x5.html">RAD TF-2: 4.X5</a></td>
    </tr>
    <tr>
      <td>Select Report Content [RAD-X6]</td>
      <td>Initiator</td>
      <td>O</td>
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
      <td rowspan="10"><a href="volume-1.html#1xx112-context-sharing-subscriber">Context Sharing Subscriber</a></td>
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
      <td>Update Report Content [RAD-X5]</td>
      <td>Initiator</td>
      <td>O</td>
      <td><a href="rad-x5.html">RAD TF-2: 4.X5</a></td>
    </tr>
    <tr>
      <td>Select Report Content [RAD-X6]</td>
      <td>Initiator</td>
      <td>O</td>
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
      <td rowspan="10"><a href="volume-1.html#1xx113-content-sharing-subscriber">Content Sharing Subscriber</a></td>
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
  </tbody>
</table>

### 1:XX.1.1 Actors Description and Actor Profile Requirements
Most requirements are documented in RAD TF-2 Transactions. This section documents any additional requirements on this profile's actors.

#### 1:XX.1.1.1 Read-Only Subscriber

The Read-Only Subscriber actor is responsible for subscribing to a given reporting session and handling events received from the session.

#### 1:XX.1.1.2 Context Sharing Subscriber

The Context Sharing Subscriber actor is responsible for subscribing to a given reporting session, initiating and terminating a report context, and handling events received from the session.

#### 1:XX.1.1.3 Content Sharing Subscriber

The Context Sharing Subscriber actor is responsible for subscribing to a given reporting session, initiating and terminating a report context, updating and selecting additional content for a report context, and handling events received from the session.

#### 1:XX.1.1.4 Image Display

The Image Display actor is responsible for presenting patients' studies and relevant information to the user.

The Image Display is required to be grouped with either the Context Sharing Subscriber or the Content Sharing Subscriber.

If the Image Display is the driving application that launches other synchronized applications, then it is responsible for providing the URL of the Hub actor as `hub.url` and the reporting session as `hub.topic` to each synchronized application.

#### 1:XX.1.1.5 Evidence Creator

The Evidence Creator actor is responsible for producing evidence data for the patients' studies.

The Evidence Creator is required to be grouped with the Read-Only Subscriber or the Content Sharing Subscriber.

#### 1:XX.1.1.6. Report Creator

The Report Creator actor is responsible for producing a diagnostic report for patients' studies.

The Report Creator is required to be grouped with the Read-Only Subscriber, the Context Sharing Subscriber, or the Content Sharing Subscriber.

If the Report Creator is the driving application that launches other synchronized applications, then it is responsible for providing the URL of the Hub actor as `hub.url` and the reporting session as `hub.topic` to each synchronized application.

#### 1:XX.1.1.7 Worklist Display

The Worklist Display actor is responsible for presenting a worklist for the user and launching other connected applications on demand.

The Worklist Display is required to be grouped with the Read-Only Subscriber or the Context Sharing Subscriber.

If the Worklist Display is the driving application that launches other synchronized applications, then it is responsible for providing the URL of the Hub actor as `hub.url` and the reporting session as `hub.topic` to each synchronized application.

#### 1:XX.1.1.8 Hub

The Hub actor is responsible for managing a context, content and subscribers in communication sessions.

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

## 1:XX.4 RTC-IMR Overview

### 1:XX.4.1 Concepts

#### 1:XX.4.1.1 Publish and Subscribe Model

This profile is based on [FHIRcast](https://build.fhir.org/ig/HL7/fhircast-docs/index.html) which uses a Publish and Subscribe model based on [WebSub](https://www.w3.org/TR/websub/) to synchronize applications in real time.

The following are some key concepts:
* A `Hub` receives events from a driving application and forwards the events to subscribing applications (i.e. `Subscriber`) according to their subscription.
* The `Hub` is also responsible for keeping track of the events and maintain a view of the current context.
* A driving application is a `Subscriber` that performs an action, captures the result of the action as an event, and sends the event to the `Hub`
* Other `Subscribers` (i.e. not the driving application) receive events from the `Hub` according to their subscription.
* The driving application is unaware of who are the `Subscribers` on the events that it sends and how will they react upon receiving the events.
* Each `Subscriber` determines how it should react upon receiving an event.
* The driving application is responsible for setting up the session (identified by a unique topic ID), launching the other applications with the session and address of the `Hub`.
* Both the driving application and other launched applications subscribe to the same session at the `Hub` so that communications can flow in both directions.
* The `Hub` only processes events sent by authenticated `Subscribers`. 

TODO: Replace the FHIRcast link to the published version if ready by the time of publication.

#### 1:XX.4.1.2 Terminology and Data Model

The terminology used in FHIRcast and adopted in this profile can be found in the [Glossary](https://build.fhir.org/ig/HL7/fhircast-docs/5_glossary.html) page.

The following is a representation of the data model:

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

TO DO: One or two sentence simple description of this particular use
case.

Note that Section 1:XX.4.2.1 repeats in its entirety for additional use
cases (replicate as Section 1:XX.4.2.2, 1:XX.4.2.3, etc.).

##### 1:XX.4.2.1.1 simple name Use Case Description

TO DO: Describe the key use cases addressed by the profile. Limit to a
maximum of one page of text or consider an appendix.

##### 1:XX.4.2.1.2 simple name Process Flow

<div>
{%include ReportingFlow.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.2-1: PACS Driven Reporting Flow in RTC-IMR Profile

The following sections elaborate on each step in this use case. The hyperlinks in the use case diagram above link to the corresponding step for quick access.

Furthermore, the [Examples](example.html) tab, contains sample events following this use case.

###### 1:XX.4.2.1.2.0 Common Subscription Flow

Subscribing to a reporting session is a common starting point for an actor to start communicating with other actors in the reporting session in realtime.

Subscribing to a reporting session involves two transactions:

- Subscribe Reporting Session [RAD-X1]
- Connect Notification Channel [RAD-X2]

<div>
{%include common-subscription.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.0-1: Common Subscription Flow in RTC-IMR Profile

To simplify the subsequent use case flows for readability, this common subscription flow will be represented as a single line as a meta transaction [RAD-Sub]. The following is an example with PACS as a Subscriber.

<div>
{%include condensed-subscription-transaction.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.0-2: Condensed Subscription Transaction in RTC-IMR Profile

###### 1:XX.4.2.1.2.1 Step 1: Open Reporting Session

When a radiologist starts reporting, the PACS, as the initiator, opens a reporting session.

Note that there is no explicit creation of a session. If the Hub receives a session ID (i.e. topic) that does not already exist, then the Hub will automatically create the session and add the subscriber (i.e. PACS) to the session.

<div>
{%include step1-open-reporting-session.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-1: Open Reporting Session Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.2 Step 2: Open Study in Context

<div>
{%include step2-open-study-in-context.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-2: Open Study in Context Flow in RTC-IMR Profile

Note that when the Reporting App successfully completes the subscription, it immediately queries for the current context from the Hub. This immediate query is to ensure that the Reporting App is aware of the latest context in the session.
This is necessary because the PACS does not know when the Reporting App completed the subscription. Therefore it is possible the PACS has already changed context before the subscription is complete.

###### 1:XX.4.2.1.2.3 Step 3: Add Content (Optional)

<div>
{%include step3-add-measurements.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-3: Add Content Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.4 Step 4: Select Content (Optional)

<div>
{%include step4-select-measurements.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-4: Select Content Flow in RTC-IMR Profile

Selected contents are put into 'focus' by the Reporting App. Note that this profile is agnostic about the user interface implementation of 'focus', e.g., it may result in the selected contents being highlighted in the user interface, or it may result in the selected contents being flagged in the backend service. Specific behavior depends on the implementation.

###### 1:XX.4.2.1.2.5 Step 5: Sign-off Report

<div>
{%include step5-signoff-report.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-5: Sign-off Report Flow in RTC-IMR Profile

The flow above shows the simple case with a single report context. In practice, the radiologist is likely to continue with the next study in the worklist without any awareness of the events happening behind the scene. Such rapid context switching is supported by the Hub because it can maintain multiple context simultaneously.

The following diagram shows what can happen in case of rapid switching of the report context.

<div>
{%include rapid_switch_context.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-5b: Rapid Context Switching Flow in RTC-IMR Profile

###### 1:XX.4.2.1.2.6 Step 6: Terminate Reporting Session

<div>
{%include step6-terminate-reporting-session.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.1.2.1-6: Terminate Reporting Session Flow in RTC-IMR Profile

#### 1:XX.4.2.2 Use Case: Worklist Manager Driven Reporting

<div>
{%include multi_app.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.2-1: Worklist Manager Driven Reporting in RTC-IMR Profile

#### 1:XX.4.2.3 Use Case: Interruption and Resume Flow

<div>
{%include interruption-and-resume.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.3-1: Interruption and Resume Flow in RTC-IMR Profile

#### 1:XX.4.2.4 Use Case: Error Handling Flow

<div>
{%include syncerror.svg%}
</div>
<br clear="all">

Figure 1:XX.4.2.4-1: Error Handling Flow in RTC-IMR Profile

## 1:XX.5 RTC-IMR Security Considerations

See ITI TF-2x: [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations)

TO DO...UPDATE THIS BOILERPLATE TEXT FROM THE SUPP. TEMPLATE: This section should address downstream design considerations, specifically for: Privacy, Security, and Safety. These might need to be individual header sections if they are significant or need to be referenced.

The editor needs to understand Security and Privacy fundamentals. 
General [Security and Privacy guidance](http://hl7.org/fhir/secpriv-module.html) is provided in the FHIR Specification. 
The FHIR core specification should be leveraged where possible to inform the reader of your specification.

IHE FHIR based profiles should reference the [ITI Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html) section 8 Mobile Security and Privacy Considerations base when appropriate.

IHE Document Content profiles can reference the security and privacy provided by the Document Sharing infrastructure as directly grouped or possibly to be grouped.

   While it is not a requirement that any given specification or system be
   immune to all forms of attack, it is still necessary for authors of specifications to
   consider as many forms as possible.  Part of the purpose of the
   Security and Privacy Considerations section is to explain what attacks have been 
   considered and what countermeasures can be applied to defend against them.
   
   There should be a clear description of the kinds of threats on the
   described specification.  This should be approached as an
   effort to perform "due diligence" in describing all known or
   foreseeable risks and threats to potential implementers and users.

Authors MUST describe:
* which attacks have been considered and addressed in the specification
* which attacks have been considered but not addressed in the specification
* what could be done in system design, system deployment, or user training


   At least the following forms of attack MUST be considered:
   eavesdropping, replay, message insertion, deletion, modification, and
   man-in-the-middle.  Potential denial of service attacks MUST be
   identified as well.  If the specification incorporates cryptographic
   protection mechanisms, it should be clearly indicated which portions
   of the data are protected and what the protections are (i.e.,
   integrity only, confidentiality, and/or endpoint authentication,
   etc.).  Some indication should also be given to what sorts of attacks
   the cryptographic protection is susceptible.  Data which should be
   held secret (keying material, random seeds, etc.) should be clearly
   labeled.

   If the specification involves authentication, particularly user-host
   authentication, the security of the authentication method MUST be
   clearly specified.  That is, authors MUST document the assumptions
   that the security of this authentication method is predicated upon.

   The threat environment addressed by the Security and Privacy Considerations
   section MUST at a minimum include deployment across the global
   Internet across multiple administrative boundaries without assuming
   that firewalls are in place, even if only to provide justification
   for why such consideration is out of scope for the protocol.  It is
   not acceptable to only discuss threats applicable to LANs and ignore
   the broader threat environment.  In
   some cases, there might be an Applicability Statement discouraging
   use of a technology or protocol in a particular environment.
   Nonetheless, the security issues of broader deployment should be
   discussed in the document.

   There should be a clear description of the residual risk to the user
   or operator of that specification after threat mitigation has been
   deployed.  Such risks might arise from compromise in a related
   specification (e.g., IPsec is useless if key management has been
   compromised), from incorrect implementation, compromise of the
   security technology used for risk reduction (e.g., a cipher with a
   40-bit key), or there might be risks that are not addressed by the
   specification (e.g., denial of service attacks on an
   underlying link protocol).  Particular care should be taken in
   situations where the compromise of a single system would compromise
   an entire protocol.  For instance, in general specification designers
   assume that end-systems are inviolate and don't worry about physical
   attack.  However, in cases (such as a certificate authority) where
   compromise of a single system could lead to widespread compromises,
   it is appropriate to consider systems and physical security as well.

   There should also be some discussion of potential security risks
   arising from potential misapplications of the specification or technology
   described in the specification.  
  
This section also include specific considerations regarding Digital Signatures, Provenance, Audit Logging, and De-Identification.

Where audit logging is specified, a StructureDefinition profile(s) should be included, and Examples of those logs might be included.

## 1:XX.6 RTC-IMR Cross-Profile Considerations

TO DO: This section is informative, not normative. It is intended to put
this profile in context with other profiles. Any required groupings
should have already been described above. Brief descriptions can go
directly into this section; lengthy descriptions should go into an
appendix. Examples of this material include ITI Cross Community Access
(XCA) Grouping Rules (Section 18.2.3), the Radiology associated profiles
listed at wiki.ihe.net, or ITI Volume 1 Appendix E “Cross Profile
Considerations”, and the “See Also” sections Radiology Profile
descriptions on the wiki such as
<http://wiki.ihe.net/index.php/Scheduled_Workflow#See_Also>. If this
section is left blank, add “Not applicable.”

Consider using a format such as the following:

other profile acronym - other profile name

A other profile actor name in other profile name might
be grouped with a this profile actor name to describe
benefit/what is accomplished by grouping.


