---
name: will-draft
description: Draft a Last Will and Testament under the Indian Succession Act 1925 (applies to Christians, Parsis, and to Hindus / Buddhists / Jains / Sikhs by reason of Sections 57 + 58 + Schedule III of the ISA reading the ISA into the Hindu Succession Act 1956). Governed by the Indian Succession Act 1925 (Sections 57-191) + the Hindu Succession Act 1956 (intestate succession + coparcener overlay for Hindu joint family property) + Muslim Personal Law (separate testamentary discipline — bequest of more than 1/3 estate to non-heirs requires consent of all heirs; intestate succession by Quranic shares; Muslim Wills are NOT under the ISA). The Drafter applies the correct discipline per the testator's religion. Auto-fires on "draft will", "draft testamentary", "draft Last Will", "draft codicil", and similar trigger phrases.
allowed-tools: Read, Write, Edit, Bash, Glob
---

# Will Draft Skill

Extends: `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`
Common rules: `${CLAUDE_PLUGIN_ROOT}/skills/_drafting_common/SKILL.md`

## Case-type metadata

```yaml
case_type_line: LAST WILL AND TESTAMENT
case_short_code: WILL
testator_religion: hindu | christian | parsi | muslim | other     # per deal-facts; the Drafter applies correct discipline
operative_clauses:
  - "Identity of the Testator — full name, age, religion, residence, mental capacity declaration ('I being of sound mind, memory and understanding')"
  - "Revocation of Prior Wills — explicit revocation of all prior testamentary instruments"
  - "Appointment of Executor(s) — primary and alternate; powers of the Executor under Section 211 ISA"
  - "Bequest of Property — specific bequests + residuary bequest; clear identification of beneficiaries; survival contingencies; alternate beneficiaries on prior death of primary"
  - "Trust Bequest — where beneficiary is minor / incapacitated, bequest to a trustee for benefit of beneficiary"
  - "Funeral and Cremation Wishes (optional)"
  - "Statement of Independent Will — 'this Will is made of my own free will, without coercion, undue influence, or fraud'"
  - "Attestation — TWO witnesses, who in turn must witness the testator's signature and sign in the presence of the testator (Section 63 ISA + Section 68 BSA / Section 68 Indian Evidence Act 1872 for proof of execution)"
mandatory_boilerplate: []      # Wills do not carry contract boilerplate; they are unilateral testamentary instruments
stamp_position: "EXEMPT from stamp duty (Article 32 of Schedule I of the Indian Stamp Act 1899). No stamping required."
registration_position: "OPTIONAL (Section 18 Registration Act 1908). Registration is recommended for evidentiary value but is not compulsory. An unregistered Will is equally valid if duly executed and attested under Section 63 ISA."
```

## Critical execution discipline (Section 63 ISA)

A Will is valid only if:

1. The testator signs (or affixes his mark, or another person signs in the testator's presence and by his direction) — at the end of the Will, OR in such manner that it appears the signature was intended to give effect to the writing as a Will
2. **TWO witnesses** attest the Will, each having seen the testator sign / affix mark / acknowledge the signature, and each signing the Will in the presence of the testator

Failure on any of these renders the Will void. The Drafter inserts proper attestation clauses; the Verifier flags any missing element.

## Muslim Personal Law overlay

A Muslim Will is NOT governed by the Indian Succession Act 1925. Under Muslim Personal Law:

- The testator can bequeath only **up to 1/3 of his estate** to non-heirs without the consent of all heirs
- Bequest in favour of an heir requires the consent of all other heirs (whether the bequest is within 1/3 or beyond)
- A Muslim Will need not be in writing (oral wills are valid) — though writing + attestation is strongly recommended
- The remaining 2/3 estate (or whatever portion is not validly bequeathed) devolves by Quranic intestate succession

The Drafter checks the religion field in `deal-facts.md`. If the testator is Muslim, the Drafter applies Muslim Personal Law discipline and writes the bequest within the 1/3 limit (or flags the consent-of-heirs requirement if beyond).

## Hindu Coparcener overlay

For a Hindu testator, the Drafter checks whether the property to be bequeathed is:

- **Self-acquired** — fully bequeathable
- **Ancestral / coparcenary** — under the Hindu Succession (Amendment) Act 2005, the testator's undivided interest in coparcenary property can be bequeathed; the rest goes by survivorship under Hindu Mitakshara coparcenary law (subject to the 2005 amendment treating daughters as coparceners)

The Drafter writes specific clauses for each property and flags ancestral property where bequest is restricted to the testator's undivided interest only.

## Trust Bequests (Indian Trusts Act 1882)

Where the beneficiary is a minor / mentally incapacitated person, the bequest is structured as a trust under the Indian Trusts Act 1882, with a named trustee, terms of the trust, and the trust's dissolution / vesting on the beneficiary's majority or recovery.
