# Changelog

All notable changes to the `indian-contracts-drafting` plugin are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/) and this project adheres to [Semantic Versioning](https://semver.org/).

---

## [0.2.2-alpha] — 2026-05-24

### Transactional-instrument reference.docx + output-pairing discipline

This plugin produces transactional instruments (contracts / conveyancing deeds), not pleadings. The v0.2.1 reference.docx wrongly applied the Bombay HC Nagpur pleading style (TNR 14pt 1.5 spacing, spaced + UNDERLINED bold-centered section headers, "MOST RESPECTFULLY SHEWETH:" anchor) — wholly inappropriate for commercial documents. v0.2.2 ships a correctly-calibrated transactional reference.docx.

### Added

- **Transactional `reference.docx`** at `skills/<base>/reference.docx` — TNR 12pt body, single line spacing, 2.5cm margins all around, Heading 1 bold centered (NOT underlined) for document title, Heading 2 bold left for section titles (e.g., "1. DEFINITIONS"), Heading 3 bold italic left for sub-sections, Heading 4 italic left for sub-sub-sections. No spaced section headers. No underlining of headings. Page numbers bottom-center.
- **`build_reference_docx.py`** (transactional variant) — reproducible build script for the transactional reference.docx.
- **`pair_md_to_docx.sh`** — helper script that every agent calls after writing a `.md` output. Pairs every Markdown artifact with a `.docx` using the shipped reference.docx + the post-pandoc table-width fix.
- **OUTPUT-PAIRING DISCIPLINE** section in `_drafting_common/SKILL.md` documenting the per-agent output-pairing map and the helper-script usage.

### Changed

- **reference.docx style** for transactional instruments is now correctly differentiated from pleading style. Pleading-style v0.2.1 reference.docx is REMOVED from this plugin and replaced with the transactional variant.
- **Pipeline output convention** — every agent's `.md` output is now paired with a `.docx`. Advocates do not natively read Markdown; every artifact is opened in Word.

### Migration

Any existing case folders that produced output under v0.2.1 should re-run the Drafter to produce the corrected `.docx` files in the transactional style. The `.md` source files remain unchanged.

---

## [0.2.1-alpha] — 2026-05-24

### Filing-grade render-defect repair + pipeline-optionality

The v0.1.0 render path produced filing-grade Markdown but the pandoc → `.docx` conversion failed Bombay HC / equivalent Registry expectations on multiple counts (title not bold, section headers left-aligned, Index table column-headers wrapping vertically, party block leaking onto cover pages, ~6,200-word bloat). This release repairs the render path, calibrated against an actual filed Bombay HC Nagpur Second Appeal pleading the author supplied as the filing-grade reference. Inherits the v0.2.1 fixes from `indian-hc-drafting-litigation`.

### Added

- **Pre-customised `reference.docx`** in the plugin's base-skill folder with locked Word styles (TNR 14pt body, 1.5 line spacing, 4cm left / 2.5cm right-top-bottom margins, Heading 1 bold centered, Heading 2 bold + UNDERLINED + centered + letter-spacing for the spaced `F A C T S` effect, Heading 3 bold + UNDERLINED + centered for unspaced section headers, Heading 4 bold + UNDERLINED + left for `MOST RESPECTFULLY SHEWETH:` style anchors, fixed table layout).
- **`build_reference_docx.py`** — reproducible python-docx build script for the shipped reference.docx.
- **`fix_docx_tables.py`** — post-pandoc Python script that forces column widths on every table (5-col 8/8/60/14/10; 4-col 10/10/65/15; 3-col 10/75/15; 2-col 18/82). Locks first-row bold + centered + vertically-centered cells. Drafter runs this as the final post-pandoc step.
- **MARKDOWN HEADING DISCIPLINE** in the Drafter prompt + base SKILL.md (Heading 1 / Heading 2 / Heading 3 / Heading 4 mapping for court header / spaced section headers / unspaced section headers / left-anchored headings).
- **VERBOSITY DISCIPLINE** with per-case-type word-count targets and hard ceilings.
- **PIPELINE-OPTIONALITY** — Verifier / Refiner / Overseer now OPTIONAL QC layers. Default exit point is after Stage 3 (Drafter).
- **COVER-PAGE DISCIPLINE** — INDEX / SYNOPSIS / LIST OF ANNEXURES each begin on `\newpage` with short cause-title only.
- **Bold-number paragraph convention** — Facts and Grounds paragraphs use `**1.** **2.** **3.**`.
- **Inline-bold highlighting convention** for property descriptors / annexure markers / key terms within Facts narrative.

### Changed

- **Drafter pandoc command** is now TWO steps (pandoc → .docx, then `fix_docx_tables.py`). Step 2 is non-negotiable; skipping it reproduces the v0.2.0 stacking-column defect.

### Cost / token-budget note

Running the full 6-agent pipeline burns approximately 600K tokens per draft, which can exhaust an advocate's Claude session limit. v0.2.1 makes Stages 4–6 OPTIONAL so a baseline Reader → Format → Drafter run (~280K tokens) is sufficient for routine pleadings. The optional QC stages remain available for high-stakes matters.

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
