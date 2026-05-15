---
name: gpa-spa-draft
description: Draft a Power of Attorney — General Power of Attorney (GPA) or Special Power of Attorney (SPA). Governed by the Powers of Attorney Act 1882 + the Indian Contract Act 1872 (agency provisions, Sections 182-238) + applicable State Stamp Act + Registration Act 1908. Post-Suraj Lamp v. State of Haryana (2012) discipline — a GPA / SPA CANNOT be used to effect transfer of title to immovable property. The instrument is limited to authorising the attorney to act on behalf of the principal (signing documents, representing before authorities, operating accounts, etc.). The plugin refuses any draft that purports to convey title via the GPA / SPA. Auto-fires on "draft GPA", "draft SPA", "draft power of attorney", "draft authority letter", and similar trigger phrases.
allowed-tools: Read, Write, Edit, Bash, Glob
---

# Power of Attorney Draft Skill

Extends: `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`
Common rules: `${CLAUDE_PLUGIN_ROOT}/skills/_drafting_common/SKILL.md`

## Case-type metadata

```yaml
case_type_line: GENERAL POWER OF ATTORNEY | SPECIAL POWER OF ATTORNEY
case_short_code: GPA | SPA
typical_parties: Principal (Donor) + Attorney (Donee)
operative_clauses:
  - "Identity of Principal and Attorney with full address / KYC particulars"
  - "Scope of Authority — GPA: general authority to act for the Principal in all matters of routine course OR a specified class; SPA: SPECIFIC, NARROWLY DEFINED authority for a specific act / matter / proceeding"
  - "Permitted Acts — explicit enumeration: signing documents / representing before specified authorities / operating bank accounts / appearing in court / receiving documents — NOT including transfer of title to immovable property"
  - "Express Suraj Lamp Caveat — the Principal expressly clarifies that this Power of Attorney does NOT authorise the Attorney to sell, mortgage, gift, or otherwise transfer title to any immovable property of the Principal; the limitation is recorded ex abundanti cautela in light of the Supreme Court's judgment in Suraj Lamp & Industries (P) Ltd. v. State of Haryana (2012) 1 SCC 656"
  - "Duration — definite period / until specific event / revocable at will (subject to Section 202 ICA — coupled-with-interest exception)"
  - "Sub-delegation — generally prohibited unless expressly permitted (Section 190 ICA)"
  - "Indemnity — Attorney indemnifies Principal for acts beyond authority"
  - "Revocation — manner and effect of revocation"
  - "Notarisation / Apostille — for use abroad / before specified authorities"
mandatory_boilerplate:
  - governing_law
  - notices
  - severability
  - entire_agreement
stamp_position: "Article 48 (Power of Attorney) of the applicable State Stamp Act. GPA: typically ₹500-1000 (nominal). SPA: similar. CAUTION: most amended State Stamp Acts now provide that a GPA executed for consideration AND with delivery of possession of immovable property attracts the SAME stamp duty as a Conveyance Deed (5-7% ad valorem) — to close the Suraj Lamp loophole at the stamp stage."
registration_position: "GPA / SPA — generally not compulsorily registrable. However: if the GPA is in respect of immovable property AND is to be used to act on behalf of the Principal in dealings with that property, registration is required in certain States. Always verify."
notarisation_requirement: "Notarisation strongly recommended; many authorities (Sub-Registrars, banks) require notarised GPA/SPA. For use abroad — apostille under the Hague Apostille Convention 1961 OR consular attestation, depending on country of use."
```

## Suraj Lamp discipline (non-negotiable)

The plugin's hard rule: a Power of Attorney CANNOT be used to:

- Effect title transfer to immovable property
- Substitute for a Sale Deed
- Substitute for a Gift Deed
- Substitute for a Mortgage Deed

Any draft that purports to do so is refused by the plugin. The Drafter writes an explicit Suraj Lamp caveat into every GPA / SPA, recording that the instrument is limited to authorisation of acts on behalf of the Principal and does NOT effect title transfer.

## Coupled-with-interest exception (Section 202 ICA)

A GPA / SPA "coupled with an interest" (where the Attorney has a financial interest in the subject-matter) is irrevocable until that interest is satisfied. Common scenarios: mortgagee's power of attorney over mortgaged property until mortgage is redeemed; secured-creditor's authority to sell pledged shares until loan is repaid. The Drafter handles this expressly where the deal-facts indicate a coupled-with-interest scenario.
