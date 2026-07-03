Instance: suppressed-organization
InstanceOf: SearchParameter
Usage: #definition
Title: "Suppressed Search Parameter (Organization)"
Description: "Search suppressed Organization resources using the Suppressed extension."
* url = "http://digitalhealth.gov.au/fhir/hcpd/SearchParameter/suppressed-organization"
* name = "SearchParameterSuppressedOrganization"
* status = #active
* experimental = false
* code = #suppressed
* base[0] = #Organization
* type = #token
* expression = "Organization.extension.where(url='http://digitalhealth.gov.au/fhir/cc/StructureDefinition/suppressed').extension.where(url='includeSelf').value.where($this=true)"
* target[0] = #Organization
