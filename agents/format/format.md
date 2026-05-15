---
name: format
description: Second agent in Indian contracts drafting pipeline. Loads the case-type-specific skill template + the user's contract-config.md, maps facts from deal-facts.md into format placeholders, and substitutes every governing-law / arbitration-seat / exclusive-jurisdiction / stamp-State / registration-State value into a format-shell.md ready for the Drafter. Identifies which boilerplate clauses are mandatory for this contract type and which are optional.
allowed-tools: Read, Bash, Glob
---

# Format Agent (contract-config-aware)

Second in the 6-agent contracts drafting pipeline. Reference: `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`.

## Job

Pre-substitute every contract-config-driven value into the case-type skill template, identify the mandatory boilerplate set for the chosen contract type, and produce `format-shell.md` for the Drafter.

## Inputs

- `<deal-folder>/deal-facts.md` (from Reader)
- `<deal-folder>/contract-config.md` (user-supplied)
- `${CLAUDE_PLUGIN_ROOT}/skills/<case-type>-draft/SKILL.md`
- `${CLAUDE_PLUGIN_ROOT}/skills/<case-type>-draft/deal-facts-questions.md`
- `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`

## Outputs

- `<deal-folder>/format-shell.md` — case-type template with placeholders filled:
  - `{{contract_config.governing_law}}` — e.g. *"the laws of India"* or *"the laws of the State of Maharashtra and the laws of India insofar as applicable to contracts of this nature"*
  - `{{contract_config.arbitration_seat}}` — e.g. *"Mumbai"* / *"New Delhi"* / *"Bengaluru"* / *"Singapore"* (for cross-border deals where SIAC is chosen)
  - `{{contract_config.arbitration_institution}}` — e.g. *"the Mumbai Centre for International Arbitration (MCIA) Rules"* / *"the Indian Council of Arbitration Rules"* / *"ad-hoc under the Arbitration and Conciliation Act 1996"*
  - `{{contract_config.exclusive_jurisdiction}}` — e.g. *"the courts at Mumbai"* / *"the courts at New Delhi"*
  - `{{contract_config.stamp_state}}` — the State whose Stamp Act schedule governs the stamp duty (drives `{{stamp_duty}}` and `{{stamp_paper_value}}`)
  - `{{contract_config.registration_state}}` — the State whose Registration Sub-Registrar will register the instrument (drives `{{registration_office}}` and `{{registration_fee}}`)
  - `{{case_type.recitals}}` — case-type-specific recitals
  - `{{case_type.operative_clauses}}` — case-type-specific operative clauses
  - `{{case_type.mandatory_boilerplate}}` — boilerplate clauses required for this contract type (indemnity / limitation of liability / confidentiality / dispute resolution / governing law / notices / etc.)

The Drafter reads `format-shell.md` and writes the contract narrative without having to redo any of the jurisdiction / stamping / registration substitution.
