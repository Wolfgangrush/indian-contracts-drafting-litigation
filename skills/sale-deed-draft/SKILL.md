---
name: sale-deed-draft
description: Draft a Sale Deed of immovable property under Section 54 of the Transfer of Property Act 1882. Compulsorily registrable under Section 17(1)(b) of the Registration Act 1908 + Section 54 TOPA (read with Section 53A TOPA for agreement-to-sell). Attracts ad valorem stamp duty under the applicable State Stamp Act (typically 5-7% of market value or consideration, whichever is higher). Post-Suraj Lamp v. State of Haryana (2012) discipline — Sale Deed alone (not GPA-Sale, not Will-with-GPA, not Agreement-to-Sell-with-Possession-and-GPA) is the only valid mode of transferring title to immovable property in India. Auto-fires on "draft sale deed", "draft conveyance deed", "draft sale of property", "draft immovable property sale", and similar trigger phrases.
allowed-tools: Read, Write, Edit, Bash, Glob
---

# Sale Deed Draft Skill

Extends: `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`
Common rules: `${CLAUDE_PLUGIN_ROOT}/skills/_drafting_common/SKILL.md`

## Case-type metadata

```yaml
case_type_line: SALE DEED
case_short_code: SALE
typical_parties: Vendor (Seller) + Vendee (Purchaser)
operative_clauses:
  - "Recitals — chain of title for the past N years (typically 30 years for clear title); means by which Vendor acquired (inheritance / partition / earlier purchase / allotment); encumbrances or absence thereof"
  - "Sale and Conveyance — Vendor sells, transfers, and conveys to Vendee all right, title, and interest in the Schedule Property"
  - "Consideration — full amount paid, receipt acknowledged"
  - "Schedule of Property — full description: extent, boundaries (East / West / North / South), surveys numbers, plot / khasra / khata / Patta numbers, all access ways, easements"
  - "Possession — handed over on the date of execution"
  - "Encumbrances — Vendor's warranty that the Property is free from all encumbrances, claims, demands, attachments, prior Agreements to Sell, mortgages, leases (or, if subsisting encumbrances, those are explicitly disclosed)"
  - "Title — Vendor warrants marketable title; standard title-warranty language; reference to title-search report"
  - "Documents Handed Over — chain-of-title documents, latest property tax receipts, electricity / water bills, NOC from society (where applicable), khata extract / mutation entry, encumbrance certificate"
  - "Statutory Compliances — Section 269UA Income Tax Act 1961 (transfer-pricing notification, where applicable) + Section 194-IA Income Tax Act 1961 (TDS @ 1% if consideration ≥ ₹50 lakh; Vendee deducts and remits)"
  - "Mutation — Vendor undertakes to assist in mutation in the records of the local revenue / municipal authorities"
  - "Witnesses — TWO witnesses to attest under Section 54 TOPA"
mandatory_boilerplate:
  - dispute_resolution_arbitration   # arbitration is enforceable for civil claims arising from the sale; Vidya Drolia
  - governing_law
  - notices
  - severability
  - entire_agreement
stamp_position: "Article 23 (Conveyance) of the applicable State Stamp Act — ad valorem on market value (Ready Reckoner) or consideration, whichever is higher. Typical range 5-7% + surcharge / cess. Concessional rates for women buyers, family transfers, agricultural land in some States."
registration_position: "COMPULSORILY REGISTRABLE under Section 17(1)(b) of the Registration Act 1908 read with Section 54 TOPA. Must be registered before the Sub-Registrar within the jurisdiction where the Property is situated, within 4 months of execution under Section 23 Registration Act 1908."
```

## Suraj Lamp discipline (non-negotiable)

The Verifier flags any draft that purports to effect transfer of title through:

- A GPA alone (whether General or Special)
- An Agreement-to-Sell combined with possession + GPA + Will + cash receipt — this so-called "SA/GPA/Will combination" was the practice the Supreme Court explicitly disapproved in *Suraj Lamp & Industries (P) Ltd. v. State of Haryana (2012) 1 SCC 656*
- Possession-based-conveyance without a registered Sale Deed

Only a properly stamped, properly registered Sale Deed transfers title under Indian law. The plugin refuses to draft any other instrument purporting to effect title transfer.

## Income Tax compliance flags

- Section 194-IA — TDS at 1% on consideration ≥ ₹50 lakh; Vendee deducts and remits to the credit of the Vendor
- Section 269ST — restriction on accepting ₹2 lakh or more in cash
- Section 50C — for the Vendor, capital gains computed on the higher of consideration or Ready Reckoner value
- Section 56(2)(x) — for the Vendee, if Ready Reckoner exceeds consideration by ≥ ₹50,000, the difference is taxable as income from other sources

The Drafter includes a Tax Compliance Note in the Sale Deed flagging the Vendee's TDS obligation.

## Title-search prerequisite

The plugin's Verifier flags any Sale Deed drafted without a title-search report in `deal-facts.md`. Title-search must cover at least 30 years of chain-of-title for marketable title; the Vendee's advocate should not allow draft to proceed without it.
