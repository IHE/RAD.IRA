Profile:        ImagingStudyContext
Parent:         ImagingStudy
Id:             imagingstudycontext
Title:          "ImagingStudy Context"
Description:    "IHE IRA DiagnosticReport-open study context"

// Must have an identifier which is the study instance UID
* identifier 1..*

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = type
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier.type"
* identifier ^slicing.ordered = false

* identifier contains studyUID 1..1 MS and accession 1..1 MS
* identifier[studyUID].type 1..1 MS
* identifier[studyUID].type = DICOM#110180 //Study Insatnce UID
* identifier[studyUID].value 1..1 MS

// * identifier contains accession 1..1 MS
* identifier[accession].type 1..1 MS 
* identifier[accession].type = HL7V2#ACSN
* identifier[accession].value 1..1 MS

* status = #available

* subject only Reference(Patient)