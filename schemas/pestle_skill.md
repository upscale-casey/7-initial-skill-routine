---
name: pestle
description: >
  Perform a comprehensive PESTLE analysis (Political, Economic, Social, Technological, Legal, Environmental) on any business or market. Research a company/industry via web search, analyze pasted text, or read an uploaded file. Outputs BOTH a structured JSON file AND a branded Upscale Excel workbook (.xlsx). Use this skill whenever the user mentions 'PESTLE', 'PEST', 'macro analysis', 'macro environment', 'external environment analysis', 'political economic social technological', or wants to understand macro forces affecting a business. Also trigger when the user asks about regulatory risk, market trends, or environmental factors in the context of strategic analysis. The Excel output uses Upscale brand colours (Eerie Black #191919, Lime Green #34C52A, Dark Cyan #429792, Ivory #FEFFEA) and Lexend font throughout.
---

# PESTLE Analysis Skill

## Overview

PESTLE stands for **Political, Economic, Social, Technological, Legal, Environmental**. It is a macro-environment analysis framework that examines external forces shaping a business or market. Each factor is scored on impact and likelihood, then mapped to SWOT opportunities and threats. This skill deepens strategic understanding and feeds directly into SWOT analysis.

## Two Deliverables

This skill produces:

1. **Structured JSON file** – Machine-readable analysis with detailed factor breakdowns, scoring, risk zones, time horizons, and strategic implications
2. **Branded Excel workbook** – Professional, Upscale-branded (.xlsx) with 8 sheets covering overview, per-factor analysis, risk matrix, SWOT feed, and cross-factor dynamics

## Three Input Modes

Choose one:

- **Company/Industry name** – I'll research via web search to gather current data on market trends, regulations, technology, and economic conditions
- **Pasted text** – Analyze text you provide (market report excerpt, company overview, news article, etc.)
- **Uploaded file** – Read and analyze a document (PDF, .docx, .txt, etc.)

## Analysis Standards

For each of the six PESTLE factors, follow this structure:

### Per-Factor Analysis

1. **Identify 3–5 key trends or forces** within that factor
2. **Score each trend**:
   - **Impact score** (1–5): How significantly could this trend affect the business? 1 = negligible, 5 = transformative
   - **Likelihood score** (1–5): How probable is this trend to occur or intensify? 1 = unlikely, 5 = highly probable
3. **Calculate priority_score** = impact_score × likelihood_score (range: 1–25)
4. **Classify risk zone**:
   - **Low** (1–6): minimal threat; manageable
   - **Medium** (7–12): moderate threat; monitor and plan mitigations
   - **High** (13–19): significant threat; requires immediate strategic action
   - **Critical** (20–25): existential threat; demands urgent intervention
5. **Assign time horizon**: immediate (0–3 months), short_term (3–12 months), medium_term (1–3 years), long_term (3+ years)
6. **SWOT mapping**: Does this factor represent an Opportunity or Threat? Include strategic implication statement
7. **Gather evidence**: 2–3 data points or quotes supporting the trend
8. **Cite sources**: URLs, news outlets, research firms, government reports, etc.

### Summary & Overall Assessment

For each factor, write a 2–4 sentence summary capturing the most critical dynamics. Then assign:
- **Overall impact**: high | medium | low
- **Trend direction**: improving | stable | deteriorating
- **Key risks**: bulleted list (up to 3)
- **Key opportunities**: bulleted list (up to 3)
- **Recommendations**: 2–3 actionable recommendations specific to that factor
- **Factor score** (1–10): holistic rating of that factor's importance to the business

### Top-Level Metrics

Calculate and report:

- **Overall risk score** (1–10): aggregate measure of downside threats across all factors
- **Overall opportunity score** (1–10): aggregate measure of upside potential
- **Overall assessment**: highly_favorable | favorable | neutral | challenging | highly_challenging
- **Risk matrix**: table of all factors with impact, likelihood, priority_score, and risk_zone
- **SWOT feed**: list of opportunities and threats to feed into subsequent SWOT analysis
- **Top priorities**: ranked list of the 3–5 most critical PESTLE factors by priority_score
- **Cross-factor dynamics**: 2–3 observations on how PESTLE factors interact (e.g., "Tech innovation is being stalled by Political uncertainty around IP regulations")

## Quality Checklist

Before finalizing the analysis, verify:

- [ ] All six factors are covered (Political, Economic, Social, Technological, Legal, Environmental)
- [ ] Each factor has 3–5 identified trends with explicit impact and likelihood scores
- [ ] Priority scores are calculated correctly (impact × likelihood)
- [ ] Risk zones are assigned per the 1–6 / 7–12 / 13–19 / 20–25 bands
- [ ] Time horizons are realistic and vary across factors
- [ ] SWOT mappings are clear and actionable
- [ ] Evidence includes specific examples, data points, or quotes
- [ ] Sources are cited (URLs, reports, news outlets, etc.)
- [ ] Executive summary is 3–5 sentences and captures headline findings
- [ ] Recommendations are concrete and prioritized
- [ ] Cross-factor dynamics identify interactions, not just list factors
- [ ] JSON structure matches the schema in `references/schema.md`
- [ ] Excel workbook is branded (Eerie Black, Lime Green, Dark Cyan, Ivory) with Lexend font
- [ ] All sheets are present: Overview, P, E, S, T, L, E, Risk Matrix, SWOT Feed, Cross-Factor Dynamics

## Workflow

1. **Gather input**: Accept company/industry name, pasted text, or file upload
2. **Research** (if needed): Use web search to gather trends, regulations, market data, technology shifts, and environmental factors
3. **Structure analysis**: For each PESTLE factor, identify trends, score, classify risk zone, assign time horizon, map to SWOT
4. **Write summary**: Synthesize into executive summary and per-factor summaries
5. **Generate JSON**: Export structured analysis following `references/schema.md`
6. **Build Excel**: Run `scripts/build_excel.py` to create branded workbook
7. **Deliver both files** to the user for review and strategic planning

## Example Output Structure

**JSON** (detailed):
```json
{
  "company_name": "TechCorp Inc.",
  "industry": "SaaS / Cloud Computing",
  "market_scope": "North America",
  "analysis_date": "2026-04-09",
  "executive_summary": "TechCorp operates in a favorable macro environment with strong tailwinds from AI adoption and cloud migration, offset by regulatory uncertainty around data privacy and AI governance...",
  "political": {
    "summary": "...",
    "factors": [...],
    "overall_impact": "high",
    "trend_direction": "deteriorating",
    "key_risks": ["..."],
    "key_opportunities": ["..."],
    "recommendations": [...],
    "score": 8
  },
  ...
  "overall_risk_score": 7,
  "overall_opportunity_score": 8,
  "overall_assessment": "favorable"
}
```

**Excel** (branded):
- 8 professional sheets with Upscale colors, Lexend font, heatmaps, and sortable tables
- Risk zones color-coded: Low (green), Medium (cyan), High (orange #F5A623), Critical (purple)

## Tips for Effective Analysis

- **Be specific**: Use real market data, regulatory trends, competitor moves, not generic observations
- **Time horizons matter**: A trend relevant in 3 months requires different action than one 3 years out
- **SWOT integration**: Frame each trend as either an opportunity to exploit or a threat to mitigate
- **Cross-factor thinking**: Point out how factors interact (e.g., Tech enables Social change, but Legal may restrict it)
- **Evidence-driven**: Back every claim with a source or data point
- **Actionable**: Ensure recommendations can be implemented, not just aspirational

## Schema Reference

See `references/schema.md` for the complete JSON structure, sub-object definitions, and validation rules.
