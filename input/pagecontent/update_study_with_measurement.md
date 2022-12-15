### Event-name: DiagnosticReport-update

### Trigger Event
When a subscriber completed something that it decided it is ready to share with other subscribers.

e.g. Finished analysis on a set of images and produced a set of detected nodules and the fleischner score.

### Examples

#### DiagnosticReport-update Request Example

The following example shows adding an imaging study to the existing diagnostic report context and a new observation.  The `context` holds the `id` and `versionId` of the diagnostic report as required in all  `DiagnosticReport-update` events.  The `Bundle` holds the addition (POST) of an imaging study and adds (POST) an observation derived from this study.

```json
{
  "timestamp": "2019-09-10T14:58:45.988Z",
  "id": "0d4c7776",
  "event": {
    "hub.topic": "e62b4411-55f3-431a-94e8-ef4af537511c",
    "hub.event": "DiagnosticReport-update",
    "context.versionId": "b9574cb0-e9e5-4be1-8957-5fcb51ef33c1",
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
          "id": "8i7tbu6fby5fuuey7133eh",
          "type": "transaction",
          "entry": [
            {
              "request": {
                "method": "POST"
              },
              "resource": {
                "resourceType": "ImagingStudy",
                "description": "CHEST XRAY",
                "started": "2010-02-14T01:10:00.000Z",
                "id": "3478116342",
                "identifier": [
                  {
                    "type": {
                      "coding": [
                        {
                          "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                          "code": "ACSN"
                        }
                      ]
                    },
                    "value": "3478116342"
                  },
                  {
                    "system": "urn:dicom:uid",
                    "value": "urn:oid:2.16.124.113543.6003.1154777499.30276.83661.3632298176"
                  }
                ]
              }
            },
            {
              "request": {
                "method": "POST"
              },
              "resource": {
                "resourceType": "Observation",
                "id": "435098234",
                "partOf": {
                  "reference": "ImagingStudy/8i7tbu6fby5ftfbku6fniuf"
                },
                "status": "preliminary",
                "category": {
                  "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                  "code": "imaging",
                  "display": "Imaging"
                },
                "code": {
                  "coding": [
                    {
                      "system": "http://www.radlex.org",
                      "code": "RID49690",
                      "display": "simple cyst"
                    }
                  ] 
                },
                "issued": "2020-09-07T15:02:03.651Z"
              }
            },
            {
              "request": {
                "method": "POST"
              },
              "resource": {
                "resourceType": "ImagingSelection",
                "id": "18735123",
                ...
              }
            }
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
  "timestamp": "2019-09-10T14:58:45.988Z",
  "id": "0d4c7776",
  "event": {
    "hub.topic": "e62b4411-55f3-431a-94e8-ef4af537511c",
    "hub.event": "DiagnosticReport-update",
    "context.versionId": "efcac43a-ed38-49e4-8d79-73f78290292a",
    "context.priorVersionId": "b9574cb0-e9e5-4be1-8957-5fcb51ef33c1",
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
          "id": "8i7tbu6fby5fuuey7133eh",
          "type": "transaction",
          "entry": [
            {
              "request": {
                "method": "POST"
              },
              "resource": {
                "resourceType": "ImagingStudy",
                "description": "CHEST XRAY",
                "started": "2010-02-14T01:10:00.000Z",
                "id": "3478116342",
                "identifier": [
                  {
                    "type": {
                      "coding": [
                        {
                          "system": "http://terminology.hl7.org/CodeSystem/v2-0203",
                          "code": "ACSN"
                        }
                      ]
                    },
                    "value": "3478116342"
                  },
                  {
                    "system": "urn:dicom:uid",
                    "value": "urn:oid:2.16.124.113543.6003.1154777499.30276.83661.3632298176"
                  }
                ]
              }
            },
            {
              "request": {
                "method": "POST"
              },
              "resource": {
                "resourceType": "Observation",
                "id": "435098234",
                "partOf": {
                  "reference": "ImagingStudy/8i7tbu6fby5ftfbku6fniuf"
                },
                "status": "preliminary",
                "category": {
                  "system": "http://terminology.hl7.org/CodeSystem/observation-category",
                  "code": "imaging",
                  "display": "Imaging"
                },
                "code": {
                  "coding": [
                    {
                      "system": "http://www.radlex.org",
                      "code": "RID49690",
                      "display": "simple cyst"
                    }
                  ] 
                },
                "issued": "2020-09-07T15:02:03.651Z"
              }
            },
            {
              "request": {
                "method": "POST"
              },
              "resource": {
                "resourceType": "ImagingSelection",
                "id": "18735123",
                ...
              }
            }
          ]
        }
      }
    ]
  }
}
```

### Available Context and Content in Hub

| Event | Session ID | Current Context | Anchor Context | Contexts Present | Content | Content Selected | Version ID | Prior Version ID | 
|--|--|--|--|--|--|--|--|--|
| DiagnosticReport-open | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | none | none | b9574cb0-e9e5-4be1-8957-5fcb51ef33c1 | none |
| DiagnosticReport-update | e62b4411-55f3-431a-94e8-ef4af537511c | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366 | report: DiagnosticReport<br>id: 40012366<br><br>patient: Patient<br>id: ewUbXT9RWEbSj5wPEdgRaBw3<br>mrn: 185444<br><br>study: ImagingStudy<br>id: 8i7tbu6fby5ftfbku6fniuf<br>study uid: 2.16.124.113543.6003.1154777499.38476.11982.4847614254<br>accnum: 342123458 | study: ImagingStudy<br>id: 3478116342<br>study uid: 2.16.124.113543.6003.1154777499.30276.83661.3632298176<br><br>measurement: Observation<br>id: 435098234<br>code: Simple cyst<br>study ref: 8i7tbu6fby5ftfbku6fniuf<br><br>annotation: ImagingSelection<br>id: 18735123<br>markup: ... | none | efcac43a-ed38-49e4-8d79-73f78290292a | b9574cb0-e9e5-4be1-8957-5fcb51ef33c1 |
{: .grid}