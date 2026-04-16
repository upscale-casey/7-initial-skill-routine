---
name: data-tech-audit
description: >
  Perform a comprehensive Data & Technology Audit on any business — covering first-party data estate, MarTech stack analysis, analytics capability maturity, measurement and attribution framework, data privacy/compliance, and technology debt assessment. Works by researching a company via web search, analyzing pasted text, or reading an uploaded file. Outputs BOTH a structured JSON file AND a branded Upscale Excel workbook (.xlsx). Use this skill whenever the user mentions 'data audit', 'tech audit', 'technology audit', 'MarTech stack', 'martech audit', 'analytics maturity', 'attribution framework', 'data estate', 'data governance', 'tech debt', 'technology debt', 'measurement framework', or wants to assess a company's data and technology infrastructure. Also trigger for 'CDP', 'consent management', 'data quality', 'analytics capability', or 'marketing technology assessment'. The Excel output uses Upscale brand colours (Eerie Black #191919, Lime Green #34C52A, Dark Cyan #429792, Ivory #FEFFEA) and Lexend font throughout.
---

## Overview

The Data & Technology Audit skill provides a comprehensive assessment of a company's data and technology infrastructure. It evaluates six critical dimensions and outputs actionable intelligence in two formats: structured JSON data and a branded Excel workbook.

## Two Deliverables

1. **Structured JSON File** – Machine-readable audit data with all findings, scores, and recommendations
2. **Branded Excel Workbook** – Executive-friendly visualization with Upscale brand colors (Eerie Black #191919, Lime Green #34C52A, Dark Cyan #429792, Ivory #FEFFEA) and Lexend font

## Input Modes

The skill accepts data in three ways:

1. **Web Search** – Research a company by name and analyze its public data and technology presence
2. **Pasted Text** – Analyze text descriptions of a company's data/tech setup
3. **File Upload** – Process company documentation, assessment results, or existing audit data

## Six Audit Sections

Each section is scored on a scale of 1–10 and includes strengths, weaknesses, and actionable recommendations.

### 1. First-Party Data Estate
Assess the company's owned data sources, collection mechanisms, and data quality.

- Data sources: CRM, website, app, POS, IoT, survey, social, other
- Data quality dimensions: completeness, accuracy, timeliness, consistency
- Data governance maturity
- Customer view unification and CDP/warehouse presence
- Real-time capability assessment

### 2. MarTech Stack
Evaluate the marketing technology vendor ecosystem, integration health, and cost efficiency.

- Complete inventory of tools with cost and utilization estimates
- Category coverage analysis (missing vs. redundant tools)
- Integration health: excellent → good → adequate → poor
- Vendor concentration risk
- Consolidation and cost-saving opportunities

### 3. Analytics Capability
Measure the maturity and effectiveness of the company's analytics function.

- Maturity model: Descriptive → Diagnostic → Predictive → Prescriptive
- Current state: tools, team size, skill level, and gaps
- Data literacy across the organization
- Reporting cadence and self-service analytics maturity

### 4. Measurement & Attribution
Assess the company's ability to measure and attribute marketing impact.

- Attribution model in use (first-touch, last-touch, algorithmic, etc.)
- Attribution maturity level
- Identity resolution capability and method
- Measurement gaps and KPI framework
- Experimentation capability (A/B testing, incrementality, MMM)

### 5. Privacy & Compliance
Review data privacy, regulatory alignment, and consent management.

- Regulatory scope (GDPR, CCPA, etc.)
- Consent management platform status
- Data subject rights automation
- Privacy-by-design implementation
- Vendor DPA coverage and audit trails
- Risk assessment and key vulnerabilities

### 6. Technology Debt
Evaluate the state of legacy systems and code quality.

- Technology debt score and percentile assessment
- Legacy system inventory, age, and risk levels
- Maintenance vs. innovation ratio
- Code quality indicators (test coverage, documentation)
- Modernization roadmap and remediation effort

## Scoring & Assessment

**Overall Score** 1–10 provides a snapshot of digital maturity.

**Digital Maturity Tiers:**
- Leading (9–10): Industry benchmark setter
- Advanced (7–8): Competitive advantage through data & tech
- Competent (5–6): Functional capabilities, some optimization opportunities
- Developing (3–4): Foundational investments, significant gaps
- Nascent (1–2): Early stage, critical infrastructure needs

## Quality Checklist

Before finalizing the audit, verify:

- [ ] All six sections completed with scores and justification
- [ ] At least 2 strengths and 2 weaknesses per section
- [ ] Specific, actionable recommendations tied to findings
- [ ] Tool inventory complete with estimated costs and utilization
- [ ] Data sources identified and quality assessed
- [ ] Maturity levels assigned with supporting evidence
- [ ] Risk factors clearly articulated
- [ ] Overall score reflects weighted assessment of all sections
- [ ] Executive summary captures key insights and top 3 priorities
- [ ] JSON schema validation passed
- [ ] Excel workbook branded with Upscale colors and fonts
- [ ] All visualizations (tables, maturity model) clearly formatted

## Output Files

- **[Company]_data_tech_audit.json** – Complete audit data structure
- **[Company]_data_tech_audit.xlsx** – Branded Excel workbook with 8 sheets:
  - Overview (scorecard, executive summary, digital maturity, priorities)
  - → Data Estate
  - → MarTech Stack (with tools inventory table)
  - → Analytics (with maturity model visualization)
  - → Measurement
  - → Privacy
  - → Tech Debt (with legacy systems table)
  - Dynamics (cross-section interactions)
