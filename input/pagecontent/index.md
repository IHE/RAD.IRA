
The Integrated Reporting Applications (IRA) profile helps applications that are used together during reporting (e.g., image display, report creator, clinical applications, AI tools, etc) to share information using a standard called FHIRcast. Each application can share what it is doing and the data it is creating, referred to as Context and Content, respectively. Other applications are notified so they can then intelligently synchronize their behavior or use the new data.

<div markdown="1" class="stu-note">

IRA uses FHIR R5 for the resources used in FHIRcast events. Specifically this includes the FHIR ImagingSelection resource. FHIR R5 is currently under development.

IRA also uses FHIRcast 3.0.0 which is currently under development.

Links to FHIRcast will be updated to the final version when the official version is published.

| [Significant Changes, Open and Closed Issues](issues.html) |
{: .grid}

</div>

### Organization of This Guide
This guide is organized into the following sections:

1. Volume 1: Profiles
   1. [Introduction](volume-1.html)
   1. [Actors and Transactions](volume-1.html#1xx1-realtime-bidirectional-communication-for-interactive-multimedia-reporting)
   1. [Actor Options](volume-1.html#1xx2-ira-actor-options)
   1. [Actor Required Groupings](volume-1.html#1xx3-ira-required-actor-groupings)
   1. [Overview](volume-1.html#1xx4-ira-overview)
   1. [Security Considerations](volume-1.html#1xx5-ira-security-considerations)
   1. [Cross Profile Considerations](volume-1.html#1xx6-ira-cross-profile-considerations)

2. Volume 2: Transaction Detail
   1. [Subscribe to Reporting Session [RAD-X1]](rad-x1.html)
   2. [Connect to Notification Channel [RAD-X2]](rad-x2.html)
   3. [Open Report Context [RAD-X3]](rad-x3.html)
   4. [Close Report Context [RAD-X4]](rad-x4.html)
   5. [Update Report Content [RAD-X5]](rad-x5.html)
   6. [Select Report Content [RAD-X6]](rad-x6.html)
   7. [Unsubscribe Session [RAD-X7]](rad-x7.html)
   8. [Get Current Context [RAD-X8]](rad-x8.html)
   9. [Distribute Context Event [RAD-X9]](rad-x9.html)
   10. [Generate SyncError Event [RAD-X10]](rad-x10.html)
   11. [Notify Error [RAD-X11]](rad-x11.html)

3. [Examples] (example.html)

4. Other
  - [Test Plan](testplan.html)
  - [Changes to Other Documents] (other.html)
  - [Downloads and Analysis] (download.html)

See also the [Table of Contents](toc.html) and the index of [Artifacts](artifacts.html) defined as part of this implementation guide.

### Conformance Expectations

IHE uses the normative words: Shall, Should, and May according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

#### Must Support

The use of ```mustSupport``` in StructureDefinition profiles equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

mustSupport of true - only has a meaning on items that are minimal cardinality of zero (0), and applies only to the source actor populating the data. The source actor shall populate the elements marked with MustSupport, if the concept is supported by the actor, a value exists, and security and consent rules permit. 
The consuming actors should handle these elements being populated or being absent/empty. 
Note that sometimes mustSupport will appear on elements with a minimal cardinality greater than zero (0), this is due to inheritance from a less constrained profile.

