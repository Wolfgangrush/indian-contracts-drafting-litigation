---
name: lease-deed-draft
description: Draft a Lease Deed (Section 105 of the Transfer of Property Act 1882) or a Leave & License Agreement (Section 52 of the Indian Easements Act 1882) — the two routes for granting possession of immovable property without transferring title. The plugin distinguishes between the two — Lease creates an interest in immovable property and is compulsorily registrable under Section 17(1)(d) Registration Act 1908 if the term exceeds one year or reserves a yearly rent; Leave & License creates a personal permission to occupy and is not compulsorily registrable. Governed by TOPA + Registration Act 1908 + Indian Stamp Act 1899 + applicable State Stamp Act + applicable State Rent Control law (where the premises fall under rent-control). Auto-fires on "draft lease deed", "draft rent agreement", "draft leave and license", "draft commercial lease", "draft residential lease", and similar trigger phrases.
allowed-tools: Read, Write, Edit, Bash, Glob
---

# Lease Deed / Leave & License Draft Skill

Extends: `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`
Common rules: `${CLAUDE_PLUGIN_ROOT}/skills/_drafting_common/SKILL.md`

## Case-type metadata

```yaml
case_type_line: LEASE DEED | LEAVE AND LICENSE AGREEMENT
case_short_code: LEASE | LL
instrument_type: lease | leave_license              # per deal-facts; the Verifier flags misclassification
typical_parties_lease: Lessor + Lessee
typical_parties_ll: Licensor + Licensee
operative_clauses_lease:
  - "Demised Premises — full description with Schedule of Property"
  - "Term — fixed period (Section 105 TOPA)"
  - "Rent — monthly / quarterly / annual; escalation clause; deposit"
  - "Permitted Use — residential / commercial / industrial; restriction on change of use"
  - "Lessor's Covenants — quiet enjoyment, structural repairs, statutory dues"
  - "Lessee's Covenants — internal repairs, rent payment, no sub-letting without consent"
  - "Termination — by efflux of time + forfeiture for breach + Section 111 TOPA grounds"
  - "Renewal — option to renew with rent revision formula"
  - "Holding Over — Section 116 TOPA + statutory cesses on holding-over"
  - "Stamp + Registration — mandatory if term > 1 year or reserves yearly rent"
operative_clauses_ll:
  - "License to Occupy — personal permission, not an interest in property"
  - "License Period — fixed period (Maharashtra Rent Control Act 1999 caps Leave & License at 60 months in Maharashtra; check State specifics)"
  - "License Fee — monthly, deposit, escalation"
  - "Revocation — Licensor's right to revoke per Section 60 Easements Act"
  - "No Tenancy Right — explicit declaration that the Agreement does not create any tenancy / lease / sub-tenancy"
  - "Police Verification — Licensee's police verification (mandatory in many cities)"
  - "Stamp — Article 36 of the applicable State Stamp Act (Maharashtra: 0.25% of total license fees + deposit)"
mandatory_boilerplate:
  - dispute_resolution_arbitration
  - governing_law
  - notices
  - force_majeure
  - severability
  - entire_agreement
stamp_position_lease: "Article 36 (Lease) of the applicable State Stamp Act — ad valorem on average annual rent + premium, depending on lease period"
stamp_position_ll: "Article 36(L) (Leave & License) of the applicable State Stamp Act — 0.25% of total license fees + deposit, in Maharashtra"
registration_position_lease: "Compulsorily registrable if term > 1 year OR reserves yearly rent (Section 17(1)(d) Registration Act 1908)"
registration_position_ll: "In Maharashtra (since 2000 amendment): Leave & License > 11 months is compulsorily registrable under Section 55 of the Maharashtra Rent Control Act 1999. Other States: check specifics."
```

## Critical distinction — Lease vs Leave & License

The two are NOT interchangeable. A Lease creates an interest in immovable property (the Lessee can sub-let, transfer, and enforce against third parties); a Leave & License creates only a personal permission (the Licensee cannot sub-let, the permission is revocable). The Verifier flags any Lease Deed that uses Leave & License indicia (or vice versa). Cost-of-registration is materially different (Lease attracts higher stamp + registration; Leave & License is cheaper) — choose deliberately, not by accident.

## Rent control overlay

If the premises fall under the applicable State Rent Control law (Maharashtra Rent Control Act 1999 / Karnataka Rent Act / Tamil Nadu Buildings (Lease and Rent Control) Act / Delhi Rent Control Act / etc.), additional restrictions apply on rent fixation, eviction grounds, and tenancy succession. The Drafter inserts a State-rent-control-overlay clause where the case-facts indicate the premises are rent-controlled.
