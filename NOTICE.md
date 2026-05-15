# NOTICE — Provenance and Privilege Statement

This document is part of the public release of the `indian-contracts-drafting` plugin (v0.1.0-alpha and onwards). It declares the provenance of the plugin's content, in order to address any question about advocate-client privilege, client confidentiality, professional ethics, personal-data protection, and commercial confidentiality that may be raised by any reader, complainant, regulator, or Bar Council disciplinary authority.

The plugin is **contract-config-aware**: the universal structural skeleton of any Indian contract is uniform, and the parties' chosen governing law, chosen seat of arbitration, chosen courts of exclusive jurisdiction, stamp-duty State, and registration State are supplied by the user via a `contract-config.md` file in the deal folder.

This NOTICE is published in plain language so that any reader — practising advocate, judge, Bar Council officer, regulator, member of the public, fellow developer — can understand the position without ambiguity.

---

## 1. What this plugin contains

This plugin contains the following categories of content, and **only** the following categories of content:

(a) **Universal contract skeleton** — the structural shape of any Indian commercial / conveyancing / estate contract (title, parties block, recitals, definitions, operative clauses, reps and warranties, covenants, term and termination, indemnity, limitation of liability, confidentiality, dispute resolution, governing law, notices, boilerplate, signatures, stamping note, registration note).

(b) **Formatting conventions** — text-formatting conventions for Indian contract instruments — title case for the title, defined terms in bold on first use, numbered clauses (1, 1.1, 1.1.1), schedule references, signature blocks with witness clauses where statute requires.

(c) **Statutory references** — citations to public statutes (Indian Contract Act 1872, Sale of Goods Act 1930, Transfer of Property Act 1882, Registration Act 1908, Indian Stamp Act 1899 + applicable State Stamp Acts, Specific Relief Act 1963, Companies Act 2013, Limited Liability Partnership Act 2008, Information Technology Act 2000, Digital Personal Data Protection Act 2023, Arbitration and Conciliation Act 1996 as amended 2015 / 2019 / 2021, Negotiable Instruments Act 1881, Indian Succession Act 1925, Hindu Succession Act 1956, Indian Trusts Act 1882, Prevention of Corruption Act 1988, Bharatiya Sakshya Adhiniyam 2023, Companies Act 2013, Insolvency and Bankruptcy Code 2016, SARFAESI Act 2002, Powers of Attorney Act 1882, Indian Easements Act 1882, applicable State Rent Control laws, FEMA 1999 + Foreign Exchange Management Regulations).

(d) **Procedural rule references** — citations to public rules (the various State Stamp Act Schedules, Registration Act Rules, FEMA Master Directions, RBI Master Directions, SEBI Listing Obligations and Disclosure Requirements Regulations 2015, MCA forms and procedures, CARA Regulations 2022 where relevant).

(e) **Generic placeholders** — every variable in every template is a placeholder (`[Party-1]`, `[Party-2]`, `[Authorised-Signatory-1]`, `[Consideration]`, `[Equity-Percent]`, `[Defined Term]`, `[Date]`, `[Place]`, `[Schedule of Property]`). No placeholder is filled with any specific deal, party, consideration figure, equity split, or identifying information.

(f) **Anti-hallucination and privacy-firewall workflow** — six agents (Reader, Format, Drafter, Verifier, Refiner, Overseer) that operate on a deal folder supplied by the user. The plugin itself contains no deal folder. The Reader substitutes every party name, key person, and commercially-sensitive figure with placeholders before downstream AI processing.

---

## 2. What this plugin does NOT contain

This plugin does **not** contain any of the following, and has never contained any of the following at any point in any committed version:

(a) **No specific client matter or deal.** No client of the author, and no commercial deal of the author or any client, appears in the plugin — by name, by deal-code, by consideration figure, by equity split, by party name, by registration number (CIN / LLPIN / GSTIN / PAN), or by any other identifying signature.

(b) **No client communications.** No oral or written communication made to the author by or on behalf of any client appears in the plugin in any form.

(c) **No client documents.** No document or instrument with which the author has become acquainted in the course of professional employment as an advocate appears in the plugin, in original, in redacted, in summary, in extract, or in pattern.

(d) **No personal data of any data principal.** The plugin processes no personal data, collects no personal data, stores no personal data.

(e) **No witness, no deposition, no specific board / shareholder resolution, no specific term sheet** of any specific deal handled by the author or any other advocate.

