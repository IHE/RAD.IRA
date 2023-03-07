Instance:   example-ImagingSelectionContent
InstanceOf: ImagingSelectionContent
Title:      "ImagingSelection Content example"
Description: "Sample ImagingSelection Content used in DiagnosticReport-update event"
Usage: #example

* status = FHIRObservationStatus#unknown
* subject = Reference(Patient/example-PatientContext)
* derivedFrom = Reference(ImagingStudy/example-ImagingStudyContext)
* code.coding = DICOM#128195 "For Diagnosis"
* studyUid = "1.2.3.4.5"
* seriesUid = "1.2.3.4.5.1"
* instance.uid = "1.2.3.4.5.1.1"
* instance.sopClass.system = OID
* instance.sopClass.code = DICOMSOPClass#"urn:oid:1.2.840.10008.5.1.4.1.1.2"
* instance.imageRegion2D.regionType = FHIRImagingSelection2D#polyline "POLYLINE"
* instance.imageRegion2D.coordinate[+] = 0.25
* instance.imageRegion2D.coordinate[+] = 0.25
* instance.imageRegion2D.coordinate[+] = 0.75
* instance.imageRegion2D.coordinate[+] = 0.25
* instance.imageRegion2D.coordinate[+] = 0.75
* instance.imageRegion2D.coordinate[+] = 0.75
* instance.imageRegion2D.coordinate[+] = 0.25
* instance.imageRegion2D.coordinate[+] = 0.75
* instance.imageRegion2D.coordinate[+] = 0.25
* instance.imageRegion2D.coordinate[+] = 0.25