---
name: commercial-service-agreement-draft
description: Draft a Master Service Agreement (MSA) / Statement of Work (SoW) / Service Agreement for the provision of services by one party to another. Covers the universe of services contracts — IT services, consulting, professional services, BPO / KPO, managed services, SaaS-as-a-service, content services, marketing, advertising. Governed by the Indian Contract Act 1872 + Sale of Goods Act 1930 (where services include deliverable goods) + DPDP Act 2023 (where services involve personal-data processing) + IT Act 2000 (for IT services + e-signature execution). Auto-fires on "draft MSA", "draft service agreement", "draft SoW", "draft consulting agreement", and similar trigger phrases.
allowed-tools: Read, Write, Edit, Bash, Glob
---

# Commercial Service Agreement Draft Skill

Extends: `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`
Common rules: `${CLAUDE_PLUGIN_ROOT}/skills/_drafting_common/SKILL.md`

## Case-type metadata

```yaml
case_type_line: MASTER SERVICE AGREEMENT
case_short_code: MSA
typical_parties: Service Provider + Customer
operative_clauses:
  - "Scope of Services (per attached SoW(s))"
  - "Service Levels (KPIs, SLAs, service credits)"
  - "Fees and Payment (fixed-fee / time-and-materials / hybrid; invoicing cycle; GST; TDS; late-payment interest)"
  - "Service Standards (industry-standard / specified) + acceptance procedure"
  - "Personnel — key persons, replacement procedure, background checks"
  - "Subcontracting — permitted / prior consent, back-to-back obligations"
  - "Intellectual Property — Background IP retained, Foreground IP allocation (work-for-hire vs licence), derivative works, moral-rights waiver per Section 57 Copyright Act 1957"
  - "Data Protection — DPDP Act 2023 flowdown (notice / consent / purpose-limitation / security / breach / sub-processor)"
  - "Audit Rights — Customer audit rights, scope, frequency, cost-bearing"
  - "Insurance — professional indemnity, public liability, cyber insurance for IT/data services"
  - "Change Control — RFC procedure, impact assessment, pricing adjustment"
mandatory_boilerplate:
  - indemnity (IP + DPDP + statutory)
  - limitation_of_liability (cap with carve-outs)
  - confidentiality
  - dispute_resolution_arbitration
  - governing_law
  - notices
  - force_majeure
  - severability
  - entire_agreement
  - assignment_with_consent
  - waiver
  - counterparts
  - amendments_in_writing
stamp_position: "Article 5 (Agreement) of the applicable State Stamp Act — typically ₹100-500"
registration_position: "Not compulsorily registrable"
dpdp_position: "Likely triggered — verify in deal-facts"
```

## Forward load

- IT services + cross-border data flow → DPDP Section 16 transfer-of-personal-data clause + the recipient jurisdiction's data-protection law check.
- SaaS subscription nature → consider separate SaaS Subscription Agreement skill in future versions (different model: subscription + service levels + termination differs from standard MSA).
- ESOP / equity-linked compensation → not in this skill; route to `shareholders-agreement-draft`.
