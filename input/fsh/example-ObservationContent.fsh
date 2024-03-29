Instance:   example-ObservationContent
InstanceOf: ObservationContent
Title:      "Observation Content example"
Description: "Sample Observation Content used in DiagnosticReport-update event. The Observation includes a reference to the ImagingSelection in which the observation is derived from."
Usage: #example

* status = FHIRObservationStatus#preliminary
* category.coding = FHIRObservation#imaging "Imaging"
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
* derivedFrom = Reference(ImagingSelection/example-ImagingSelectionContent)
* performer = Reference(Organization/example-Organization)


Instance: example-Organization
InstanceOf: Organization
Title: "Observation Performer Example"
Description: "Example of a performer for observation, representing the organization that responsible for the content in this resource."
Usage: #example

* name = "Example Medical Center"