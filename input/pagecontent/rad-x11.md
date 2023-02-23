### 2:3.X11.1 Scope

This transaction is used to send error notifications when a Subscriber initially accepted an event and later failed to process it.

### 2:3.X11.2 Actors Roles

**Table 2:3.X11.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Subscriber | Sends error notifications | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
| Manager | Accepts and processes notification | Hub |
{: .grid}

### 2:3.X11.3 Referenced Standards

**FHIRcast**: [Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change)

**FHIRcast**: [Sync error Event](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html)

### 2:3.X11.4 Messages

<div>
{%include rad-x11-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X11.4-1: Interaction Diagram**

#### 2:3.X11.4.1 Notify Error Message

The Subscriber sends an error event to the Manager indicating that it failed to process a notification. The Subscriber shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Subscriber. 

##### 2:3.X11.4.1.1 Trigger Events

The Subscriber failed to successfully process an context event that the Subscriber initially accepted and responded with `202` Accepted.

##### 2:3.X11.4.1.2 Message Semantics

This message is a [FHIRcast Request Context Change](https://build.fhir.org/ig/HL7/fhircast-docs/2-6-RequestContextChange.html#request-context-change-body) request. The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The `event.context` shall conform to [SyncError Context](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html#context).

Per FHIRcast, the `issue[0].severity` of the `operationoutcome` context will be set to `warning`.

If the Subscriber retries the same request due to a timeout, then the Subscriber shall use the same `event.id` so the Manager can detect that it is a duplicate message.

If the Subscriber retries the same request due to an error response from the Manager, then the Subscriber shall assign a new `event.id` to indicate that it is a new message.

##### 2:3.X11.4.1.3 Expected Actions

The Manager shall validate the request as follow:

TODO: types of errors for each check, and use the table format

* If `timestamp`, `id` or `event` are not set, then return an error
* If `event.context` does not include `operationoutcome`, then return an error
* If the context does not conform to the [SyncError Context](https://build.fhir.org/ig/HL7/fhircast-docs/3-2-1-syncerror.html#context), then return an error
* if `event`.`hub.topic` is not a known session, then return an error

#### 2:3.X11.4.2 Notify Error Response Message

##### 2:3.X11.4.2.1 Trigger Events

The Manager finished processing the Notify Error request.

##### 2:3.X11.4.2.2 Message Semantics

This message is a [FHIRcast Request Context Change]() response. The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X11.4.2.3 Expected Actions

If the response is an error, then the Subscriber may consider retrying the request.

### 2:3.X11.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X11.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
