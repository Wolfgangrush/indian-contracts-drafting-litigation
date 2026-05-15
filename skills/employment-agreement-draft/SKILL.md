---
name: employment-agreement-draft
description: Draft an Employment Agreement (employer-employee relationship) OR an Independent Contractor Agreement (principal-contractor relationship). The plugin distinguishes between the two — the employment vs IC distinction has substantial tax, EPF/ESIC, gratuity, labour-code, and DPDP-Act consequences. Governed by the Indian Contract Act 1872 + the four labour codes (Code on Wages 2019 / Industrial Relations Code 2020 / Code on Social Security 2020 / Occupational Safety, Health and Working Conditions Code 2020 — as and when notified) + Payment of Gratuity Act 1972 + Employees' Provident Funds and Miscellaneous Provisions Act 1952 + Employees' State Insurance Act 1948 + Maternity Benefit Act 1961 + the Sexual Harassment of Women at Workplace (Prevention, Prohibition and Redressal) Act 2013 (POSH). Auto-fires on "draft employment agreement", "draft offer letter", "draft IC agreement", "draft independent contractor", "draft consultancy agreement", and similar trigger phrases.
allowed-tools: Read, Write, Edit, Bash, Glob
---

# Employment Agreement Draft Skill

Extends: `${CLAUDE_PLUGIN_ROOT}/skills/_contract_drafting_base/SKILL.md`
Common rules: `${CLAUDE_PLUGIN_ROOT}/skills/_drafting_common/SKILL.md`

## Case-type metadata

```yaml
case_type_line: EMPLOYMENT AGREEMENT | INDEPENDENT CONTRACTOR AGREEMENT
case_short_code: EMP | IC
contract_type: employment | independent_contractor             # per deal-facts
typical_parties: Employer + Employee | Principal + Contractor
operative_clauses_employment:
  - "Position and Reporting — title, department, reporting manager"
  - "Place of Work and Working Hours — office / hybrid / remote; standard hours + overtime treatment"
  - "Compensation — CTC breakup: Basic + HRA + Special Allowance + Statutory contributions (EPF / ESIC / Professional Tax) + Variable / Performance Bonus + ESOP-grant reference if applicable"
  - "Statutory Benefits — EPF contribution + ESIC (where applicable) + Gratuity (Payment of Gratuity Act 1972) + Bonus (Payment of Bonus Act 1965, where applicable) + Maternity Benefits (Maternity Benefit Act 1961)"
  - "Leave Policy — earned / casual / sick / maternity / paternity / bereavement — reference to company HR manual"
  - "Notice Period — N days for both sides; payment in lieu option"
  - "Probation — N months, conversion to permanent on satisfactory performance"
  - "POSH Compliance — the Employer maintains an Internal Complaints Committee (ICC) under the POSH Act 2013; Employee is bound by the POSH Policy"
  - "Confidentiality and IP Assignment — all work-for-hire IP belongs to the Employer; assignment language under Sections 17 + 19 Copyright Act 1957"
  - "Non-Solicit Post-Termination — N months, reasonable scope"
  - "Section 27 ICA Caveat — non-compete during employment is enforceable; post-employment non-compete is void as restraint of trade"
  - "Data Protection — Employee's personal data handled per Employer's DPDP-compliant Privacy Policy"
operative_clauses_ic:
  - "Nature of Engagement — explicitly NOT an employment; Contractor is an independent professional"
  - "No EPF / ESIC / Gratuity — Contractor responsible for own statutory compliance"
  - "Fees and Payment — invoice-based, GST + TDS treatment, no monthly salary"
  - "Tools, Premises — Contractor uses own; reimbursement framework if any"
  - "No Right to Direct Day-to-Day Work — Principal specifies outcomes; Contractor controls means"
  - "IP — work-for-hire structure with explicit assignment language"
  - "Termination — for cause / for convenience with notice"
mandatory_boilerplate:
  - dispute_resolution_arbitration
  - governing_law
  - notices
  - severability
  - entire_agreement
stamp_position: "Article 5 (Agreement) — typically ₹100-500; some States have a specific Employment Contract article"
registration_position: "Not compulsorily registrable"
```

## Critical distinction — employment vs IC

The same set of facts can be characterised as employment OR IC. The Verifier checks for misclassification risk by looking at the substantive indicators:

- **Control over how work is done** — employer-side direction → employment; outcome-only specification → IC
- **Tools and premises** — provided by principal → employment; contractor uses own → IC
- **Exclusivity** — full-time, exclusive engagement → employment; non-exclusive → IC
- **Payment structure** — monthly salary with EPF / ESIC → employment; project-fee invoice with GST → IC
- **Statutory benefits** — provided → employment; not provided → IC

Mis-classification carries tax, EPF, gratuity, and labour-code liability for the employer side; the Verifier flags any IC agreement that contains substantive employment-indicators.

## DPDP-Act 2023 implications

Employment contracts handle employee personal data extensively (KYC, contact, biometric for attendance, health data via medical insurance, financial data via bank account, family/dependants). The Drafter inserts DPDP-compliant clauses + cross-references the Employer's Privacy Notice (Section 5 DPDP) and Consent (Section 6 DPDP).
