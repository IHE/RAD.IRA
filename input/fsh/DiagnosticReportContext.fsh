Profile:        DiagnosticReportContext
Parent:         DiagnosticReport
Id:             diagnosticreportcontext
Title:          "DiagnosticReport Context"
Description:    "IHE IRA DiagnosticReport-open report context"

* status = #unknown

* subject 1..1
* subject only Reference(Patient)

* study 1..1
* study only Reference(ImagingStudy)