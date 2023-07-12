Instance: example-DiagnosticReportComparisonStudyUpdate
InstanceOf: DiagnosticReportUpdate
Title: "DiagnosticReport with Comparison Study Update example"
Description: "Sample Comparison Study Update used in DiagnosticReport-update event"
Usage: #example
* status = FHIRImagingStudyStatus#unknown
* code = LOINC#29252-4 "CT Chest WO Contrast"
* subject = Reference(Patient/example-PatientContext)
* study = Reference(ImagingStudy/example-ImagingStudyContext)

* extension[associatedStudy].valueReference = Reference(ImagingStudy/example-ImagingStudy-Comparison)

Instance: example-ImagingStudy-Comparison
InstanceOf: ImagingStudyContext
Title: "ImagingStudy as Comparison Study example"
Description: "Sample ImagingStudy used as a Comparison Study in DiagnosticReport-update event"
Usage: #example
* identifier[studyUID].type.coding = DICOM#110180 "Study Instance UID"
* identifier[studyUID].system = DICOMUID
* identifier[studyUID].value = "urn:oid:5.6.7.8.9"
* identifier[accession].type.coding = HL7V2#ACSN "Accession ID"
* identifier[accession].system = "http://www.acme.com/identifiers/accession"
* identifier[accession].value = "56789"
* status = FHIRImagingStudyStatus#available
* subject = Reference(Patient/example-PatientContext)