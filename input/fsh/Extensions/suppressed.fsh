Extension: Suppressed
Id: suppressed
Title: "Suppression Indicator for Visibility"
Context: PractitionerRole, Organization, Practitioner, HealthcareService, Location, Endpoint
Description: "Indicates whether the parent resource should be hidden from display in the Provider Directory. Contains coded information about the actor who initiated the suppression and optional control flags."
* ^url = "http://digitalhealth.gov.au/fhir/cc/StructureDefinition/suppressed"
* ^status = #active
* ^experimental = false
* ^purpose = "This extension addresses the business requirement to control visibility of provider directory entries, enabling management of which practitioner roles, organizations, healthcare services, locations, or endpoints should be hidden from public directory searches while maintaining data in the system."
* . ^short = "Hide Resource in Directory"
* . ^definition = "When present, indicates that the parent resource is suppressed. Contains information about who initiated the suppression and optional control flags for suppression behavior."
* . 0..1
* extension contains
    suppressedBy 1..1 MS
* extension[suppressedBy] ^short = "Who initiated the suppression"
* extension[suppressedBy] ^definition = "Identifies the actor who initiated the suppression request (e.g., practitioner, organisation)."
* extension[suppressedBy].value[x] only CodeableConcept
* extension[suppressedBy].valueCodeableConcept 1..1 MS
* extension[suppressedBy].valueCodeableConcept.coding 1..2
* extension[suppressedBy].valueCodeableConcept.coding from $HCPD_ResponsiblePartyType_VS (required)