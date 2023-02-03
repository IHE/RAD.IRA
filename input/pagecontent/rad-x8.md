### 2:3.X8.1 Scope

This transaction is used to terminate a report context that all synchronizing applications will close their respective context.

### 2:3.X8.2 Actors Roles

**Table 2:3.X8.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Requester | Retrieves current context | Subscriber |
| Manager | Returns current context | Hub |
{: .grid}

### 2:3.X8.3 Referenced Standards

**FHIRcast**: [Get Current Context](https://build.fhir.org/ig/HL7/fhircast-docs/2-9-GetCurrentContext.html)

### 2:3.X8.4 Messages

<div>
{%include rad-x8-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:3.X8.4-1: Interaction Diagram**

#### 2:3.X8.4.1 Get Current Context Request Message
The Sender retrieves the current context available in the Manager. The Sender shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Sender. 

##### 2:3.X8.4.1.1 Trigger Events

The Sender successfully subscribed to a topic and wanted to retrieve the current context.

The Sender detected that it missed some events according to the most recent event received and wanted to retrieve the current context. 

##### 2:3.X8.4.1.2 Message Semantics

This message is an HTTP GET request. The Sender is the User Agent. The Manager is the Origin Server.

The Sender shall send a HTTP GET request to the url `hub.url`/`topic`.

##### 2:3.X8.4.1.3 Expected Actions

The Manager shall retrieve the current context and all associated contents associated to the `topic` in the request URL.

#### 2:3.X8.4.2 Get Current Context Response Message

##### 2:3.X8.4.2.1 Trigger Events

The Manager retrieved the current context and all associated contents.

##### 2:3.X8.4.2.2 Message Semantics

The Manager shall prepare the response according to [Get Current Context Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-9-GetCurrentContext.html#get-current-context-response).

The Manager shall support content sharing and include all current content in the response.

##### 2:3.X8.4.2.3 Expected Actions

The Requester shall process the context `report`, `patient` and `study` as if it receives the `DiagnosticReport-open` event in Initiate Report Context [RAD-X3](rad-x3.html) transaction.

The Requester shall process the resources in the `content` bundle as if it receives the `DiagnosticReport-update` event in Update Report Content [RAD-X5](rad-x5.html) transaction.

If `context.type` is empty and `context` is an empty array, then the Requester has no further action.

If the Requester failed to process the query response from the Manager, then it shall send a `syncerror` event back to the Manager using Send SyncError Event [RAD-X10](rad-10.html)

### 2:3.X8.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X8.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
