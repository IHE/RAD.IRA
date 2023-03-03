Profile:        RTC_IMR_Observation
Parent:         Observation
Id:             rtc-imr-observation
Title:          "(Experimental) Imaging Observation"
Description:    "Experimental profile on Observation for quantitative and qualitative findings to be used in DiagnosticReport-update events."

// Specify the category to be imaging
* category 1..*

* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "coding"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the category.coding"
* category ^slicing.ordered = false

* category contains imaging 1..1 MS
* category[imaging].coding = FHIRObservation#imaging

// Shall reference on Patient
* subject 1..1
* subject only Reference(Patient)

// At least one performer is an Organization
* performer only Reference(Practitioner or PractitionerRole or Organization)

* value[x] MS
* value[x] ^short = "Actual result. Note: If the value is null, an explicit corresponding null value is required rather than leaving the value blank."

// Maximum one study to be referenced in derivedFrom
* derivedFrom 0..* MS

* derivedFrom ^slicing.discriminator.type = #type
* derivedFrom ^slicing.discriminator.path = resolve()
* derivedFrom ^slicing.rules = #open
* derivedFrom ^slicing.description = "Slice based on the derivedFrom reference type"
* derivedFrom ^slicing.ordered = false

* derivedFrom contains imagingStudy 0..1
* derivedFrom[imagingStudy] only Reference(ImagingStudy)