Instance: example-PatientContext
InstanceOf: PatientContext
Title: "Patient Context example"
Description: "Sample Patient Context used in DiagnosticReport-open event"
Usage: #example
* identifier.type.coding = HL7V2#MR "Medical Record Number"
* identifier.system = "http://www.acme.com/identifiers/patient"
* identifier.value = "1234567"
* name.family = "Smith"
* name.given = "John"