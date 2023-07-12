Instance: example-DiagnosticReportStatusUpdate
InstanceOf: DiagnosticReportUpdate
Title: "DiagnosticReport Status Update example"
Description: "Sample Report Status Update used in DiagnosticReport-update event"
Usage: #example
* status = FHIRImagingStudyStatus#final
* code = LOINC#29252-4 "CT Chest WO Contrast"
* subject = Reference(Patient/example-PatientContext)
* study = Reference(ImagingStudy/example-ImagingStudyContext)