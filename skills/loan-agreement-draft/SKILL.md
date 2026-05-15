---
name: loan-agreement-draft
description: Draft a Loan Agreement (or Facility Agreement) between Lender and Borrower. Governed by the Indian Contract Act 1872 + the Negotiable Instruments Act 1881 (where a Demand Promissory Note accompanies) + RBI directions (where the Lender is a bank or NBFC) + the Insolvency and Bankruptcy Code 2016 (financial-creditor / operational-creditor classification) + the SARFAESI Act 2002 (where the loan is secured and the Lender is a secured creditor entitled to invoke SARFAESI) + the Indian Stamp Act 1899 (Article 6 — Agreement relating to deposit of title deeds, equitable mortgage; Article 40 — Mortgage Deed). Covers term loans, working capital, inter-corporate loans, friend-and-family loans, and lending to / from foreign parties (FEMA External Commercial Borrowing framework). Auto-fires on "draft loan agreement", "draft facility agreement", "draft promissory note", "draft loan contract", and similar trigger phrases.
allowed-tools: Read, Write, Edit, Bash, Glob
---

# Loan Agreement Draft Skill

Extends: `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`
Common rules: `${CLAUDE_PLUGIN_ROOT}/skills/_drafting_common/SKILL.md`

## Case-type metadata

```yaml
case_type_line: LOAN AGREEMENT
case_short_code: LOAN
typical_parties: Lender + Borrower (+ Guarantor optional)
operative_clauses:
  - "Loan Amount and Currency — INR / foreign currency (FEMA ECB compliance check)"
  - "Purpose of Loan — specific purpose; restriction on diversion"
  - "Disbursement — single tranche / multiple tranches; conditions precedent to disbursement"
  - "Interest Rate — fixed / floating; benchmark (MCLR / repo-linked / SOFR for foreign-currency); reset frequency; default interest"
  - "Repayment Schedule — EMI / bullet / balloon; tenor; prepayment terms"
  - "Security — unsecured / secured (mortgage / hypothecation / pledge of shares / corporate guarantee / personal guarantee); separate security documents to be executed"
  - "Representations and Warranties of Borrower — authority, no-conflict, no-default, no-pending-litigation, accurate financial statements, compliance with laws, no insolvency proceedings"
  - "Affirmative Covenants — financial reporting (monthly / quarterly), maintenance of financial covenants (D/E ratio, DSCR, current ratio), notification of material events"
  - "Negative Covenants — no further indebtedness above threshold, no change of business, no merger / acquisition / disposal without consent, no dividend / distribution above threshold during loan tenure, no related-party transactions above threshold"
  - "Events of Default — non-payment, breach of covenant, cross-default, insolvency event, material adverse change, change of control"
  - "Acceleration — Lender's right to declare entire loan due and payable"
  - "Late Payment Charges and Default Interest"
  - "Lender's Rights — set-off, retention, lien on Borrower's assets / accounts"
  - "Section 138 NI Act 1881 — Borrower's acknowledgement that any cheque issued in respect of repayment carries Section 138 liability on dishonour"
  - "IBC Trigger — Lender's right to initiate Corporate Insolvency Resolution Process under Section 7 IBC 2016 (for corporate debtor) / individual insolvency under Part III IBC (for natural person), on Event of Default"
mandatory_boilerplate:
  - dispute_resolution_arbitration   # arbitration carve-out: SARFAESI and IBC remedies are statutory and non-arbitrable (Vidya Drolia v. Durga Trading 2021)
  - governing_law
  - notices
  - severability
  - entire_agreement
  - assignment_lender_can_assign        # standard lender protection
stamp_position: "Article 5 (Agreement) of the applicable State Stamp Act for the Loan Agreement itself — typically ₹100-500. Separate stamping for any accompanying security documents: Mortgage Deed (Article 40, ad valorem), Demand Promissory Note (Article 49, varies by State), Deed of Hypothecation (Article 6 / 40, ad valorem in many States)."
registration_position: "Loan Agreement: NOT compulsorily registrable. Mortgage Deed: COMPULSORILY REGISTRABLE under Section 17(1)(b) Registration Act 1908 read with Section 59 TOPA (registered mortgage). Equitable mortgage by deposit of title deeds: NOT registrable under Section 59 TOPA proviso, but the underlying Memorandum recording the deposit attracts stamp duty under Article 6."
```

## FEMA External Commercial Borrowing (ECB) overlay

Where the Lender is non-resident and the Borrower is Indian (or vice versa with Indian Lender / non-resident Borrower):

- FEMA 1999 + Foreign Exchange Management (Borrowing or Lending) Regulations 2018 — ECB framework
- Sector-specific eligibility (eligible borrowers + recognised lenders + permitted end-uses)
- All-in-cost ceiling (currently SOFR + 500 bps for foreign-currency ECB, etc.)
- Average minimum maturity period (3 years for most ECB tranches)
- ECB-1 / ECB-2 reporting to RBI

The Drafter flags ECB applicability and inserts the FEMA-compliance covenant + reporting reference.

## Negotiable Instruments Act 1881 — Section 138

For Demand Promissory Notes / cheques issued by the Borrower:

- Section 138 NI Act — dishonour of cheque is a criminal offence (up to 2 years' imprisonment + fine of twice the cheque amount)
- Notice requirement — 30 days from dishonour
- Filing limit — 1 month from expiry of 15-day notice period for accused to pay

The Drafter inserts an express Section 138 acknowledgement clause where cheques form part of the security / repayment mechanism.

## SARFAESI and IBC routing

For secured loans by Banks / NBFCs (qualifying secured creditors under SARFAESI Section 13):

- SARFAESI Act 2002 — out-of-court enforcement of security interest on default (60-day notice + 30-day reply + possession + sale)
- IBC 2016 — Section 7 financial-creditor application for Corporate Insolvency Resolution Process on default of ≥ ₹1 crore (current threshold; verify against latest Section 4 notification)

The Drafter inserts SARFAESI rights and IBC trigger references for institutional Lenders.

## Section 27 ICA caveat

Restrictions on Borrower's business activities post-loan must be reasonable; an absolute prohibition on the Borrower's trade is void as restraint of trade. Loan-tenure-only restrictions tied to the Lender's commercial interest in repayment are enforceable.
