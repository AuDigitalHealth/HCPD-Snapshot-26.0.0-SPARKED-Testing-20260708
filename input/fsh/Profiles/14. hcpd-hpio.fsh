Profile: HCPD_HPIO_Identifier
Parent: $au-hpio
Id: hcpd-hpio
Title: "HCPD Healthcare Provider Identifier - Organisation (HCPD HPI-O)"
Description: "This identifier profile extends the AU HPI-O profile to include an organization classification extension to indicate whether the organization is a 'seed' or 'network' type."
* ^experimental = false
* ^status = #active

* extension contains
    HI_Service_Organisation_Classification named hi-org-classification 1..1 MS
* extension[hi-org-classification] ^short = "Organization classification"
* extension[hi-org-classification] ^definition = "Organization classification for HPI-O identifiers - can be 'seed' or 'network'."