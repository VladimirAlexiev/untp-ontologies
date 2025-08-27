# UNTP Ontologies

The United Nations Transparency Protocol is an important initiative by UNECE/UNCEFACT to define DPPs and related ontologies. The currently available ontologies can be obtained from [https://test.uncefact.org/vocabulary/untp/home](https://test.uncefact.org/vocabulary/untp/home) by using content negotiation, eg
```
curl -Haccept:application/ld+json https://test.uncefact.org/vocabulary/untp/dpp/0/
```

It currently covers the following domains:
* core  
* dpp: [Digital Product Passport](https://spec-untp-fbb45f.opensource.unicc.org/docs/specification/DigitalProductPassport)  
* dcc: [Digital Conformity Credential](https://spec-untp-fbb45f.opensource.unicc.org/docs/specification/ConformityCredential)  
* dfr: [Digital Facility Record](https://spec-untp-fbb45f.opensource.unicc.org/docs/specification/DigitalFacilityRecord)  
* dte: [Digital Traceability Event](https://spec-untp-fbb45f.opensource.unicc.org/docs/specification/DigitalTraceabilityEvents): adaptation of GS1 Traceability Events from the EPCIS standard  
* dia: [Digital Identity Anchor](https://spec-untp-fbb45f.opensource.unicc.org/docs/specification/DigitalIdentityAnchor) 

More [specifications and schemas](https://spec-untp-fbb45f.opensource.unicc.org/docs/specification/#specifications) are in development, but are not yet available as ontologies: 
* [Sustainability Vocabulary Catalog](https://spec-untp-fbb45f.opensource.unicc.org/docs/specification/SustainabilityVocabularyCatalog): hierarchical taxonomies of sustainability indicators 
* [Identity Resolver](https://spec-untp-fbb45f.opensource.unicc.org/docs/specification/IdentityResolver): works with "dia", uses W3C Decentralized Identifiers (DID) for cryptographically strong identifiers
* [Decentralised Access Control](https://spec-untp-fbb45f.opensource.unicc.org/docs/specification/DecentralisedAccessControl) 
* [Verifiable Credentials Profile](https://spec-untp-fbb45f.opensource.unicc.org/docs/specification/VerifiableCredentials) : uses W3C Verifiable Credentials (VC) specifications for a layer of trust and cryptographic assurance of assertions

## Makefile

The attached `Makefile` does the following:
- Fetches the 6 ontologies indicated above as JSON-LD
- Converts them to Turtle using Jena `riot` and pretty-prints using `owl write`
- Finds duplicate terms (that is one of the issues discussed in the review)

## UNTP Ontologies Review

UNTP uses a "polyglot modeling" tool called [jargon.sh](http://jargon.sh), from which various technical schemas can be derived 
(see [Polyglot Modeling](https://github.com/json-ld/yaml-ld/issues/19) (Issue #19 in json-ld/yaml-ld) for a list of similar tools/frameworks). 
UNTP's first attention is to JSON schemas and JSON-LD contexts to enable the interpretation of JSON as semantic data. 
There are a few bugs in the ontologies, many of which can be fixed systematically by improvements to [jargon.sh](http://jargon.sh). 

Within the Cirpass2 project we [reviewed the UNTP ontologies](https://docs.google.com/document/d/1R3yqaYCO3JTpWsIckSzbumzyQgwRvd5X4Ewg-9Ax4yU/edit?tab=t.0).
After finalizing this document, we will post individual issues to https://opensource.unicc.org/un/unece/uncefact/spec-untp .

Authors
- Elio Hbeich, PhD student and ontologist, GS1 France
- Vladimir Alexiev, Chief data architect, Graphwise.ai, Sofia
- Robert David, Chief innovation officer, Graphwise.ai, Vienna