(f) **No client list, no chamber list, no associate list, no opposing-counsel list, no judge-specific intelligence.**

(g) **No tracking, no telemetry, no analytics, no opt-in error reporting, no login, no account, no cloud sync.** The plugin runs entirely on the user's machine. The author receives no information about who installs the plugin, who uses it, on what deals, with what consideration, with what outcomes.

---

## 3. The legal distinction

Indian law has long recognised a clear distinction between two categories:

(i) **Specific client communications and documents** — protected under Section 132 of the Bharatiya Sakshya Adhiniyam 2023 (formerly Section 126 of the Indian Evidence Act 1872) and under Rule 17 of the Bar Council of India Standards of Professional Conduct and Etiquette. This category is privileged and confidential.

(ii) **General professional knowledge of contract law and contract drafting** — an advocate's accumulated knowledge of how a Master Service Agreement is structured under the Indian Contract Act 1872, what a Lease Deed must contain under Section 105 of the Transfer of Property Act 1882, what the AoA-alignment imperative is in drafting a Shareholders Agreement under the Companies Act 2013, what the Suraj Lamp discipline means for any Power of Attorney touching immovable property, what stamp duty article applies to a Sale Deed in Maharashtra versus Karnataka. This category is the advocate's own professional knowledge. It is not the property of any specific client. It is not privileged.

This plugin operates **entirely within category (ii)**.

Every Indian advocate accumulates this knowledge through years of practice, through study of Pollock & Mulla on the Indian Contract Act, Mulla on the Transfer of Property Act, the Companies Act commentaries, the Arbitration and Conciliation Act commentaries, the State Stamp Act schedules, RBI Master Directions, FEMA Master Directions, and the case-law of the Supreme Court and the High Courts on contract enforceability, conveyance, arbitration, and corporate law. The plugin codifies that accumulated procedural knowledge into machine-readable form. It does not codify any client's confidential information.

The plugin is, in this respect, identical in legal character to a published contract-drafting textbook, a continuing legal education handout, or a senior advocate's drafting-style lecture. The medium is software. The content is procedural knowledge.

---

## 4. The author's professional position

The author is **Rushikesh R. Mahajan**, Advocate, enrolled with the Bar Council of Maharashtra and Goa, practising before the Bombay High Court, Nagpur Bench. The plugin is published under the open-source brand **Wolfgang Rush**, which is the author's publishing handle for legal-technology infrastructure; the real-identity accountability declared in this section attaches to the author personally and is not displaced by the use of a publishing handle.

The author retains full enrolment, full responsibility, and full liability under the Advocates Act 1961, the Bar Council of India Rules, and the Standards of Professional Conduct and Etiquette.

The plugin is published as a personal contribution to the open-source legal-technology ecosystem. It is published without any commercial channel, without any solicitation of professional work, without any advertisement of professional services, and without any acceptance of work through this repository.

This NOTICE is filed of record in this open-source repository so that any person who reads, reviews, audits, or assesses this plugin has full transparency about its provenance and its scope from the moment of release.

---

## 5. Verification of clean provenance

The repository owner shall maintain, on a private offline record, a build log demonstrating that every line of every file in the plugin was either:

(a) authored from scratch as procedural skeleton, OR
(b) derived from public statute, public rule, public judgment, or public commercial-drafting textbook, OR
(c) derived from the author's own original procedural knowledge as a practitioner.

No line of any file was, at any stage, copied from, paraphrased from, summarised from, or pattern-matched against any specific client matter, client deal, client communication, or client document.

This NOTICE is the author's signed declaration of that position.

---

## 6. Reporting concerns

If any reader, regulator, fellow advocate, or member of the public believes any specific content in this plugin is derived from a specific client matter or specific confidential communication, the reader is requested to:

(a) identify the file and line at issue in the plugin,
(b) identify the specific client matter or communication believed to be the source,
(c) explain the basis of the belief,

and raise the concern via a GitHub Issue on this repository.

Concerns raised with these particulars will be investigated and the file or line will be removed or rewritten if the concern is well-founded. Concerns raised without these particulars cannot be acted upon.

---

## 7. Standing instruction to forks and derivatives

Any fork, derivative, downstream redistribution, or commercial integration of this plugin or its content shall preserve this NOTICE in unmodified form, and shall extend the same provenance discipline to any content added in the fork or derivative.

This NOTICE travels with the code under the same MIT licence that governs the source.

---

*Signed and dated by way of public commit history on the repository. The author stands by every line of this notice.*
