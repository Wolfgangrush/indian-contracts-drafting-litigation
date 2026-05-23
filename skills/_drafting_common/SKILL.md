---
name: _drafting_common
description: Shared reference for all contract / conveyancing / estate drafting skills. Holds the anti-pollution rules, the privacy firewall protocol (party names + key persons + commercially-sensitive figures substituted with placeholders before downstream AI processing; real-value re-substitution local-only in the Refiner step), the AI-style-marker blacklist, citation-discipline rules, Indian Stamp Act 1899 + applicable State Stamp Act schedule discipline, Registration Act 1908 + TOPA Section 17 / 53A compulsory-registration discipline, Indian Contract Act 1872 Section 10 essentials check, Suraj Lamp v. State of Haryana (2012) discipline (GPA cannot effect title transfer), DPDP Act 2023 clause discipline for any contract handling personal data, and Arbitration and Conciliation Act 1996 (as amended 2015 / 2019 / 2021) discipline. NOT invoked directly — referenced from every case-type skill in this plugin.
allowed-tools: Read
---

# `_drafting_common` — shared contracts drafting infrastructure

## Privacy firewall

Contract work routinely contains commercially-sensitive material — pricing, equity splits, salary numbers, customer lists, IP, trade secrets, KYC of authorised signatories. The plugin's privacy discipline:

1. **Reader** substitutes every party name, key person's name, and commercially-sensitive figure (consideration, salary, equity %, share count, royalty rate) with structural placeholders before downstream processing.
2. The placeholder → real-value mapping is stored in the header of `deal-facts.md` on the user's local machine **only**.
3. **Format / Drafter / Verifier / Overseer** operate **only** on placeholder-substituted content. The underlying AI runtime never holds raw commercial figures.
4. **Refiner** re-substitutes real values into the final `.docx`, strictly on the user's machine.
5. `.gitignore` excludes `deal-facts.md` and `contract-config.md` so they cannot be committed accidentally.

## AI-style-marker blacklist

Stripped by the Refiner before output:

- Em-dash (`—`) used as sentence-internal pause (replaced with semicolon or comma-bounded clause)
- Sentence-final *thereby* / *hereby* / *whereby* without an attached verb
- *Moreover*, *furthermore*, *additionally*, *in addition* as sentence-openers — replaced with *"The Parties further agree that"* / *"It is further agreed that"*
- *Navigate*, *delve*, *foster*, *robust*, *seamless* (metaphorical uses)
- *It is important to note that*, *it should be noted that*, *worthy of note* — replaced with direct prose
- Bullet-list-style structure in operative clauses (operative clauses are numbered paragraphs, not bullet lists)

## Citation discipline

The Drafter does **not** generate case names + citations from training memory. Every case citation in any explanatory note or recital must trace to a user-supplied source. Untraceable citations become `[CITATION NEEDED]` placeholders.

Headline cases the Verifier scans for fabrication:

- *Suraj Lamp & Industries (P) Ltd. v. State of Haryana (2012) 1 SCC 656* — GPA cannot effect title transfer of immovable property
- *Salem Advocate Bar Association v. Union of India (2005) 6 SCC 344* — Section 89 CPC ADR
- *Centrotrade Minerals & Metals v. Hindustan Copper (2017) 2 SCC 228* — foreign-seat arbitration
- *PASL Wind Solutions v. GE Power (2021) 7 SCC 1* — two Indian parties + foreign-seated arbitration
- *Bharat Aluminium v. Kaiser Aluminium (BALCO) (2012) 9 SCC 552* — Part I / Part II Arbitration and Conciliation Act
- *Indian Oil Corporation v. NEPC India (2006) 6 SCC 736* — anti-arbitration injunctions
- *Vidya Drolia v. Durga Trading Corporation (2021) 2 SCC 1* — arbitrability of disputes

## Indian Stamp Act 1899 + State Stamp Act discipline

Every instrument under this plugin must be executed on stamp paper of the value prescribed under the applicable State Stamp Act schedule. The Verifier independently computes the stamp duty from:

- `contract_config.stamp_state` (Maharashtra Stamp Act 1958 / Karnataka Stamp Act 1957 / Tamil Nadu Stamp Act / Delhi Stamp Act / etc.)
- The contract type (Article number in Schedule I of the applicable Stamp Act)
- The consideration in `deal-facts.md`

Common stamp-duty rules to encode:

