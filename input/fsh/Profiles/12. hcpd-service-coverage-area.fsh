Invariant: inv-01-address-postalcode-4-digits
Description: "If present, postalCode shall be 4 digits"
Expression: "address.postalCode.matches('^[0-9]{4}$')"
Severity: #error

Profile: HCPD_Service_Coverage_Area
Parent: AUCoreLocation
Id: hcpd-service-coverage-area
Title: "HCPD Service Coverage Area"
Description: "This profile of Location represents an Australian geographic coverage area i.e. postcodes where this service is provided.
For a healthcare service, that is provided through a physical location but have eligibility restrictions applicable in terms of only residents for certain postcodes/suburbs can receive this service, then the details of coverage area and eligibility should be provided here."
* ^experimental = false
* ^status = #active
* . ^short = "Australian geographic area in which a service is available."

* obeys inv-01-address-postalcode-4-digits

* extension contains Suppressed named suppressed 0..1 MS
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding = $HCPD_ResponsiblePartyType_CS#organisation-initiated (exactly)
* extension[suppressed].extension[suppressedBy].valueCodeableConcept.coding 1..1 MS
* extension[suppressed] ^short = "Indicates if Location service is suppressed"
* extension[suppressed] ^definition = "Indicates if Location service is suppressed."
* extension[suppressed] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[suppressed] ^extension[=].extension[+].url = "code"
* extension[suppressed] ^extension[=].extension[=].valueCode = #SHALL:populate-if-known
* extension[suppressed] ^extension[=].extension[+].url = "actor"
* extension[suppressed] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/responder-actor-health-connect"
* extension[suppressed] ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/obligation"
* extension[suppressed] ^extension[=].extension[+].url = "code"
* extension[suppressed] ^extension[=].extension[=].valueCode = #SHOULD:handle
* extension[suppressed] ^extension[=].extension[+].url = "actor"
* extension[suppressed] ^extension[=].extension[=].valueCanonical = "http://digitalhealth.gov.au/fhir/hcpd/ActorDefinition/requester-actor-health-connect"

* address 1..1 MS
* address ^short = "The address that defines the coverage area where the service is available"

* address.city MS
* address.city ^short = "Australian city, town or suburb"
* address.city ^definition = "An Australian city, town or suburb where the service is available."

* address.state MS
* address.state ^short = "Australian state or territory"
* address.state ^definition = "An Australian state or territory where the service is available."
* address.state from $australian-states-territories-2 (required)

* address.postalCode MS

* address.country 1..1 MS
* address.country = "AU"
* address.country ^short = "Australia as a 2 digit ISO 3166 code"
* address.country ^definition = "The 2 digit ISO 3166 code for Australia (AU)."

* managingOrganization MS
* managingOrganization only Reference(HCPD_Organization)
