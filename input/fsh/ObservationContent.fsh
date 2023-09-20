Profile:        ObservationContent
Parent:         Observation
Id:             ira-observation
Title:          "Observation Content"
Description:    "IHE IRA Observation Content to be used in DiagnosticReport-update"

// Shall reference on Patient
* subject 1..1
* subject only Reference(Patient)

// Maximum one study to be referenced in derivedFrom
* derivedFrom 0..* MS

* derivedFrom ^slicing.discriminator.type = #type
* derivedFrom ^slicing.discriminator.path = resolve()
* derivedFrom ^slicing.rules = #open
* derivedFrom ^slicing.description = "Slice based on the derivedFrom reference type"
* derivedFrom ^slicing.ordered = false

* derivedFrom contains imagingStudy 0..1
* derivedFrom[imagingStudy] only Reference(ImagingStudy)

* derivedFrom contains imagingSelection 0..*
* derivedFrom[imagingSelection] only Reference(ImagingSelection)