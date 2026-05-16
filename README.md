# indian-contracts-drafting

> **Open-source Claude-compatible plugin for drafting Indian contracts, conveyancing instruments, and personal-estate documents.**
>
> Six-agent drafting pipeline · ten case-type skills · contract-config-aware · Indian Contract Act 1872 + Transfer of Property Act 1882 + Registration Act 1908 + Indian Stamp Act 1899 + Arbitration and Conciliation Act 1996 + DPDP Act 2023 discipline encoded.
>
> Released under MIT. Open infrastructure for the legal community. No commercial engagement offered through this repository — see Disclaimer below.

---

## Table of contents

1. [What this plugin does](#what-this-plugin-does)
2. [Case-type skills (full inventory with statutory authority)](#case-type-skills-full-inventory)
3. [The 6-agent drafting pipeline (what each agent does)](#the-6-agent-drafting-pipeline)
4. [Installation](#installation)
5. [Your first contract — step-by-step walkthrough](#your-first-contract--step-by-step-walkthrough)
6. [The `contract-config.md` file](#the-contract-configmd-file)
7. [Built-in compliance disciplines](#built-in-compliance-disciplines)
8. [Privacy firewall — extra discipline for commercial content](#privacy-firewall--extra-discipline-for-commercial-content)
9. [Why MIT License](#why-mit-license)
10. [Sibling plugins](#sibling-plugins)
11. [Why this exists](#why-this-exists)
12. [Roadmap](#roadmap)
13. [Contributing](#contributing)
14. [Contact](#contact)
15. [Author and brand](#author-and-brand)
16. [Provenance and privilege statement](#provenance-and-privilege-statement)
17. [Disclaimer and Bar Council of India Rule 36 compliance](#disclaimer-and-bar-council-of-india-rule-36-compliance)
18. [License](#license)

---

## What this plugin does

This plugin lets an Indian advocate, sitting inside the Claude Desktop application, point at a deal folder on disk and obtain a complete contract / conveyancing instrument / estate document in `.docx` form — Parties, Recitals, Definitions, Operative Clauses, Reps and Warranties, Covenants, Term and Termination, Indemnity, Limitation of Liability, Confidentiality, Dispute Resolution + Arbitration, Governing Law, Notices, Boilerplate, Signatures, Stamping note, Registration note — formatted in the parties' chosen jurisdiction and stamp / registration regime, sourced from a `contract-config.md` file the user places in the deal folder.

The pipeline is six agents running in sequence:

1. **Reader** — extracts deal-points (parties, consideration, term, performance obligations, jurisdictional anchors, stamp position, registration position, DPDP position) from the deal folder with a per-document audit log, and applies the **contract-specific privacy firewall** (every party name, key person, and commercially-sensitive figure — consideration, salary, equity %, share count — substituted with structural placeholders before downstream AI processing; the placeholder → real-value mapping is stored locally on the user's machine only).
2. **Format** — loads the case-type skill template, reads the user's `contract-config.md`, and pre-substitutes governing law / arbitration seat / arbitration institution / exclusive jurisdiction / stamp State / registration State into a `format-shell.md` ready for the Drafter.
3. **Drafter** — writes the actual contract. Parties block, Recitals (WHEREAS clauses), Definitions, Operative Clauses (case-type-specific), Reps and Warranties, Covenants, Term and Termination, Indemnity, Limitation of Liability, Confidentiality, Dispute Resolution + Arbitration, Governing Law and Jurisdiction, Notices, Boilerplate, Signatures, Stamping note, Registration note.
4. **Verifier** — anti-hallucination firewall **plus** stamp-duty discipline **plus** Registration Act discipline **plus** Section 10 Indian Contract Act essentials check **plus** Suraj Lamp discipline **plus** DPDP-clause discipline **plus** arbitration-clause workability check. Flags fabricated parties / dates / consideration / property descriptions, mis-cited sections, hallucinated case citations, stamp-duty mismatch against the applicable State Stamp Act schedule, compulsory-registration miscall, missing Section 10 ICA essentials, Suraj Lamp violations (any GPA-type instrument purporting to convey title), missing DPDP clauses where personal data is handled, defective arbitration clauses.
5. **Refiner** — applies Verifier flags, polishes language to Indian-contract formal register, enforces internal numbering and defined-term consistency, strips AI-style markers, and re-substitutes real party names and commercial figures into the final `.docx` (strictly on the user's local machine — the underlying AI never holds real values).
6. **Overseer** — reads the polished draft with an opposing-party / opposing-counsel lens. Flags asymmetric clauses, attackable indemnity carve-outs, missing standard reps, weak termination triggers, IP-assignment vulnerabilities, missing change-of-control, missing audit rights, weak confidentiality survival, vulnerable governing-law / arbitration choices, unworkable force majeure, ambiguous notice provisions, missing anti-bribery / sanctions / compliance clauses for cross-border deals, missing DPDP flowdowns, missing stamp + registration discipline.

The output is what an advocate would put before parties for execution. **Not a template. Not a checklist. A contract** — ready for the advocate's review, professional verification, signature, stamping, and (where applicable) registration.

---

## Case-type skills (full inventory)

The plugin ships **ten case-type skills**.

### 1. `commercial-service-agreement-draft`

**Statutory authority:** Indian Contract Act 1872 + Sale of Goods Act 1930 (where deliverables include goods) + DPDP Act 2023 (where personal data is processed) + IT Act 2000 (for IT services + e-signature execution under Section 5). **Use case:** Master Service Agreement / Statement of Work / Service Agreement — IT services, consulting, professional services, BPO/KPO, managed services, content services, marketing. **Output:** complete MSA with Scope, Service Levels, Fees, IP allocation (Background / Foreground / derivative works + Section 57 moral-rights waiver), DPDP flowdown, audit rights, insurance, change control, indemnity, limitation of liability, confidentiality, arbitration, governing law.

### 2. `nda-draft`

**Statutory authority:** Indian Contract Act 1872 (Sections 27 — restraint of trade — and 73 — damages for breach). **Use case:** Non-Disclosure Agreement — mutual / one-way / multi-party. Pre-contractual due diligence, supplier evaluation, M&A discussions, employment-stage information disclosure, joint-venture exploration. **Output:** complete NDA with definition of Confidential Information, exclusions, permitted use, permitted disclosees, term, return / destruction, equitable relief, no-solicit (where commercially negotiated).

### 3. `employment-agreement-draft`

**Statutory authority:** Indian Contract Act 1872 + the four labour codes (Code on Wages 2019 / Industrial Relations Code 2020 / Code on Social Security 2020 / Occupational Safety, Health and Working Conditions Code 2020 as and when notified) + Payment of Gratuity Act 1972 + EPF Act 1952 + ESIC Act 1948 + Maternity Benefit Act 1961 + POSH Act 2013. **Use case:** Employment Agreement OR Independent Contractor Agreement. The plugin distinguishes between the two — substantial tax / EPF / ESIC / gratuity / labour-code / DPDP-Act consequences flow from the distinction. **Output:** complete agreement with position, compensation breakup, statutory benefits, notice period, probation, POSH compliance, confidentiality, IP assignment with moral-rights waiver, non-solicit, Section 27 ICA caveat for non-compete, DPDP-compliant employee-data clauses.

### 4. `lease-deed-draft`

**Statutory authority:** Transfer of Property Act 1882 (Section 105) + Indian Easements Act 1882 (Section 52) + Registration Act 1908 (Section 17(1)(d)) + applicable State Stamp Act + applicable State Rent Control law. **Use case:** Lease Deed OR Leave & License Agreement. The plugin distinguishes — Lease creates an interest in immovable property and is compulsorily registrable if term > 1 year or reserves yearly rent; Leave & License creates only a personal permission and (in most States) is not compulsorily registrable for shorter terms. **Output:** complete instrument with demised premises, term, rent, deposit, escalation, permitted use, repairs allocation, termination, holding-over treatment, stamp + registration discipline.

### 5. `sale-deed-draft`

**Statutory authority:** Transfer of Property Act 1882 (Section 54) + Registration Act 1908 (Section 17(1)(b), compulsorily registrable). **Use case:** Sale Deed of immovable property — the only valid mode of transferring title to immovable property under Indian law post-*Suraj Lamp & Industries (P) Ltd. v. State of Haryana (2012) 1 SCC 656*. **Output:** complete Sale Deed with title chain recitals, Schedule of Property, possession handover, encumbrance warranty, marketable-title warranty, Section 194-IA TDS compliance note, stamp duty + registration note (ad valorem on Ready Reckoner or consideration, whichever higher). **Suraj Lamp firewall** — the plugin refuses to draft any GPA-Sale / Will-with-GPA / Agreement-to-Sell-with-Possession-and-GPA purporting to effect title transfer.

### 6. `gpa-spa-draft`

**Statutory authority:** Powers of Attorney Act 1882 + Indian Contract Act 1872 (Sections 182-238, agency provisions). **Use case:** General Power of Attorney or Special Power of Attorney for authorising acts on behalf of the Principal. **Output:** complete GPA / SPA with explicit scope of authority, **express Suraj Lamp caveat** (the instrument does NOT authorise transfer of title to immovable property), duration, revocation mechanism, indemnity, notarisation / apostille discipline.

### 7. `shareholders-agreement-draft`

**Statutory authority:** Companies Act 2013 (Section 6 + Section 58(2) for transfer-restriction enforceability in private companies + Sections 5 and 14 for AoA-alignment) + Indian Contract Act 1872 + FEMA 1999 + FEM (Non-Debt Instruments) Rules 2019 (for non-resident investors). **Use case:** Shareholders Agreement in early-stage / Series A / Series B funding rounds. **Output:** complete SHA with capital structure, board composition, reserved matters, transfer restrictions (ROFR / ROFO / lock-in), tag-along, drag-along, anti-dilution, liquidation preference, conversion, information rights, exit mechanisms (IPO, strategic sale, buyback, put options subject to FEMA), founder reverse-vesting, non-compete / non-solicit (with Section 27 ICA caveat), AoA-alignment covenant.

### 8. `will-draft`

**Statutory authority:** Indian Succession Act 1925 (Sections 57-191) + Hindu Succession Act 1956 (intestate + coparcener overlay) + Muslim Personal Law (separate testamentary discipline — 1/3 limit on bequests to non-heirs without consent). **Use case:** Last Will and Testament. The plugin applies the correct discipline per the testator's religion. **Output:** complete Will with mental-capacity declaration, revocation of prior Wills, executor appointment, specific + residuary bequests, trust bequest for minor / incapacitated beneficiaries, attestation by TWO witnesses per Section 63 ISA. **Hindu Coparcener overlay** — applied where the property is ancestral / coparcenary. **Muslim Personal Law overlay** — applied where the testator is Muslim, restricting bequest to 1/3 (or flagging consent-of-heirs requirement).

### 9. `loan-agreement-draft`

**Statutory authority:** Indian Contract Act 1872 + Negotiable Instruments Act 1881 + RBI directions (for bank / NBFC lenders) + IBC 2016 (Sections 4, 7 — corporate insolvency trigger; Part III — individual insolvency) + SARFAESI Act 2002 (for secured lenders) + FEMA 1999 + FEM (Borrowing or Lending) Regulations 2018 (for External Commercial Borrowing). **Use case:** Loan Agreement — term loan, working capital, inter-corporate loan, friend-and-family loan, cross-border ECB. **Output:** complete agreement with disbursement conditions, interest rate framework, repayment schedule, security, reps and warranties, financial and non-financial covenants, events of default, acceleration, Section 138 NI Act acknowledgement, IBC trigger reference, SARFAESI rights (for institutional lenders), FEMA ECB compliance covenant (for cross-border lending).

### 10. `arbitration-clause-draft`

**Statutory authority:** Arbitration and Conciliation Act 1996 (as substantively amended by the Acts of 2015, 2019, and 2021) + *Vidya Drolia v. Durga Trading Corporation (2021) 2 SCC 1* (arbitrability) + *Bharat Aluminium v. Kaiser Aluminium (BALCO) (2012) 9 SCC 552* (seat-vs-venue distinction) + *PASL Wind Solutions v. GE Power (2021) 7 SCC 1* (two Indian parties choosing foreign seat). **Use case:** Standalone Arbitration Agreement OR robust arbitration clause for embedding in any contract. **Output:** complete clause with explicit seat, institutional / ad-hoc choice with rules named, number of arbitrators, appointment mechanism, language, interim relief (Section 9 + Emergency Arbitrator), Section 29A time-bound discipline reference, Section 31A costs reference, Section 42A confidentiality reference, Vidya Drolia non-arbitrability carve-outs.

### Shared infrastructure skills

- **`_drafting_common`** — anti-pollution rules, contract-specific privacy firewall, AI-style-marker blacklist, citation discipline, **Indian Stamp Act 1899 + State Stamp Act discipline**, **Registration Act 1908 + TOPA Section 17 / 53A compulsory-registration discipline**, **Section 10 Indian Contract Act essentials check**, **Suraj Lamp discipline**, **DPDP Act 2023 clause discipline**, **Arbitration and Conciliation Act 1996 discipline**.
- **`_contract_drafting_base`** — universal Indian-contract pleading skeleton (Title, Parties block, Recitals, Definitions, Operative Clauses, Reps and Warranties, Covenants, Term and Termination, Indemnity, Limitation of Liability, Confidentiality, Dispute Resolution + Arbitration, Governing Law and Jurisdiction, Notices, Boilerplate, Signatures, Stamping note, Registration note).

---

## The 6-agent drafting pipeline

| Agent | What it reads | What it writes | Key contract-domain specialisation |
|---|---|---|---|
| **`reader`** | Every file in the deal folder + the case-type skill's `deal-facts-questions.md` | `deal-facts.md` with per-document audit log + `annexure-candidates.md` + `missing-laws.md` | Privacy firewall — substitutes party names + key persons + commercially-sensitive figures (consideration, salary, equity %, share count) before downstream AI processing; mapping stored locally only |
| **`format`** | `deal-facts.md` + `contract-config.md` + case-type SKILL.md + `_contract_drafting_base` | `format-shell.md` with governing-law / arbitration-seat / exclusive-jurisdiction / stamp-State / registration-State pre-substituted | Identifies mandatory vs optional boilerplate for the contract type |
| **`drafter`** | `deal-facts.md` + `format-shell.md` + case-type SKILL.md + `_contract_drafting_base` + law PDFs | `draft-v1.md` + `draft-v1.docx` | Writes Title + Parties + Recitals + Definitions + Operative Clauses + Reps/Warranties/Covenants + Term/Termination + Indemnity + Limitation of Liability + Confidentiality + Dispute Resolution + Governing Law + Notices + Boilerplate + Signatures + Stamping/Registration notes |
| **`verifier`** | `draft-v1.md` + `deal-facts.md` + `contract-config.md` + law PDFs | `verification-report.md` | Anti-hallucination + stamp-duty cross-foot against State Stamp Act schedule + Registration Act compulsory-registration check + Section 10 ICA essentials + Suraj Lamp discipline + DPDP-clause check + arbitration-clause workability check |
| **`refiner`** | `draft-v1.md` + `verification-report.md` + `contract-config.md` + `deal-facts.md` | `draft-v2.md` + `draft-v2.docx` | Polish to Indian-contract formal register + internal numbering / cross-reference / defined-term consistency + privacy-firewall reversal (real values re-substituted from local mapping into final `.docx`) |
| **`overseer`** | `draft-v2.md` + `deal-facts.md` + `contract-config.md` | `opposing-notes.md` + `final-draft.docx` | Opposing-party critique — asymmetric clauses, indemnity carve-outs, missing reps, termination triggers, IP-assignment gaps, change-of-control, audit rights, confidentiality survival, governing-law vulnerabilities, force majeure, notices, anti-bribery / sanctions, DPDP flowdown, stamp + registration discipline |

---

## Installation

This is a Claude-compatible plugin in the Anthropic plugin format, designed to run inside the **Claude Desktop application** (available at <https://claude.ai/download>). The plugin folder location depends on your OS:

| OS | Plugin folder path |
|---|---|
| **macOS** | `~/Library/Application Support/Claude/plugins/` |
| **Windows** | `%APPDATA%\Claude\plugins\` (typically `C:\Users\<you>\AppData\Roaming\Claude\plugins\`) |
| **Linux** | `~/.config/Claude/plugins/` |

Clone the plugin into that folder:

```bash
# macOS / Linux
mkdir -p ~/Library/Application\ Support/Claude/plugins   # adjust per OS table
cd ~/Library/Application\ Support/Claude/plugins
git clone https://github.com/Wolfgangrush/indian-contracts-drafting-litigation.git indian-contracts-drafting

# Windows (PowerShell)
mkdir -Force $env:APPDATA\Claude\plugins
cd $env:APPDATA\Claude\plugins
git clone https://github.com/Wolfgangrush/indian-contracts-drafting-litigation.git indian-contracts-drafting
```

Restart the Claude Desktop application. The plugin is auto-discovered on the next session start.

### Anthropic Plugin Marketplace (when available)

When the plugin lands on the Anthropic Plugin Marketplace, you will be able to install it from inside the application's plugin browser without `git`. Until then, the manual clone steps above are canonical.

### Verifying the install

In a Claude session, type:

- *"draft MSA"* — triggers `commercial-service-agreement-draft`
- *"draft NDA"* — triggers `nda-draft`
- *"draft lease deed"* — triggers `lease-deed-draft`
- *"draft sale deed"* — triggers `sale-deed-draft`
- *"draft SHA"* — triggers `shareholders-agreement-draft`
- *"draft will"* — triggers `will-draft`
- *"draft loan agreement"* — triggers `loan-agreement-draft`
- *"draft arbitration clause"* — triggers `arbitration-clause-draft`
- `/nda-draft` — explicit slash-invocation

---

## Your first contract — step-by-step walkthrough

Suppose you wish to draft a **Master Service Agreement** between an Indian IT services company and an Indian client.

### Step 1 — create a deal folder

```
~/Desktop/deals/
└── msa-2026-CLIENT-NAME/
    ├── contract-config.md         ← declares governing law + arbitration seat + jurisdiction
    ├── inputs/
    │   ├── term-sheet.pdf
    │   ├── proposed-SoW.docx
    │   ├── prior-NDA.pdf
    │   ├── client-procurement-policy.pdf
    │   └── commercial-discussions-thread.eml
    └── laws/
        ├── indian-contract-act-1872.pdf
        ├── dpdp-act-2023.pdf
        ├── arbitration-conciliation-act-1996.pdf
        └── copyright-act-1957.pdf
```

### Step 2 — write `contract-config.md`

```yaml
governing_law: "the laws of India"
arbitration_seat: "Mumbai"
arbitration_institution_rules: "Mumbai Centre for International Arbitration (MCIA) Rules"
number_of_arbitrators: 1
arbitration_language: "English"
exclusive_jurisdiction: "the courts at Mumbai"
stamp_state: "Maharashtra"
registration_state: "Not applicable (instrument not compulsorily registrable)"
contract_type: "MSA"
parties:
  - party_role: "Service Provider"
    party_type: "Private Limited Company"
    party_jurisdiction: "Maharashtra"
  - party_role: "Customer"
    party_type: "Private Limited Company"
    party_jurisdiction: "Karnataka"
personal_data_handled: true             # triggers DPDP-clause discipline
```

### Step 3 — open the deal folder in Claude

In the Claude Desktop application, point Claude at the deal folder using the application's file-browser feature.

### Step 4 — invoke the skill

```
draft MSA
```

The Reader will walk every file, write `deal-facts.md` with the parties, the proposed scope, fees, and commercial intent, identify schedule candidates, apply the privacy firewall (party names → `[Service Provider]` / `[Customer]`, fees → `[Fee-Per-Quarter]`, etc.), and halt if any required law PDF is missing.

Verify `deal-facts.md`. Save.

### Step 5 — continue the pipeline

**Format → Drafter → Verifier → Refiner → Overseer** run in sequence. At the end:

- `draft-v1.docx` — initial draft
- `verification-report.md` — Verifier flags (stamp-duty cross-foot, DPDP-clause check, arbitration-clause workability, Section 10 ICA essentials)
- `draft-v2.docx` — Refiner output (real party names re-substituted from local mapping)
- `opposing-notes.md` — Overseer critique
- `final-draft.docx` — for your review

### Step 6 — review, sign, stamp, execute

Open `final-draft.docx`. Verify every clause. Verify the stamp note. Verify the governing-law and arbitration clauses are exactly as commercially intended. Get both parties' authorised signatories to sign on stamp paper of the prescribed value. **You are responsible for the contract. The plugin is responsible for the first draft.**

---

## The `contract-config.md` file

Fields the user supplies:

```yaml
governing_law: "the laws of India" | "the laws of the State of Maharashtra and the laws of India"
arbitration_seat: "Mumbai" | "New Delhi" | "Bengaluru" | "Singapore" | "London"
arbitration_institution_rules: "MCIA Rules" | "ICA Rules" | "DIAC Rules" | "SIAC Rules" | "LCIA Rules" | "ICC Rules" | "ad-hoc under the Arbitration and Conciliation Act 1996"
number_of_arbitrators: 1 | 3
arbitration_language: "English"
exclusive_jurisdiction: "the courts at [city]"
stamp_state: "Maharashtra" | "Karnataka" | "Tamil Nadu" | "Delhi" | "[other State]"
registration_state: "[State where the Sub-Registrar's office is located]" | "Not applicable"
contract_type: "MSA" | "NDA" | "EMP" | "LEASE" | "LL" | "SALE" | "GPA" | "SPA" | "SHA" | "WILL" | "LOAN" | "ARB"
personal_data_handled: true | false    # triggers DPDP-clause discipline
fema_ecb_applicable: true | false       # triggers FEMA External Commercial Borrowing overlay
parties:
  - party_role: "[role, e.g. Vendor / Service Provider / Lessor / Employer]"
    party_type: "Individual / Private Limited Company / LLP / Partnership / Sole Proprietorship / HUF / Trust"
    party_jurisdiction: "[State / Country]"
```

---

## Built-in compliance disciplines

The plugin enforces the following disciplines automatically:

1. **Indian Stamp Act 1899 + State Stamp Act discipline** — Verifier cross-foots stamp duty against the applicable State Stamp Act schedule based on `stamp_state` + contract type + consideration.
2. **Registration Act 1908 discipline** — Verifier flags compulsory-registration requirements under Section 17 read with Section 17 + 53A TOPA.
3. **Section 10 Indian Contract Act essentials check** — every contract checked for free consent, consideration, competent parties, lawful object.
4. **Suraj Lamp discipline** — Sale Deed alone conveys title to immovable property; GPA / SPA / Agreement-to-Sell-with-GPA cannot. The plugin refuses any GPA/SPA purporting to convey title.
5. **DPDP Act 2023 clause discipline** — for any contract handling personal data, DPDP-compliant clauses (notice / consent / purpose-limitation / security / breach-notification / sub-processor controls) are inserted.
6. **Arbitration and Conciliation Act 1996 discipline** — explicit seat (BALCO), institutional / ad-hoc choice, number of arbitrators, language, interim-relief mechanism, Section 29A time discipline.
7. **Vidya Drolia non-arbitrability carve-outs** — SARFAESI / IBC / criminal / matrimonial / specific tenancy disputes excluded from arbitration.
8. **PASL Wind Solutions** — two Indian parties may validly choose a foreign seat; flagged where applicable.
9. **FEMA External Commercial Borrowing** — Loan Agreements flagged for ECB compliance where cross-border.
10. **Companies Act 2013 + AoA-alignment** — SHA clauses flagged for AoA-alignment requirement to be enforceable against the Company.

---

## Privacy firewall — extra discipline for commercial content

Contract work routinely contains **commercially-sensitive material** — pricing, equity splits, salary numbers, customer lists, IP, trade secrets, KYC of authorised signatories. The plugin's privacy discipline is stricter than for litigation plugins:

1. **Reader** substitutes every party name, key person, and commercially-sensitive figure (consideration, salary, equity %, share count, royalty rate, KPI thresholds) with structural placeholders before downstream AI processing.
2. The placeholder → real-value mapping is stored in the header of `deal-facts.md` on the user's local machine **only**.
3. **Format / Drafter / Verifier / Overseer** operate only on placeholder-substituted content. The underlying AI runtime never holds raw commercial figures.
4. **Refiner** re-substitutes real values into the final `.docx`, strictly on the user's local machine.
5. `.gitignore` excludes `deal-facts.md` and `contract-config.md` so they cannot be committed accidentally.

---

## Why MIT License

The plugin is released under the **MIT License**. This was a deliberate choice. The alternatives — and why they were rejected — are below.

### MIT vs the alternatives

| License | Suitable for this plugin? | Reasoning |
|---|---|---|
| **MIT** ✅ chosen | Yes | Permissive · 3-line attribution requirement · zero copyleft · zero patent-grant complexity · compatible with the Anthropic Plugin Marketplace TOS · compatible with adoption by mid-market firms, corporate legal departments, and in-house counsel — all of whom routinely block GPL/AGPL on touch · allows a future paid commercial layer under a separate corporate entity. |
| **Apache 2.0** | Close second | Patent grant unnecessary in the Indian context — Section 3(k) Patents Act 1970 makes drafting content unpatentable. |
| **GPL-3.0** | ❌ Disqualifying | Copyleft would propagate to client deal folders. No advocate can ship client material under any open-source licence. |
| **AGPL-3.0** | ❌ Disqualifying | Same as GPL-3, plus network-use clause blocks SaaS integration. |
| **LGPL-3.0** | ❌ Awkward | Library exception does not fit a plugin producing executable contract instruments. |
| **BSD-3-Clause / BSD-2-Clause** | Functionally equivalent | No practical advantage over MIT. |
| **Unlicense / CC0** | ❌ Forfeits authorship | Drops copyright assertion + moral rights under Section 57 Copyright Act 1957. |
| **Creative Commons (any variant)** | ❌ Wrong instrument | CC is for content not software. |

### One-paragraph rationale

Indian advocates, in-house counsel, and the mid-market law firms that draft the highest volume of commercial contracts in India must be able to clone, fork, adapt, and integrate this plugin alongside privileged client material — which in transactional practice includes deal-specific consideration, equity splits, KPIs, and trade secrets — without the licence propagating into their deal folders or attaching to the contracts they file. Only MIT (and equivalently BSD and Apache 2.0) satisfies that constraint. MIT was preferred over Apache 2.0 because the patent-grant language Apache adds carries no benefit in the Indian context (procedural drafting content is unpatentable under Section 3(k) Patents Act 1970), and MIT's three-line clarity is friendlier to advocates and in-house counsel adopting the plugin in chambers.

---

## Sibling plugins

This plugin is one in the **Wolfgang Rush** family of Indian legal-drafting plugins. All thirteen siblings ship under the same six-agent pipeline (Reader → Format → Drafter → Verifier → Refiner → Overseer) and the family-of-plugins doctrine — each plugin narrowly scoped to one practice area / forum:

| Plugin | GitHub repo | Scope |
|---|---|---|
| `supreme-court-drafting` | [supreme-court-drafting-litigation](https://github.com/Wolfgangrush/supreme-court-drafting-litigation) | SLPs · Writ Art 32 · Transfer · Review · Curative — Supreme Court of India |
| `indian-hc-drafting` | [indian-hc-drafting-litigation](https://github.com/Wolfgangrush/indian-hc-drafting-litigation) | Pleadings across all 25 Indian High Courts (bench-config-aware) |
| `district-court-drafting` | [district-court-drafting-litigation](https://github.com/Wolfgangrush/district-court-drafting-litigation) | Plaints · WS · CPC applications · BNSS complaints across 25+ States (state-config) |
| `indian-family-drafting` | [indian-family-drafting-litigation](https://github.com/Wolfgangrush/indian-family-drafting-litigation) | HMA · SMA · IDA · matrimonial · custody · DV Act · maintenance · adoption |
| `indian-contracts-drafting` (this) | [indian-contracts-drafting-litigation](https://github.com/Wolfgangrush/indian-contracts-drafting-litigation) | MSA · NDA · employment · lease · sale · GPA · SHA · will · loan · arbitration |
| `indian-banking-drafting` | [indian-banking-drafting-litigation](https://github.com/Wolfgangrush/indian-banking-drafting-litigation) | DRT · SARFAESI · NI Act 138 · IBC §7 / §95 · DRAT |
| `indian-labour-drafting` | [indian-labour-drafting-litigation](https://github.com/Wolfgangrush/indian-labour-drafting-litigation) | ID Act · POSH · PG · EPF · ESI · MW · IESO + State exemplars |
| `indian-property-drafting` | [indian-property-drafting-litigation](https://github.com/Wolfgangrush/indian-property-drafting-litigation) | Gift · Exchange · Release · Trust · Wakf · Easement · Partition · Settlement · Mortgage · TIR |
| `indian-company-drafting` | [indian-company-drafting](https://github.com/Wolfgangrush/indian-company-drafting) | NCLT (241/242 · 245 · 230-232 · 66 · 252 · 213) · NCLAT (421 + 61) · IBC §9 / §10 |
| `indian-tax-drafting` | [indian-tax-drafting](https://github.com/Wolfgangrush/indian-tax-drafting) | Form 35 CIT(A) · Form 36 ITAT · Form 10A · Sec 148A · 263/264 · 271/270A · 144C · 201 · 260A |
| `indian-consumer-drafting` | [indian-consumer-drafting](https://github.com/Wolfgangrush/indian-consumer-drafting) | District / State / NCDRC + medical-negligence + product liability |
| `indian-mact-drafting` | [indian-mact-drafting](https://github.com/Wolfgangrush/indian-mact-drafting) | MV Act 1988 (2019 amended) · Sarla Verma + Pranay Sethi · state-config |
| `indian-ip-drafting` | [indian-ip-drafting](https://github.com/Wolfgangrush/indian-ip-drafting) | Copyright · Trade Marks · Patents · Designs + HC IP Divisions (post-IPAB-abolition) + Anton Piller / John Doe |

Each plugin can be installed independently, each plugin's Rule 36 firewall is narrow and reviewable, each plugin's bench / forum discipline is depth-validated within its scope, and the user installs only what they need.

---

## Why this exists

Indian contract practice sits at the intersection of (a) the substantive law in the Indian Contract Act 1872 — common-law foundations layered with century-and-a-half of judicial construction — (b) the conveyancing discipline in the Transfer of Property Act 1882 + Registration Act 1908 + the State-by-State Stamp Acts (no uniform stamp regime; every State has its own schedule and many have amended their Stamp Acts to close the Suraj Lamp loophole), (c) the new DPDP Act 2023 regime for any contract handling personal data, (d) the arbitration framework under the Arbitration and Conciliation Act 1996 (as substantially amended in 2015 / 2019 / 2021), (e) the Companies Act 2013 for corporate-side contracts, and (f) FEMA + RBI Master Directions for cross-border transactions.

Generic AI tools do not understand this matrix. They confuse Lease with Leave & License (substantial cost-of-registration difference), miss the Section 16(c) Specific Relief Act averment in performance suits, draft GPA-Sale instruments that have been disapproved by the Supreme Court for over a decade, omit DPDP flowdowns from data-handling contracts, write arbitration clauses that fail BALCO seat-vs-venue scrutiny, and confidently cite case-law that does not exist.

This plugin encodes the Indian contract regime structurally. It is most-deeply-validated for the Maharashtra State Stamp Act + Indian Contract Act core; other States' stamp-and-registration overlays will deepen as community contribution arrives.

---

## Roadmap

- [x] **v0.1.0-alpha (current)** — six-agent pipeline + universal contract drafting base + 10 case-type skill scaffolds + Stamp Act + Registration Act + Section 10 ICA + Suraj Lamp + DPDP + Arbitration disciplines
- [ ] **v0.1.x** — bug fixes, clause-library deepening per case-type, citation-discipline refinements, State-Stamp-Act schedule expansion, language-register polish
- [ ] **v0.x onward** — additional contract case-types (SaaS Subscription, MoU, Joint Venture, Distributorship, Franchise, Reseller, Settlement Agreement, Trust Deed, Pledge, Hypothecation, Indemnity, Guarantee, Family Settlement, Partition Deed, Codicil to Will, ESOP plan, Founder Agreement, Term Sheet, Share Subscription Agreement, Convertible Note, SAFE, Demand Promissory Note) — as community contributes
- [ ] **v1.0.0** — Stable release after community-validated use across multiple States and contract types

The roadmap above is intentionally open-ended. Additional case-types and State-specific stamp / registration overlays will arrive in the order advocates and in-house counsel contribute — no central commitment to specific versions.

---

## Contributing

Indian advocates, in-house counsel, and transactional lawyers are invited to contribute:

- State-specific Stamp Act schedule references (with the current Article numbers and rates for each State)
- State-specific Registration Office discipline (Sub-Registrar's jurisdiction, registration fees, mutation procedures)
- Additional case-type skills (the list of "forthcoming" case-types in the Roadmap)
- Industry-specific contract overlays (e.g. SaaS specific clauses, FinTech specific clauses, healthcare specific clauses)
- Updated case-law (especially Constitution Bench / Supreme Court decisions that change the contract / conveyancing / arbitration / DPDP framework)
- Cross-border contract patterns (FEMA / RBI / FCRA / OFAC / EU sanctions compliance clauses)

Open a GitHub issue with the contribution. Pull requests welcome.

This plugin is open source under MIT.

---

## Contact

All inquiries and feedback via **GitHub Issues** on the project repository.

This project does not have an email contact channel and **does not accept private legal-services inquiries through this repository**. No commercial engagement is offered through this plugin or its repository.

*(Future releases may introduce a commercial layer published under a separate corporate entity — at that point this section will be updated. v0.x.x is open-source-only infrastructure with no commercial channel.)*

---

## Author and brand

This plugin is authored by **Rushikesh R. Mahajan**, Advocate, enrolled with the Bar Council of Maharashtra and Goa, practising before the Bombay High Court (Nagpur Bench).

The plugin is published under the **Wolfgang Rush** open-source brand — the author's publishing handle for legal-technology infrastructure. All commits to this repository are signed under the Wolfgang Rush GitHub identity. The real-identity declaration appears here, and again in `NOTICE.md`, so that the Bar Council Rule 36 accountability mechanism (advocate-as-individual responsibility) is preserved transparently rather than displaced by the publishing handle.

---

## Provenance and privilege statement

See [`NOTICE.md`](./NOTICE.md) for the full provenance and privilege statement.

**In brief:** this plugin contains only public procedural knowledge — Indian Contract Act 1872, Transfer of Property Act 1882, Registration Act 1908, Indian Stamp Act 1899 + State Stamp Act schedules, Companies Act 2013, Arbitration and Conciliation Act 1996, DPDP Act 2023, Indian Succession Act 1925, Hindu Succession Act 1956, FEMA 1999 + Regulations, RBI Master Directions, and generic placeholders. It does **not** contain any specific client matter, deal, communication, document, or personal data.

---

## Disclaimer and Bar Council of India Rule 36 compliance

This plugin is **open-source infrastructure released free of cost** under the MIT licence.

**This plugin:**

- Does **not** constitute legal advice.
- Does **not** create an advocate-client relationship between the author and any user.
- Does **not** solicit professional work from any user, group, or audience.
- Does **not** advertise the professional services of the author or any advocate.
- Does **not** offer paid legal services, paid consultations, or commercial legal engagements through this repository or any associated channel.

**It is:**

- A drafting aid for use by **enrolled advocates and in-house counsel** who retain full professional responsibility for every contract drafted.
- A reference implementation of open-source legal-tech infrastructure for Indian contract / conveyancing / estate practice.
- Released under the Bar Council of India Rules, Part VI, Chapter II, Section IV, **Rule 36**.

**Every advocate and counsel using this plugin is reminded:** the advocate retains full professional responsibility for the verification of facts, the accuracy of citations, the correctness of legal grounds, the propriety of the operative clauses, the adequacy of the stamp duty, the discipline of registration where applicable, and the signature on every contract executed. AI-generated drafting output is **starting material, not a finished contract**.

---

## License

**MIT.** See [`LICENSE`](./LICENSE) for the full text.

Copyright (c) 2026 Wolfgang Rush. Authored by Rushikesh R. Mahajan, Advocate, publishing under the Wolfgang Rush open-source brand.