- **Sale Deed of immovable property** — ad valorem on market value or consideration, whichever higher (5-7% in most States, plus surcharge / cess where applicable)
- **Lease Deed** — varies by lease tenor (Maharashtra: 0.25% to 5% on average annual rent + premium, depending on lease period)
- **Gift Deed** — ad valorem on market value (concessional rates for family members in most States)
- **Mortgage Deed** — ad valorem on secured amount
- **General Power of Attorney** — typically nominal (₹500-1000), but ad valorem if it authorises sale of immovable property (post-*Suraj Lamp*, GPA + Sale of property attracts the same stamp as a Sale Deed under most amended State Stamp Acts)
- **Will** — exempt from stamp duty under Article 32 of Schedule I of the Indian Stamp Act 1899
- **Affidavit** — ₹10 to ₹100 depending on State
- **Agreement (general / not otherwise provided)** — ₹100 to ₹500 depending on State

## Registration Act 1908 + TOPA Section 17 / 53A discipline

Compulsory registration under Section 17 of the Registration Act 1908:

- Instruments of gift of immovable property (Section 17(1)(a))
- Non-testamentary instruments creating, declaring, assigning, limiting, or extinguishing any right, title, or interest in immovable property of value ₹100 or more (Section 17(1)(b))
- Non-testamentary instruments acknowledging the receipt or payment of consideration for the creation / extinction of such right (Section 17(1)(c))
- Leases of immovable property from year-to-year, or for any term exceeding one year, or reserving a yearly rent (Section 17(1)(d))
- Section 53A TOPA agreements to sell, post-2001 amendment (Section 17(1A))

Consequences of non-registration: Section 49 Registration Act — the instrument cannot be received as evidence of any transaction affecting such property.

## Section 10 Indian Contract Act 1872 essentials check

Every contract drafted by this plugin must satisfy:

- Free consent (Section 14) — not vitiated by coercion (Section 15), undue influence (Section 16), fraud (Section 17), misrepresentation (Section 18), or mistake (Section 20)
- Consideration (Section 2(d), Section 25) — past, present, or future, lawful, real, of some value
- Competent parties (Section 11) — majors, of sound mind, not disqualified by law
- Lawful object (Section 23) — not forbidden by law, not defeating any law, not fraudulent, not injurious to person or property, not immoral, not opposed to public policy

## Suraj Lamp discipline

Per *Suraj Lamp & Industries (P) Ltd. v. State of Haryana (2012) 1 SCC 656* — a Sale Deed alone, registered under the Registration Act, conveys title to immovable property. GPA-Sale, SA-GPA-Will combinations, agreements to sell, etc., **do not** convey title. The plugin's GPA / SPA skills therefore restrict the GPA scope to authorisation acts (act on behalf of the principal in court / before authorities / in correspondence) and refuse to draft any clause purporting to convey title via the GPA.

## DPDP Act 2023 clause discipline

For any contract where `deal-facts.md` records that personal data of any data principal is handled by either party (this covers nearly all employment contracts, MSAs with vendor-side data processing, SaaS contracts, HR-services contracts, marketing-services contracts, payroll contracts, etc.), the Drafter inserts DPDP-compliance clauses covering:

- Notice (Section 5 DPDP Act 2023) — parties acknowledge the notice obligation flowing to the data principal
- Consent (Section 6) — consent mechanisms and the lawful-uses fallbacks (Section 7)
- Data Fiduciary identification (Section 2(i) / Section 8) — who is the Fiduciary for the data processed under this contract
- Data Principal rights flowdown (Sections 11-15) — the Fiduciary's obligations on access / correction / erasure / nomination / grievance redressal
- Security safeguards (Section 8(5)) — reasonable security safeguards
- Breach notification (Section 8(6)) — the obligation to notify the Data Protection Board and affected data principals
- Sub-processor controls (Section 8(2)) — Data Processor / sub-processor contracts must contain back-to-back DPDP obligations
- Data-localisation acknowledgement — pending the Board's notification, parties acknowledge any sectoral data-localisation requirement

## Arbitration and Conciliation Act 1996 discipline

For any contract with an arbitration clause, the Verifier checks:

- **Seat clearly named** — *"The seat of arbitration shall be [City]"* — not *"the venue"* (BALCO distinction)
- **Governing rules** — institutional rules named (MCIA / ICA / DIAC / SIAC / LCIA) or ad-hoc reference to the Arbitration and Conciliation Act 1996
- **Number of arbitrators** — sole arbitrator or three-arbitrator tribunal (mutual-appointment mechanism specified)
- **Language** — *"The language of arbitration shall be English"* (default if not specified)
- **Section 11** vs **Section 9** — interim measures jurisdiction acknowledged
- **Stamping** — arbitration agreement on appropriate stamp under the State Stamp Act
- For **cross-border deals** — *PASL Wind Solutions* applicability check (two Indian parties choosing foreign seat is now permissible)


