---
name: shareholders-agreement-draft
description: Draft a Shareholders Agreement (SHA) — the contract among shareholders of a private limited company governing their inter-se rights, board composition, reserved matters, transfer restrictions, exit mechanisms, anti-dilution, drag and tag, and conversion / liquidation preferences. Governed by the Companies Act 2013 (Section 6 read with Section 58(2) on enforceability of transfer restrictions in private companies + Articles of Association alignment per Sections 5 and 14) + the Indian Contract Act 1872. Common in early-stage / Series-A / Series-B funding rounds (investor + founder + ESOP structure). The Verifier checks alignment with the company's Articles of Association — clauses in the SHA that conflict with the AoA may be unenforceable; common practice is to amend the AoA to mirror critical SHA clauses (Vodafone v. Bhutoria, IL&FS v. Hubtown line of cases). Auto-fires on "draft SHA", "draft shareholders agreement", "draft term sheet", "draft investment agreement", "draft Series A documentation", and similar trigger phrases.
allowed-tools: Read, Write, Edit, Bash, Glob
---

# Shareholders Agreement Draft Skill

Extends: `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`
Common rules: `${CLAUDE_PLUGIN_ROOT}/skills/_drafting_common/SKILL.md`

## Case-type metadata

```yaml
case_type_line: SHAREHOLDERS AGREEMENT
case_short_code: SHA
typical_parties: Investor(s) + Founder(s) + Company + (optionally) ESOP Trust
operative_clauses:
  - "Capital Structure and Investment — equity / CCPS / CCD / SAFE; valuation; pre-money / post-money; investment amount; tranches"
  - "Board Composition — total directors, investor director nomination right, founder directors, independent director, observer rights"
  - "Quorum and Meetings — board, shareholder; threshold for quorum; voting"
  - "Reserved Matters (Affirmative Vote Matters) — list of matters requiring investor affirmative consent (typically 15-25 items: issue of new shares, change in AoA, M&A, indebtedness above threshold, related-party transactions, IPO, change of business, key-personnel hiring, key-personnel termination, change of statutory auditors, change of business plan, etc.)"
  - "Transfer Restrictions — Right of First Refusal (ROFR) / Right of First Offer (ROFO) / pre-emption rights; permitted transfers (affiliate transfers, estate planning); lock-in for Founders"
  - "Tag Along — Investor's right to participate in Founders' sale to a third party, pro rata"
  - "Drag Along — Investor's right to drag Founders into a sale upon majority approval (typically threshold of 51% / 75% of shares held by drag-initiators)"
  - "Anti-Dilution Protection — broad-based / narrow-based / full ratchet (typically broad-based weighted average for Series A)"
  - "Liquidation Preference — 1x / 2x non-participating / participating (Indian-market default: 1x non-participating)"
  - "Conversion — CCPS to Equity Shares; conversion ratio; conversion triggers (IPO, liquidation event, voluntary conversion)"
  - "Information Rights — monthly / quarterly / annual financials; budget; KPI dashboards"
  - "Exit Mechanisms — IPO (commitment + timeline + cooperation), strategic sale, secondary sale, buyback (Section 68 Companies Act 2013), put options (subject to FEMA + RBI master directions for non-resident investors)"
  - "Founder Reverse Vesting + Lock-in — typical 4-year vesting with 1-year cliff for re-vesting on departure for cause"
  - "Non-Compete and Non-Solicit — during tenure + 24 months post-departure; Section 27 ICA caveat — post-departure non-compete is void; non-solicit reasonably enforceable"
  - "Conflict between SHA and AoA — SHA prevails inter se the Parties; the Company shall procure that the AoA is amended to mirror the SHA's key terms"
mandatory_boilerplate:
  - dispute_resolution_arbitration         # almost universally arbitration; seat typically Singapore / Mumbai / Delhi
  - governing_law                          # Indian law for Indian-parties-only; often Singapore law + SIAC for foreign-investor deals (PASL Wind Solutions discipline)
  - notices
  - severability
  - entire_agreement
  - amendments_only_in_writing_and_with_supermajority_consent
stamp_position: "Article 5 (Agreement) of the applicable State Stamp Act — typically ₹100-500. NOTE: separate Share Subscription Agreement, Share Purchase Agreement, and any pledge of shares attract their own stamp duty (Article 23 / Article 5)."
registration_position: "Not compulsorily registrable. However, certain transfer restrictions are enforceable in private companies only if mirrored in AoA (Section 58(2) Companies Act 2013)."
```

## AoA alignment imperative

A common drafting failure is to embed transfer restrictions / reserved matters in the SHA but not amend the AoA. Result: SHA clauses are enforceable inter se the Parties but not against the Company or a transferee. The Drafter inserts an express clause requiring the Company to file an amended AoA simultaneously, and the Verifier flags any clause that creates a Company-side obligation without corresponding AoA amendment.

## FEMA + RBI overlay for non-resident investors

Where the Investor is non-resident:

- Foreign Direct Investment under FEMA 1999 + Foreign Exchange Management (Non-Debt Instruments) Rules 2019 — sector caps, government-approval route triggers, pricing guidelines
- Put options and exit clauses must comply with RBI's pricing guidelines for exit (fair value methodology, no assured return)
- Reporting — FC-GPR within 30 days of share allotment

The Drafter flags non-resident investments and inserts the FEMA-compliant exit mechanism + reporting reference.
