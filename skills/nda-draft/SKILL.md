---
name: nda-draft
description: Draft a Non-Disclosure Agreement (NDA) — mutual / one-way / multi-party. Governed by the Indian Contract Act 1872 (Sections 27 — restraint of trade — and 73 — damages for breach). Standard purposes — pre-contractual due diligence, supplier evaluation, M&A discussions, employment-stage information disclosure, joint-venture exploration. Auto-fires on "draft NDA", "draft non-disclosure", "draft confidentiality agreement", and similar trigger phrases.
allowed-tools: Read, Write, Edit, Bash, Glob
---

# NDA Draft Skill

Extends: `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`
Common rules: `${CLAUDE_PLUGIN_ROOT}/skills/_drafting_common/SKILL.md`

## Case-type metadata

```yaml
case_type_line: NON-DISCLOSURE AGREEMENT
case_short_code: NDA
nda_type: mutual | one_way                # per deal-facts
typical_parties: Discloser + Recipient (one-way) | Party-1 + Party-2 (mutual)
operative_clauses:
  - "Purpose of Disclosure — the specific transaction / evaluation / discussion"
  - "Definition of Confidential Information — written / oral / electronic / observed; marked or by-nature confidential"
  - "Exclusions — public domain, independently developed (with proof), lawfully received from third party without restriction, required by law (with notice obligation)"
  - "Permitted Use — only for the Purpose"
  - "Permitted Disclosees — employees, advisers, agents on a need-to-know basis with back-to-back NDAs"
  - "No IP Licence — disclosure does not transfer any IP rights"
  - "Term of Confidentiality — N years from disclosure (typically 3-5 years for general business; perpetual for trade secrets)"
  - "Return / Destruction on Termination — within 30 days, with certificate"
  - "Equitable Relief — injunction available without proof of damages; damages may be inadequate"
  - "No Solicitation (optional, where commercially negotiated) — no poaching of employees / customers during NDA term + N months thereafter"
mandatory_boilerplate:
  - dispute_resolution_arbitration
  - governing_law
  - notices
  - severability
  - entire_agreement
  - no_assignment_without_consent
stamp_position: "Article 5 (Agreement) — typically ₹100-500"
registration_position: "Not compulsorily registrable"
```

## Forward load

- DPDP Act 2023 — where the Confidential Information includes personal data, NDA must reference DPDP discipline (notice / lawful basis / security / breach-notification).
- Section 27 ICA — non-solicitation clauses are enforceable only to the extent reasonable; broad non-compete clauses are void.
- Independent-development carve-out — without this, recipient is vulnerable to claims even on genuinely independent work.
