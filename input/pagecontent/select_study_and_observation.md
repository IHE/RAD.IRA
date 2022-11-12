### Event-name: DiagnosticReport-select

### Trigger Event
Radiologist selected the subject study and the observation.

### Examples

#### DiagnosticReport-select Example

The following example shows the selection of a single Observation resource in an anchor context of a diagnostic report.

```json
{
  "timestamp": "2019-09-10T14:58:45.988Z",
  "id": "0e7ac18",
  "event": {
    "hub.topic": "e62b4411-55f3-431a-94e8-ef4af537511c",
    "hub.event": "DiagnosticReport-select",
    "context.versionId": "efcac43a-ed38-49e4-8d79-73f78290292a",
    "context": [
      {
        "key": "report",
        "resource": {
          "resourceType": "DiagnosticReport",
          "id": "40012366"
        }
      },
      {
        "key": "select",
        "resource": [
          {
            "resourceType": "Observation",
            "id": "435098234"
          },
          {
            "resourceType": "ImagingSelection",
            "id": "18735123"
          }
        ]
      }
    ]
  }
}
```

#### DiagnosticReport-select Event Example

```json
{
  "timestamp": "2019-09-10T14:58:45.988Z",
  "id": "0e7ac18",
  "event": {
    "hub.topic": "e62b4411-55f3-431a-94e8-ef4af537511c",
    "hub.event": "DiagnosticReport-select",
    "context.versionId": "ca3b44a1-d40e-44ae-99bb-434c10dfb535",
    "context.priorVersionId": "efcac43a-ed38-49e4-8d79-73f78290292a",
    "context": [
      {
        "key": "report",
        "resource": {
          "resourceType": "DiagnosticReport",
          "id": "40012366"
        }
      },
      {
        "key": "select",
        "resource": [
          {
            "resourceType": "Observation",
            "id": "435098234"
          },
          {
            "resourceType": "ImagingSelection",
            "id": "18735123"
          }
        ]
      }
    ]
  }
}
```

| Event | Session ID | Current Context | Anchor Context | Contexts Present | Content | Content Selected | Version ID | Prior Version ID | 
|--|--|--|--|--|--|--|--|--|
| DiagnosticReport-open | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br><br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br><br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | none | none | b9574cb0-e9e5-4be1-8957-5fcb51ef33c1 | none |
| DiagnosticReport-update | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br><br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br><br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | study: ImagingStudy<br>id: 3478116342<br>study uid: 2.16.124.113543.6003.1154777499.30276.83661.3632298176<br><br>measurement: Observation<br>id: 435098234<br>code: Simple cyst<br>study ref: 8i7tbu6fby5ftfbku6fniuf<br><br>annotation: ImagingSelection<br>id: 18735123<br>markup: ... | none | efcac43a-ed38-49e4-8d79-73f78290292a | b9574cb0-e9e5-4be1-8957-5fcb51ef33c1 |
| DiagnosticReport-select | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br><br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br><br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | study: ImagingStudy<br>id: 3478116342<br>study uid: 2.16.124.113543.6003.1154777499.30276.83661.3632298176<br><br>measurement: Observation<br>id: 435098234<br>code: Simple cyst<br>study ref: 8i7tbu6fby5ftfbku6fniuf<br><br>annotation: ImagingSelection<br>id: 18735123<br>markup: ... | measurement: Observation<br>id: 435098234<br><br>annotation: ImagingSelection<br>id: 18735123 | ca3b44a1-d40e-44ae-99bb-434c10dfb535 |efcac43a-ed38-49e4-8d79-73f78290292a |
{: .grid}