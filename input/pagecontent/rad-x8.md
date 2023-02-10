### 2:3.X8.1 Scope

This transaction is used to retrieve the current context in the reporting session.

### 2:3.X8.2 Actors Roles

**Table 2:3.X8.2-1: Actor Roles**

| Role | Description | Actor(s) |
|------|-------------|----------|
| Subscriber | Retrieves current context in a reporting session | Image Display<br>Report Creator<br>Worklist Client<br>Evidence Creator<br>Watcher |
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
The Subscriber retrieves the current context available in the Manager. The Subscriber shall support sending such messages to more than one Manager.

The Manager shall support handling such messages from more than one Subscriber. 

##### 2:3.X8.4.1.1 Trigger Events

The Subscriber uses this transaction when:
- It successfully subscribed to a session and wants to retrieve the current context
- It missed some events according to the most recent event received and wants to retrieve the current context
- It received a `[FHIRresource-close]` event and wants to see if there are any interrupted context that should be resumed

##### 2:3.X8.4.1.2 Message Semantics

This message is a [Get Current Context Request](https://build.fhir.org/ig/HL7/fhircast-docs/2-9-GetCurrentContext.html#get-current-context-request). The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X8.4.1.3 Expected Actions

The Manager shall validate if the `topic` specified in the request URL is a valid session.

The Manager shall retrieve the current context and all associated contents correspond to the `topic` in the request URL.

The Manager shall support content sharing and include the `content` key in the response. See [Content Sharing Support](https://build.fhir.org/ig/HL7/fhircast-docs/2-9-GetCurrentContext.html#content-sharing-support) for details.

#### 2:3.X8.4.2 Get Current Context Response Message

##### 2:3.X8.4.2.1 Trigger Events

The Manager retrieves the current context and all associated contents.

##### 2:3.X8.4.2.2 Message Semantics

This message is a [Get Current Context Response](https://build.fhir.org/ig/HL7/fhircast-docs/2-9-GetCurrentContext.html#get-current-context-response). The Subscriber is the FHIRcast Subscriber. The Manager is the FHIRcast Hub.

##### 2:3.X8.4.2.3 Expected Actions

The Subscriber shall process the context as if it receives the `[FHIRresource]-open` event with the same context.

The Subscriber shall process the resources in the `content` bundle as if it receives the `[FHIRresource]-update` event with the same content updates.

If the content update references a resource that does not exist and the Subscriber supports the resource, then the Subscriber shall create the resource with the current content as specified in the received event.

> Note: This is the case if the Subscriber missed a previous content update event in which the missing resource was added.

### 2:3.X8.5 Security Considerations

See [RTC-IMR Security Considerations](volume-1.html#1xx5-rtc-imr-security-considerations)

#### 2:3.X8.5.1 Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
