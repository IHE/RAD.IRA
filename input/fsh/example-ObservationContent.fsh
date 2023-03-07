Instance:   example-ObservationContent
InstanceOf: ObservationContent
Title:      "Observation Content example"
Description: "Sample Observation Content used in DiagnosticReport-update event"
Usage: #example

* status = FHIRObservationStatus#preliminary
* category[imaging].coding = FHIRObservation#imaging "Imaging"
* code = SCT#233767005 "Bilateral hilar lymph node sarcoidosis"
* bodySite[+].coding = SCT#264128009 "Paratracheal"
* bodySite[=].coding = SCT#24028007 "Right"
* bodySite[=].text = "right paratracheal station"
* component[+].code.coding = SCT#410668003 "Length"
* component[=].valueQuantity.value = 1.2
* component[=].valueQuantity.comparator = FHIRQuantityComparator#<= "<="
* component[=].valueQuantity.unit = UCUM#cm "cm"
* component[+].code.coding = SCT#103355008 "Width"
* component[=].valueQuantity.value = 0.8
* component[=].valueQuantity.comparator = FHIRQuantityComparator#<= "<="
* component[=].valueQuantity.unit = UCUM#cm "cm"
* subject = Reference(Patient/example-PatientContext)
* effectiveDateTime = 2020-12-31T23:50:50-05:00
* derivedFrom = Reference(ImagingStudy/example-ImagingStudyContext)