
The Integrated Reporting Applications (IRA) profile helps applications that are used together during reporting (e.g., image display, report creator, clinical applications, AI tools, etc) to share information using a standard called FHIRcast. Each application can share what it is doing and the data it is creating, referred to as Context and Content, respectively. Other applications are notified so they can then intelligently synchronize their behavior or use the new data.

<div markdown="1" class="stu-note">

IRA uses FHIR R5 for the resources used in FHIRcast events.

IRA uses FHIRcast 3.0.0 which is currently under development.

Links to FHIRcast throughout this profile will be updated to the final version when the official version is published.

| [Significant Changes, Open and Closed Issues](issues.html) |
{: .grid}

</div>

### Organization of This Guide
This guide is organized into the following sections:

1. Volume 1: Profiles
   1. [Introduction](volume-1.html)
   1. [Actors and Transactions](volume-1.html#1531-integrating-reporting-applications)
   1. [Actor Options](volume-1.html#1532-ira-actor-options)
   1. [Actor Required Groupings](volume-1.html#1533-ira-required-actor-groupings)
   1. [Overview](volume-1.html#1534-ira-overview)
   1. [Security Considerations](volume-1.html#1535-ira-security-considerations)
   1. [Cross Profile Considerations](volume-1.html#1536-ira-cross-profile-considerations)

2. Volume 2: Transaction Detail
   1. [Subscribe to Reporting Session [RAD-146]](rad-146.html)
   1. [Connect to Notification Channel [RAD-147]](rad-147.html)
   1. [Open Report Context [RAD-148]](rad-148.html)
   1. [Close Report Context [RAD-149]](rad-149.html)
   1. [Update Report Content [RAD-150]](rad-150.html)
   1. [Select Report Content [RAD-151]](rad-151.html)
   1. [Unsubscribe Session [RAD-152]](rad-152.html)
   1. [Get Current Context [RAD-153]](rad-153.html)
   1. [Distribute Context Event [RAD-154]](rad-154.html)
   1. [Generate SyncError Event [RAD-155]](rad-155.html)
   1. [Notify Error [RAD-156]](rad-156.html)

3. [Examples](example.html)

4. Other
  - [Test Plan](testplan.html)
  - [Changes to Other Documents](other.html)
  - [Downloads and Analysis](download.html)

See also the [Table of Contents](toc.html) and the index of [Artifacts](artifacts.html) defined as part of this implementation guide.

### Conformance Expectations

IHE uses the normative words: Shall, Should, and May according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

#### Must Support

The use of ```mustSupport``` in StructureDefinition profiles is equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

mustSupport of true - only has a meaning on items that are minimal cardinality of zero (0), and applies only to the source actor populating the data. The source actor shall populate the elements marked with MustSupport, if the concept is supported by the actor, a value exists, and security and consent rules permit. 
The consuming actors should handle these elements being populated or being absent/empty. 
Note that sometimes mustSupport will appear on elements with a minimal cardinality greater than zero (0), this is due to inheritance from a less constrained profile.

