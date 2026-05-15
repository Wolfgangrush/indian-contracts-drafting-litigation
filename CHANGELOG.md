# Changelog

All notable changes to the `indian-contracts-drafting` plugin are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/) and this project adheres to [Semantic Versioning](https://semver.org/).

---

## [0.1.0-alpha] — 2026-05-16 (initial release)

### Added

- **Plugin scaffolding** — `.claude-plugin/plugin.json` manifest · MIT `LICENSE` · `NOTICE.md` provenance and privilege statement · `.gitignore` · this `CHANGELOG.md` · comprehensive `README.md`.
- **Six-agent drafting pipeline** — Reader → Format → Drafter → Verifier → Refiner → Overseer. Each agent is a markdown file under `agents/<name>/<name>.md` with YAML frontmatter declaring `name`, `description`, and `allowed-tools`.
- **Shared infrastructure skills:**
  - `_drafting_common` — anti-pollution rules, encoding standards, language conventions, AI-style-marker blacklist, contract-specific privacy firewall, **Indian Stamp Act discipline** (Schedule I of the central Indian Stamp Act 1899 and the corresponding State Stamp Acts), **Registration Act 1908 discipline** (which instruments require compulsory registration under Section 17 read with Section 49 of the Registration Act 1908 and Section 17 / 53A of the Transfer of Property Act 1882), and **DPDP-clause discipline** for any contract handling personal data (Digital Personal Data Protection Act 2023).
  - `_contract_drafting_base` — universal Indian-contract pleading skeleton (Parties block · Recitals · Definitions · Operative Clauses · Representations · Warranties · Covenants · Term and Termination · Indemnity · Limitation of Liability · Confidentiality · Dispute Resolution + Arbitration · Governing Law and Jurisdiction · Notices · Force Majeure · Severability · Entire Agreement · Assignment · Waiver · Counterparts · Signatures + Stamping + Registration).
- **Ten case-type skill scaffolds:**
  - `commercial-service-agreement-draft` — Master Service Agreement / Statement of Work / Service Agreement
  - `nda-draft` — Non-Disclosure Agreement (mutual / one-way)
  - `employment-agreement-draft` — Employment Agreement + Independent Contractor distinction
  - `lease-deed-draft` — Lease Deed vs Leave & License (Section 105 TOPA vs Section 52 Easements Act; registration-critical)
  - `sale-deed-draft` — Sale Deed (immovable property, registration-mandatory under Section 17 Registration Act 1908)
  - `gpa-spa-draft` — General Power of Attorney + Special Power of Attorney (post-*Suraj Lamp & Industries v. State of Haryana (2012)* discipline)
  - `shareholders-agreement-draft` — Shareholders Agreement (with Articles of Association alignment per Companies Act 2013)
  - `will-draft` — Last Will and Testament (Indian Succession Act 1925 / Hindu Succession Act 1956 overlay)
  - `loan-agreement-draft` — Loan Agreement (lender / borrower discipline, NI Act 1881 cross-reference for promissory notes)
  - `arbitration-clause-draft` — Standalone Arbitration Agreement (or arbitration clause for embedding in any contract; Arbitration and Conciliation Act 1996 as amended 2015 / 2019 / 2021)
- **State-aware design** — `state-config/exemplars/` provides State-specific stamp-duty schedule references, registration-office references, and governing-law boilerplate references. The user supplies `contract-config.md` declaring the chosen governing law, chosen seat of arbitration, chosen courts of exclusive jurisdiction, stamp-duty State, and registration State.

### Notes on this release

This is a **v0.1.0-alpha scaffold release**. The structural skeletons, agent pipeline, base skills, and 10 case-type skill frames are in place. Deep per-skill encoding (full clause libraries for each contract type, State-specific stamp-duty calculations, deeper DPDP-compliance overlays for data-handling contracts, and integration with the corporate filings / RoC discipline for SHA / SSA / Founder Agreements) will land in v0.1.0 and onward.

### Released under

MIT License. Authored by Rushikesh R. Mahajan, Advocate, publishing under the Wolfgang Rush open-source brand for legal-tech infrastructure.
