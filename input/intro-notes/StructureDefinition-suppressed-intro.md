## Usage notes 
This extension is used to convey whether the parent resource should be hidden from display in the Provider Directory. It carries coded information about the actor who initiated the suppression.

### Datatype and context
The Suppressed extension is a complex extension that contains information about suppression behavior. It includes a required `suppressedBy` sub-extension (CodeableConcept) that indicates who initiated the suppression requestThe coded values are drawn from the [Responsible Party Type CodeSystem](CodeSystem-responsible-party-type.html).

This extension is profiled on the following HCPD resources: Organization, Practitioner, PractitionerRole, HealthcareService, Location, and Endpoint.
- Being an optional cardinality, when absent the resource is visible in Provider Directory listings
- When present, it indicates the resource is suppressed and identifies who initiated the suppression

### Suppression scenarios
This extension enables several suppression patterns:

1. **Practitioner self-suppression**:
   - Practitioner with Suppressed extension (practitioner-initiated) automatically hides themselves and cascades to suppress all their roles
   
2. **Organization suppression**:
   - Organization with Suppressed extension (organisation-initiated) triggers cascade suppression to all child resources
   
3. **PractitionerRole specific suppression**:
   - PractitionerRole with Suppressed extension is hidden without affecting the Practitioner profile
   - Can be initiated by either practitioner-initiated or organisation-initiated codes

### Processing and client obligations
- The default state of this extension, being optional, is that it is not present on a profile and that resource is visible.
- When present, the Suppressed extension indicates the resource should be suppressed from Provider Directory listings.
- Suppressed resources are included in API responses when querying for inactive or all resources; they will be returned alongside active resources rather than being excluded at the API level.
- Implementers **SHALL** check each returned resource for the presence of the Suppressed extension and **SHALL NOT** present those resources to end users of the Health Connect Provider Directory.

### Hierarchical suppression model
The HCPD Provider Directory operates on a hierarchical model where certain resources are considered children of others. This hierarchy determines the cascading behavior of suppression and which initiator codes are permitted on each resource type.

**Suppression cascade:**
- **Organization** (parent) → HealthcareService, Location, PractitionerRole, Endpoint (children)
  - When the Suppressed extension is present on an Organization, suppression automatically cascades to its child HealthcareService, Location, PractitionerRole, and Endpoint resources

The coded values in Suppressed indicate who has the authority to suppress a resource, with some resources having competing authorities due to their position in the hierarchy.

| Resource Type | organisation-initiated | practitioner-initiated |
|---|:---:|:---:|
| Organization | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> |
| HealthcareService | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> |
| Location | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> |
| Endpoint | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #FFB6C1">✗</span> |
| PractitionerRole | <span style="background-color: #90EE90">✓</span> | <span style="background-color: #90EE90">✓</span> |
| Practitioner | <span style="background-color: #FFB6C1">✗</span> | <span style="background-color: #90EE90">✓</span> |