<div markdown="1" class="stu-note">

This Test Plan page is a prototype. We expect the maturity of the content will improve over time. For now, we summarize high level testing scope and available tools. Comments are welcome.
</div>

## Introduction

Overall test plan leverages the profiles and Examples shown on the [Artifacts Summary](artifacts.html). The [Profiles](artifacts.html#structures-resource-profiles) listed are describing the constraints that would be adhered to by actors claiming conformance to this implementation guide. Thus any applicable Resources that are known to have been published by an app or server MUST be conformant to these profiles as appropriate.

The Examples listed in [Example](example.html) are example events. They are conformant to the profiles.

> Note: This section will be filled in as the IHE-Connectathon need drives the creation of the test plans, test procedures, test tools, and reporting.

### Unit Test Procedure

Unit Tests in this context is where a SUT is tested against a simulator or validator.  A simulator is a implementation of an actor that is designed specifically to test the opposite pair actor. The simulator might be a reference implementation or may be a specially designed test-bench. Where a reference implementation is used the negative tests are harder to simulate. A validator is a implementation that can check conformance. A validator may be a simulator, but may also be a standalone tool used to validate only a message encoding. Some reference implementations may be able to validate to a StructureDefinition profile, but often these do not include sufficient constraints given the overall actor conformance criteria. 

### Integration Test Procedure

Integration Tests in this context is where two SUT of paired actors test against each other. In this case the subset of tests that can be tested is the intersection. Testing only this intersection is necessary but not sufficient. The testing must also include the capability of the client to exercise the test scenarios that this SUT can test, to determine that failure-modes are handled properly by both SUT.


