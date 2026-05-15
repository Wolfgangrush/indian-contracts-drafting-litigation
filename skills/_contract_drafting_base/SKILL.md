---
name: _contract_drafting_base
description: Universal Indian-contract pleading skeleton. Shared base for all 10 contract case-type skills. Holds the standard structure (Title -> Parties block -> Recitals -> Definitions -> Operative Clauses -> Reps and Warranties -> Covenants -> Term and Termination -> Indemnity -> Limitation of Liability -> Confidentiality -> Dispute Resolution + Arbitration -> Governing Law and Jurisdiction -> Notices -> Boilerplate -> Signatures -> Stamping note -> Registration note). NOT invoked directly — extended by every case-type skill in this plugin.
allowed-tools: Read
---

# `_contract_drafting_base` — universal Indian-contract skeleton

This base skill defines the **structural shape** of any Indian contract drafted by the plugin. Case-type skills extend this base with case-type-specific operative clauses, reps and warranties, indemnities, and boilerplate carve-outs.

## Universal skeleton

```
1. TITLE
   {{case_type.title}} (e.g. "MASTER SERVICE AGREEMENT" / "LEASE DEED" / etc.)

2. PARTIES BLOCK
   THIS AGREEMENT is made and executed at {{place_of_execution}} on this
   __ day of {{month}}, {{year}}
   BETWEEN
   [Party-1 full description: name, type (individual / company / LLP /
    partnership / sole proprietorship / HUF / trust), address, registration
    (CIN / LLPIN / GSTIN / PAN), authorised signatory + designation]
   ("Party-1" / a defined name like "Service Provider" / "Vendor" /
    "Lessor" / "Licensor" / etc.)
   AND
   [Party-2 full description as above]
   ("Party-2" / a defined name like "Customer" / "Client" / "Lessee" /
    "Licensee" / etc.)
   (collectively, the "Parties" and individually, a "Party").

3. RECITALS
   WHEREAS, [Party-1 background / capacity / business];
   AND WHEREAS, [Party-2 background / capacity / business];
   AND WHEREAS, [the parties have agreed to enter into this Agreement
                 on the terms and conditions set out below];
   NOW, THEREFORE, in consideration of the mutual covenants and agreements
   contained in this Agreement and for other good and valuable
   consideration, the receipt and sufficiency of which are hereby
   acknowledged, the Parties hereby agree as follows:

4. DEFINITIONS
   1.1 "[Defined Term]" means [precise meaning].
   1.2 "[Defined Term]" means [precise meaning].
   ... (alphabetical order)

5. OPERATIVE CLAUSES (case-type-specific)
   {{case_type.operative_clauses}}

6. REPRESENTATIONS AND WARRANTIES
   6.1 [Party-1] represents and warrants to [Party-2] that:
       (a) Authority — [Party-1] has full power and authority to enter
           into and perform this Agreement.
       (b) No Conflict — execution of this Agreement does not conflict
           with any constitutional document, any contract to which
           [Party-1] is a party, or any applicable law.
       (c) No Litigation — there is no pending or threatened litigation
           that would materially affect this Agreement.
       (d) Compliance with Laws — [Party-1] is in compliance with all
           applicable laws.
       (e) [Case-type-specific reps]
   6.2 [Party-2 — mirror reps]

7. COVENANTS
   7.1 Each Party shall:
       (a) perform its obligations in good faith;
       (b) comply with all applicable laws;
       (c) [case-type-specific covenants]
   7.2 Negative covenants — [case-type-specific]

8. TERM AND TERMINATION
   8.1 Commencement — this Agreement shall commence on {{commencement_date}}.
   8.2 Term — this Agreement shall continue for {{term_duration}} unless
       terminated earlier in accordance with this Agreement.
   8.3 Termination for cause — [either Party may terminate on material
       breach not cured within {{cure_period}}].
   8.4 Termination for insolvency — IBC 2016 trigger language.
   8.5 Termination for convenience — [if commercially negotiated:
       notice period].
   8.6 Consequences of termination — survival of confidentiality,
       indemnity, governing law, dispute resolution, and other clauses
       that by nature survive.

9. INDEMNITY
   9.1 [Indemnifying Party] shall indemnify, defend, and hold harmless
       [Indemnified Party] from and against all losses, damages, costs
       (including reasonable attorneys' fees), and expenses arising out
       of or in connection with:
       (a) breach of this Agreement;
       (b) breach of reps / warranties / covenants;
       (c) gross negligence, wilful misconduct, or fraud;
       (d) infringement of third-party IP;
       (e) [case-type-specific indemnities].
   9.2 Indemnity cap — [defined cap].
   9.3 Carve-outs from the cap — gross negligence, wilful misconduct,
       fraud, breach of confidentiality, IP indemnity, statutory
       liabilities under the DPDP Act 2023 (where applicable).
   9.4 Procedure — notice, conduct of defence, cooperation.

10. LIMITATION OF LIABILITY
    10.1 Aggregate liability of either Party under or in connection with
         this Agreement shall not exceed {{liability_cap}} (e.g. fees
         paid or payable in the preceding 12 months).
    10.2 Carve-outs from the cap — gross negligence, wilful misconduct,
         fraud, breach of confidentiality, IP indemnity, breach of DPDP
         obligations (where applicable), statutory non-excludable
         liabilities.
    10.3 No indirect / consequential / special / punitive damages.

11. CONFIDENTIALITY
    11.1 Definition of Confidential Information.
    11.2 Exclusions — public domain, independently developed, lawfully
         received from third party, required by law.
    11.3 Permitted use and disclosure.
    11.4 Term — duration during the Agreement + {{N_years}} after
         termination; trade secrets — perpetual until information enters
         public domain through no breach by the receiving Party.

12. DISPUTE RESOLUTION
    12.1 Escalation — good-faith discussions between designated
         representatives within {{N_days}}.
    12.2 Arbitration — any dispute not resolved through escalation
         shall be finally settled by arbitration under the Arbitration
         and Conciliation Act 1996.
        Seat: {{contract_config.arbitration_seat}}
        Rules: {{contract_config.arbitration_institution_rules}}
        Number of Arbitrators: {{N}}
        Language: English (default)
    12.3 Interim relief — either Party may approach the courts at
         {{contract_config.exclusive_jurisdiction}} for interim relief
         under Section 9 of the Arbitration and Conciliation Act 1996.
    12.4 Section 11 — appointment of arbitrators by the High Court at
         {{seat_high_court}} where parties cannot agree.

13. GOVERNING LAW AND JURISDICTION
    13.1 This Agreement is governed by {{contract_config.governing_law}}.
    13.2 Subject to Clause 12, the courts at
         {{contract_config.exclusive_jurisdiction}} shall have exclusive
         jurisdiction over all matters arising out of this Agreement.

14. NOTICES
    14.1 Any notice shall be in writing and delivered by registered post
         AD / courier (signature obtained) / email at the addresses set
         out in this Clause.
    14.2 Deeming rules — registered post = 4 working days; courier =
         delivery on date of receipt; email = next working day if sent
         before 6:00 PM IST on a working day, else the following working
         day.

15. BOILERPLATE
    15.1 Force Majeure — defined events, notice requirement, suspension
         and termination triggers.
    15.2 Severability — invalidity of one clause does not affect others.
    15.3 Entire Agreement — supersedes all prior arrangements.
    15.4 Assignment — generally prohibited without prior written consent;
         affiliate assignment carve-out.
    15.5 Waiver — no waiver unless in writing and signed.
    15.6 Counterparts — execution in counterparts permitted.
    15.7 Amendments — in writing only.
    15.8 Survival — Clauses [enumerate] survive termination.

16. SIGNATURES
    [Party-1 authorised signatory + designation + signature]
    [Party-2 authorised signatory + designation + signature]
    [Witness 1 — required for Wills (Section 63 Indian Succession Act
                 1925), Sale Deeds (Section 54 TOPA), Gift Deeds
                 (Section 123 TOPA), GPAs in some States]
    [Witness 2]

17. STAMPING NOTE
    This instrument shall be executed on stamp paper of value
    {{stamp_duty}} under Article {{article_no}} of Schedule I of the
    {{applicable_stamp_act}} payable at {{stamp_state}}.

18. REGISTRATION NOTE
    This instrument [is / is not] compulsorily registrable under
    Section 17 of the Registration Act 1908 [read with Section 17 / 53A
    of the Transfer of Property Act 1882]. Registration to be carried
    out before the Sub-Registrar at {{registration_state}} within
    [4 months] of execution under Section 23 of the Registration Act
    1908.
```

## Statute references the plugin handles

- Indian Contract Act 1872 (foundation)
- Sale of Goods Act 1930
- Transfer of Property Act 1882 (conveyancing)
- Registration Act 1908
- Indian Stamp Act 1899 + applicable State Stamp Acts
- Specific Relief Act 1963
- Companies Act 2013
- Limited Liability Partnership Act 2008
- Information Technology Act 2000 (e-contracts + e-signatures + Section 65B)
- Digital Personal Data Protection Act 2023
- Arbitration and Conciliation Act 1996 (as amended 2015 / 2019 / 2021)
- Negotiable Instruments Act 1881 (Section 138 etc.)
- Indian Succession Act 1925
- Hindu Succession Act 1956 (Hindu intestate succession + coparcener overlay)
- Indian Trusts Act 1882
- Prevention of Corruption Act 1988
- Bharatiya Sakshya Adhiniyam 2023 (admissibility of electronic records)
