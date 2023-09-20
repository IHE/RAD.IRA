Profile:        DiagnosticReportUpdate
Parent:         DiagnosticReport
Id:             diagnosticreportupdate
Title:          "DiagnosticReport Update"
Description:    "IHE IRA DiagnosticReport-update event"

* subject only Reference(Patient)

* study 0..1
* study only Reference(ImagingStudy)

* extension contains AssociatedStudy named associatedStudy 0..* MS

Extension: AssociatedStudy
Title: "IRA DiagnosticReport Associated Study"
Id: associatedStudy
Description: "Associated studies used in part of diagnostic reporting"
Context: DiagnosticReport
* value[x] only Reference(ImagingStudy or DiagnosticReport)