Instance: example-ImagingStudyContext
InstanceOf: ImagingStudyContext
Title: "ImagingStudy Context example"
Description: "Sample Study Context used in DiagnosticReport-open event"
Usage: #example
* identifier[studyUID].type.coding = DICOM#110180 "Study Instance UID"
* identifier[studyUID].system = DICOMUID
* identifier[studyUID].value = "urn:oid:1.2.3.4.5"
* identifier[accession].type.coding = HL7V2#ACSN "Accession ID"
* identifier[accession].system = "http://www.acme.com/identifiers/accession"
* identifier[accession].value = "12345"
* status = FHIRImagingStudyStatus#available
* subject = Reference(Patient/example-PatientContext)