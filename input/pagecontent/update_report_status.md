### Event-name: DiagnosticReport-update

### Trigger Event
When the user signed off the report.

### Examples

#### DiagnosticReport-update Request Example

The following example shows updating the report context with status FINAL.  The `context` holds the `id` and `versionId` of the diagnostic report as required in all  `DiagnosticReport-update` events.  The `Bundle` holds the update (PUT) of the report context.

```json
{
  "timestamp": "2019-09-10T15:03:45.988Z",
  "id": "304985234",
  "event": {
    "hub.topic": "e62b4411-55f3-431a-94e8-ef4af537511c",
    "hub.event": "DiagnosticReport-update",
    "context.versionId": "ca3b44a1-d40e-44ae-99bb-434c10dfb535",
    "context": [
      {
        "key": "report",
        "resource": {
          "resourceType": "DiagnosticReport",
          "id": "40012366"
        }
      },
      {
        "key": "updates",
        "resource": {
          "resourceType": "Bundle",
          "id": "asdof9uklqwne09uadsfb",
          "type": "transaction",
          "entry": [
            {
              "request": {
                "method": "PUT"
              },
              "resource": {
                "resourceType": "DiagnosticReport",
                "id": "40012366",
                "status": "final",
                ...
              }
            },
          ]
        }
      }
    ]
  }
}
```

#### DiagnosticReport-update Event Example

The HUB SHALL distribute a corresponding event to all applications currently subscribed to the topic. The Hub SHALL replace the `context.versionId` in the request with a new `context.versionId` generated and retained by the Hub.  The prior version, `context.priorVersionId` of the context is also provided to ensure that an application is currently in sync with the latest context prior to applying the new changes.  If the value of `context.priorVersionId` is not in agreement with the `context.versionId` last received by an application, it is recommended that the application issue a GET request to the Hub in order to retrieve the latest version of the context (note that the GET request returns the context, all existing content, and its `context.versionId`).

```json
{
  "timestamp": "2019-09-10T15:03:45.988Z",
  "id": "304985234",
  "event": {
    "hub.topic": "e62b4411-55f3-431a-94e8-ef4af537511c",
    "hub.event": "DiagnosticReport-update",
    "context.versionId": "a7e1a89d-b082-481b-9107-b70ebfba6e95",
    "context.priorVersionId": "ca3b44a1-d40e-44ae-99bb-434c10dfb535",
    "context": [
      {
        "key": "report",
        "resource": {
          "resourceType": "DiagnosticReport",
          "id": "40012366"
        }
      },
      {
        "key": "updates",
        "resource": {
          "resourceType": "Bundle",
          "id": "asdof9uklqwne09uadsfb",
          "type": "transaction",
          "entry": [
            {
              "request": {
                "method": "PUT"
              },
              "resource": {
                "resourceType": "DiagnosticReport",
                "id": "40012366",
                "status": "final",
                ...
              }
            },
          ]
        }
      }
    ]
  }
}
```

### Available Context and Content in Hub

| Time Sequence | Event | Session ID | Current Context | Anchor Context | Contexts Present | Content | Content Selected | Version ID | Prior Version ID | 
|--|--|--|--|--|--|--|--|--|
| 1 | DiagnosticReport-open | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | none | none | b9574cb0-e9e5-4be1-8957-5fcb51ef33c1 | none |
| 2 | DiagnosticReport-update | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br><br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br><br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | study: ImagingStudy<br>id: 3478116342<br>study uid: 2.16.124.113543.6003.1154777499.30276.83661.3632298176<br><br>measurement: Observation<br>id: 435098234<br>code: Simple cyst<br>study ref: 8i7tbu6fby5ftfbku6fniuf<br><br>annotation: ImagingSelection<br>id: 18735123<br>markup: ... | none | efcac43a-ed38-49e4-8d79-73f78290292a | b9574cb0-e9e5-4be1-8957-5fcb51ef33c1 |
| 3 | DiagnosticReport-select | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br><br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br><br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | study: ImagingStudy<br>id: 3478116342<br>study uid: 2.16.124.113543.6003.1154777499.30276.83661.3632298176<br><br>measurement: Observation<br>id: 435098234<br>code: Simple cyst<br>study ref: 8i7tbu6fby5ftfbku6fniuf<br><br>annotation: ImagingSelection<br>id: 18735123<br>markup: ... | measurement: Observation<br>id: 435098234<br><br>annotation: ImagingSelection<br>id: 18735123 | ca3b44a1-d40e-44ae-99bb-434c10dfb535 |efcac43a-ed38-49e4-8d79-73f78290292a |
| 4 | DiagnosticReport-update | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br><br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br><br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | study: ImagingStudy<br>id: 3478116342<br>study uid: 2.16.124.113543.6003.1154777499.30276.83661.3632298176<br><br>measurement: Observation<br>id: 435098234<br>code: Simple cyst<br>study ref: 8i7tbu6fby5ftfbku6fniuf<br><br>annotation: ImagingSelection<br>id: 18735123<br>markup: ...<br><br>report: DiagnosticReport<br>id: 40012366<br>status: Final | measurement: Observation<br>id: 435098234<br><br>annotation: ImagingSelection<br>id: 18735123 | a7e1a89d-b082-481b-9107-b70ebfba6e95 | ca3b44a1-d40e-44ae-99bb-434c10dfb535 |
{: .grid}