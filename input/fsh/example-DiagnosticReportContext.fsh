Instance: example-DiagnosticReportContext
InstanceOf: DiagnosticReportContext
Title: "DiagnosticReport Context example"
Description: "Sample Report Context used in DiagnosticReport-open event"
Usage: #example
* status = FHIRImagingStudyStatus#unknown
* code = LOINC#29252-4 "CT Chest WO Contrast"
* subject = Reference(Patient/example-PatientContext)
* study = Reference(ImagingStudy/example-ImagingStudyContext)