### Event-name: DiagnosticReport-close

### Trigger Event

Radiologist signed off a report.

### Examples

#### DiagnosticReport-close Example

This example closes a DiagnosticReport anchor context.

```json
{
  "timestamp": "2020-09-07T15:04:43.133Z",
  "id": "4441881",
  "event": {
    "hub.topic": "e62b4411-55f3-431a-94e8-ef4af537511c",
    "hub.event": "DiagnosticReport-close",
    "context.versionId": "efcac43a-ed38-49e4-8d79-73f78290292a",
    "context": [
      {
        "key": "Report",
        "resource": {
          "resourceType": "DiagnosticReport",
          "id": "40012366",
        }
      }
    ]
  }
}
```

#### DiagnosticReport-close event Example

```json
{
  "timestamp": "2020-09-07T15:04:43.133Z",
  "id": "4441881",
  "event": {
    "hub.topic": "e62b4411-55f3-431a-94e8-ef4af537511c",
    "hub.event": "DiagnosticReport-close",
    "context.versionId": "2685b00c-69b8-4e5d-bdd9-602f45a616a5",
    "context.priorVersionId": "efcac43a-ed38-49e4-8d79-73f78290292a",
    "context": [
      {
        "key": "Report",
        "resource": {
          "resourceType": "DiagnosticReport",
          "id": "40012366",
        }
      }
    ]
  }
}
```
### Available Context and Content in Hub

| Time Sequence | Event | Session ID | Current Context | Anchor Context |  Contexts Present | Content | Content Selected | Version ID | Prior Version ID | 
|--|--|--|--|--|--|--|--|--|
| 1 | DiagnosticReport-open | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br><br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br><br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | none | none | b9574cb0-e9e5-4be1-8957-5fcb51ef33c1 | none |
| 2 | DiagnosticReport-update | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br><br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br><br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | study: ImagingStudy<br>id: 3478116342<br>study uid: 2.16.124.113543.6003.1154777499.30276.83661.3632298176<br><br>measurement: Observation<br>id: 435098234<br>code: Simple cyst<br>study ref: 8i7tbu6fby5ftfbku6fniuf<br><br>annotation: ImagingSelection<br>id: 18735123<br>markup: ... | none | efcac43a-ed38-49e4-8d79-73f78290292a | b9574cb0-e9e5-4be1-8957-5fcb51ef33c1 |
| 3 | DiagnosticReport-select | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br><br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br><br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | study: ImagingStudy<br>id: 3478116342<br>study uid: 2.16.124.113543.6003.1154777499.30276.83661.3632298176<br><br>measurement: Observation<br>id: 435098234<br>code: Simple cyst<br>study ref: 8i7tbu6fby5ftfbku6fniuf<br><br>annotation: ImagingSelection<br>id: 18735123<br>markup: ... | measurement: Observation<br>id: 435098234<br><br>annotation: ImagingSelection<br>id: 18735123 | ca3b44a1-d40e-44ae-99bb-434c10dfb535 |efcac43a-ed38-49e4-8d79-73f78290292a |
| 4 | DiagnosticReport-update | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br><br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br><br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | study: ImagingStudy<br>id: 3478116342<br>study uid: 2.16.124.113543.6003.1154777499.30276.83661.3632298176<br><br>measurement: Observation<br>id: 435098234<br>code: Simple cyst<br>study ref: 8i7tbu6fby5ftfbku6fniuf<br><br>annotation: ImagingSelection<br>id: 18735123<br>markup: ...<br><br>report: DiagnosticReport<br>id: 40012366<br>status: Final | measurement: Observation<br>id: 435098234<br><br>annotation: ImagingSelection<br>id: 18735123 | a7e1a89d-b082-481b-9107-b70ebfba6e95 | ca3b44a1-d40e-44ae-99bb-434c10dfb535 |
| 5 | DiagnosticReport-close | e62b4411-55f3-431a-94e8-ef4af537511c | none | none | none | none | none | 2685b00c-69b8-4e5d-bdd9-602f45a616a5 | a7e1a89d-b082-481b-9107-b70ebfba6e95 |
{: .grid}