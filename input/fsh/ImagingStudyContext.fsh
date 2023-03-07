Profile:        ImagingStudyContext
Parent:         ImagingStudy
Id:             imagingstudycontext
Title:          "ImagingStudy Context"
Description:    "IHE RTC-IMR DiagnosticReport-open study context"

// Must have an identifier which is the study instance UID
* identifier 1..*

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = type.coding
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier.type.coding"
* identifier ^slicing.ordered = false

* identifier contains studyUID 1..1 MS
* identifier[studyUID].type 1..1 MS
* identifier[studyUID].type.coding = DICOM#110180 //Study Insatnce UID
* identifier[studyUID].value 1..1 MS

* identifier contains accession 1..1 MS
* identifier[accession].type 1..1 MS 
* identifier[accession].type.coding = HL7V2#ACSN
* identifier[accession].value 1..1 MS

* status = #available

* subject only Reference(Patient)