---

## v0.2.1 RENDER DISCIPLINE (load-bearing — Drafter must follow)

**Pandoc + reference.docx + post-pandoc fix script.** The Drafter writes Markdown using the heading discipline below. Pandoc converts the Markdown to `.docx` using the SHIPPED reference.docx at `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/reference.docx` — pre-customised with locked Word styles matching the filing-grade Bombay HC Nagpur convention (extracted from an actual filed Second Appeal pleading):

- **Body (Normal)** — TNR 14pt, 1.5 line spacing, justified, 0.5cm first-line indent
- **Heading 1** — TNR 14pt **bold + centered** (NOT underlined) — for the Court / Forum / Tribunal header line and the case-number line
- **Heading 2** — TNR 14pt **bold + UNDERLINED + centered + letter-spacing** — for spaced section headers (`F A C T S`, `G R O U N D S`, `P R A Y E R`, `I N D E X`, `S Y N O P S I S`, `L I S T   O F   A N N E X U R E S`, `V E R I F I C A T I O N`)
- **Heading 3** — TNR 14pt **bold + UNDERLINED + centered** — for unspaced section headers (`SUBSTANTIAL QUESTIONS OF LAW`, `ACTS & RULES`, `CITATIONS`) and statutory opening (`WRIT PETITION UNDER ARTICLE 226 …`)
- **Heading 4** — TNR 14pt **bold + UNDERLINED + left-aligned** — for left-anchored bold-underlined headings (`MOST RESPECTFULLY SHEWETH:`)
- **Tables** — `tblLayout = fixed`; first row bold centered; cell margins locked

### Markdown heading mapping

| Markdown | Rendered as | Used for |
|---|---|---|
| `# Heading 1` | Bold centered (no underline) | Court header line; case-number line; cover-page anchors |
| `## Heading 2` | Bold centered UNDERLINED with letter-spacing | Spaced section headers (`## F A C T S`, `## G R O U N D S`, `## P R A Y E R`, `## I N D E X`, `## S Y N O P S I S`, `## L I S T   O F   A N N E X U R E S`, `## V E R I F I C A T I O N`) |
| `### Heading 3` | Bold centered UNDERLINED | Unspaced section headers + statutory opening |
| `#### Heading 4` | Bold left UNDERLINED | `#### MOST RESPECTFULLY SHEWETH:` |
| Body paragraph | TNR 14pt justified 1.5 spacing 0.5cm first-line indent | Everything else |
| `**Bold inline**` | Bold | Property descriptors / annexure markers / key terms inline within Facts narrative |

### Bold-number paragraph convention

Facts and Grounds paragraphs use **BOLD NUMBERS**: `**1.**`, `**2.**`, `**3.**` followed by a tab + body. Renders as the gold-standard pleading layout.

### Two-step pandoc command (Step 2 is NON-NEGOTIABLE)

```bash
# Step 1 — pandoc → .docx with locked Word styles
pandoc draft-v1.md -o draft-v1.docx \
  --reference-doc="${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/reference.docx" \
  --from=markdown+pipe_tables+raw_tex

# Step 2 — force table column widths
python3 "${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/fix_docx_tables.py" draft-v1.docx
```

Step 2 forces column widths on every table — 5-col (Sr.No / Annx / Particulars / Date / Pgs) = 8/8/60/14/10; 4-col = 10/10/65/15; 3-col = 10/75/15; 2-col Dates–Events = 18/82. Locks first-row bold + centered + vertically-centered cells. **Skipping the fix script reproduces the v0.2.0 Index-table defect (Sr.No / Annx columns stacking vertically).**

Do NOT auto-generate a fresh reference.docx in the case folder. Use the shipped one or a `<case-folder>/reference.docx` override.

### Cover-page discipline

INDEX, SYNOPSIS, LIST OF ANNEXURES each begin on a new page (`\newpage` in Markdown) and carry ONLY: forum header (`#`) + case-number line (`#`) + short cause-title (Petitioner short name `///VERSUS///` Respondent short name) + section header (`##`) + table + Counsel block. DO NOT repeat the full party address block on cover pages.

### Pipeline-optionality (advocate-cost discipline)

The full 6-agent pipeline (Reader → Format → Drafter → Verifier → Refiner → Overseer) is **NOT** mandatory. Only the first three stages are required to produce a filing-grade draft. Stages 4–6 are OPTIONAL QC layers the advocate explicitly invokes. Default exit point is here, after Drafter (~280K tokens). Full pipeline ~600K tokens — disproportionate for routine pleadings.

When `draft-v1.docx` is written, the Drafter's job is complete. The advocate decides whether to invoke the QC stages.
