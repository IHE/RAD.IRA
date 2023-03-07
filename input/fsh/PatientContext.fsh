Profile:        PatientContext
Parent:         Patient
Id:             patientcontext
Title:          "Patient Context"
Description:    "IHE IRA DiagnosticReport-open patient context"

// Must have an identifier which is the patient ID
* identifier 1..*

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = type.coding
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier.system"
* identifier ^slicing.ordered = false

* identifier contains patientID 1..1 MS
* identifier[patientID].type.coding = HL7V2#MR "Medical Record Number"
* identifier[patientID].value 1..1 MS