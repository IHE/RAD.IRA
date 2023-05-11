### 2:4.X8.1 Scope

This transaction is used to retrieve the current context for a given session and all associated contents in that context.

### 2:4.X8.2 Actors Roles

**Table 2:4.X8.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Subscriber | Requests current context and contents for an identified session | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
| Manager | Returns current context and contents | Hub |
{: .grid}

### 2:4.X8.3 Referenced Standards

**FHIRcast**: [Get Current Context](https://build.fhir.org/ig/HL7/fhircast-docs/2-9-GetCurrentContext.html)

### 2:4.X8.4 Messages

<div>
{%include rad-x8-seq.svg%}
</div>

<div style="clear: left"/>

**Figure 2:4.X8.4-1: Interaction Diagram**

#### 2:4.X8.4.1 Get Current Context Request Message
The Subscriber requests the current context and its contents for an identified session.

The Subscriber shall support sending such messages to more than one Manager. The Manager shall support handling such messages from more than one Subscriber. 

##### 2:4.X8.4.1.1 Trigger Events

The Subscriber uses this transaction when:
- It successfully subscribes to a session and wants to have the current context
- It determines that it has missed some events for the current context based on receiving an context event with an unexpected version
- It receives a `[FHIR resource]-close` event and wants to synchronize with the new current context, if any

##### 2:4.X8.4.1.2 Message Semantics

This message is a [Get Current Context Request](https://build.fhir.org/ig/HL7/fhircast-docs/2-9-GetCurrentContext.html#get-current-context-request). The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The topic in the request URL will identifies the session for which the current context and contents are being requested.

##### 2:4.X8.4.1.3 Expected Actions

The Manager shall validate if the `topic` specified in the request URL is a valid session.

The Manager shall retrieve the current context and all associated contents correspond to the `topic` in the request URL.

> Note: The current context is the anchor context with all associated contexts. For example, in a `DiagnosticReport-open` event, the current context includes `report`, `patient` and `study` contexts, in which `report` is the anchor context.

#### 2:4.X8.4.2 Get Current Context Response Message

The Manager returns the current context and all associated contents.

##### 2:4.X8.4.2.1 Trigger Events

The Manager receives the Get Current Context request.

##### 2:4.X8.4.2.2 Message Semantics

This message is a [Get Current Context Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-9-GetCurrentContext.html#get-current-context-response). The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

The Manager shall include the `content` key in the response. See [Content Sharing Support](https://build.fhir.org/ig/HL7/fhircast-docs/2-9-GetCurrentContext.html#content-sharing-support) for details.

##### 2:4.X8.4.2.3 Expected Actions

The Subscriber shall process the context as if it had received the `[FHIR resource]-open` event with the same context.

The Subscriber shall replace the set of known contents associated with the context with the resources in the `content` bundle according to its business logic. 

### 2:4.X8.5 Security Considerations

See [IRA Security Considerations](volume-1.html#1xx5-ira-security-considerations).

#### 2:4.X8.5.1 Security Audit Considerations

Managers that support the ATNA Profile shall audit this transaction.

This transaction corresponds to a Query Information ATNA Trigger Event.
