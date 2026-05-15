---
name: arbitration-clause-draft
description: Draft a standalone Arbitration Agreement OR a robust Arbitration Clause for embedding in any commercial contract. Governed by the Arbitration and Conciliation Act 1996 (as substantially amended by the Acts of 2015, 2019, and 2021) + post-Vidya Drolia v. Durga Trading (2021) 2 SCC 1 + BALCO (Bharat Aluminium v. Kaiser Aluminium 2012) + PASL Wind Solutions v. GE Power (2021) discipline. Covers seat / venue distinction, institutional vs ad-hoc, number of arbitrators and appointment, governing law of the contract vs governing law of the arbitration agreement vs procedural law (lex arbitri), interim relief (Section 9 vs Emergency Arbitrator), language, costs, confidentiality of proceedings (Section 42A), and time-bound discipline (Section 29A). Auto-fires on "draft arbitration clause", "draft arbitration agreement", "embed arbitration clause", "draft dispute resolution clause", and similar trigger phrases.
allowed-tools: Read, Write, Edit, Bash, Glob
---

# Arbitration Clause / Agreement Draft Skill

Extends: `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`
Common rules: `${CLAUDE_PLUGIN_ROOT}/skills/_drafting_common/SKILL.md`

## Case-type metadata

```yaml
case_type_line: ARBITRATION AGREEMENT | ARBITRATION CLAUSE
case_short_code: ARB
context: standalone_agreement | embedded_clause
operative_clauses:
  - "Scope of Reference — 'all disputes arising out of or in connection with this Agreement, including any question regarding its existence, validity, or termination, shall be referred to arbitration'"
  - "Seat of Arbitration — explicit (e.g. 'The seat of arbitration shall be Mumbai'). The seat determines the lex arbitri (the procedural law of the arbitration) — this is the BALCO distinction"
  - "Venue (optional) — physical location of hearings; can be different from seat"
  - "Governing Law of the Contract — the substantive law applicable to the contract"
  - "Governing Law of the Arbitration Agreement — explicit choice (or implicit by reference to seat)"
  - "Institutional vs Ad-Hoc — MCIA Rules / ICA Rules / DIAC Rules / SIAC Rules / LCIA Rules / ICC Rules / ad-hoc under the Arbitration and Conciliation Act 1996"
  - "Number of Arbitrators — sole arbitrator OR three-arbitrator tribunal (each party appoints one, the two appoint a presiding arbitrator)"
  - "Appointment Mechanism — institutional (rules govern) OR ad-hoc (parties' mutual appointment within N days; failing which, Section 11 application to the High Court)"
  - "Qualifications of Arbitrators — independent and impartial; not employed by or related to either party; specific industry expertise (optional)"
  - "Language — 'The language of arbitration shall be English' (default)"
  - "Interim Relief — 'Notwithstanding the reference to arbitration, either Party may approach the courts at [seat] for interim relief under Section 9 of the Arbitration and Conciliation Act 1996. The Parties further consent to the appointment of an Emergency Arbitrator under the [Institutional Rules] for interim relief pending constitution of the tribunal.'"
  - "Time-bound Discipline — Section 29A requires award within 12 months from completion of pleadings (extendable by 6 months by parties' consent; further extension by court)"
  - "Costs — Section 31A — costs follow the event; tribunal's discretion"
  - "Confidentiality — Section 42A — proceedings, award, and material disclosed are confidential except as required for enforcement / public-domain exception"
  - "Carve-outs from Arbitration — SARFAESI Act remedies, IBC remedies, criminal proceedings, statutory writ jurisdiction, family-court matters — non-arbitrable per Vidya Drolia (2021)"
  - "Two Indian Parties + Foreign Seat — permissible post-PASL Wind Solutions v. GE Power (2021) 7 SCC 1; verify by seat choice"
mandatory_boilerplate:
  - severability
stamp_position: "Standalone Arbitration Agreement — Article 5 (Agreement) of the applicable State Stamp Act, typically ₹100-500. When embedded as a clause in a stamped contract, the clause is governed by the contract's stamping."
registration_position: "Not compulsorily registrable."
```

## BALCO seat-vs-venue distinction (non-negotiable)

The Bharat Aluminium v. Kaiser Aluminium (BALCO) (2012) 9 SCC 552 distinction:

- **Seat** — determines the legal/procedural framework of the arbitration; the supervisory court is the court at the seat; the law of the seat is the lex arbitri
- **Venue** — physical location of hearings; can be different from the seat

A clause that says *"arbitration shall be held at Mumbai"* without specifying seat creates ambiguity. The Drafter ALWAYS specifies the seat explicitly: *"The seat of arbitration shall be Mumbai. Hearings may be held at any venue mutually agreed between the parties."*

## Vidya Drolia non-arbitrability

Per *Vidya Drolia v. Durga Trading Corporation (2021) 2 SCC 1*, the following are non-arbitrable:

- Insolvency proceedings (IBC)
- Criminal offences
- Matrimonial disputes (divorce, custody, etc.)
- Guardianship and probate
- Tenancy disputes governed by special statutes (where the statute confers exclusive jurisdiction on a designated forum)
- SARFAESI proceedings (statutory remedy)
- Disputes involving sovereign and public-interest functions
- Statutory anti-trust / consumer / electoral disputes (typically)

The Drafter inserts a carve-out clause excluding these from arbitration.

## PASL Wind Solutions — Indian parties choosing foreign seat

Per *PASL Wind Solutions Private Limited v. GE Power Conversion India Private Limited (2021) 7 SCC 1*, two Indian parties can validly choose a foreign seat of arbitration (and the resulting award is enforceable as a foreign award under Part II of the Arbitration and Conciliation Act 1996). The plugin supports this choice; the Drafter flags the resulting consequences (foreign-award enforcement under Section 47-49 vs domestic award under Sections 34-36).

## Emergency Arbitrator (Section 9 alternative)

Most institutional rules (MCIA, SIAC, ICC, LCIA, HKIAC) provide for an Emergency Arbitrator who can grant interim relief within 14-15 days of appointment, before the tribunal is constituted. The Drafter includes consent to Emergency Arbitrator jurisdiction where institutional rules are chosen; this provides a parallel to Section 9 court-based interim relief.

## Section 29A time-bound discipline (post-2019 amendment)

The tribunal must render its award within 12 months from completion of pleadings (parties may consent to a further 6 months). Beyond this, court intervention is needed for extension. The Drafter inserts a procedural-cooperation covenant for compliance with Section 29A timelines.
