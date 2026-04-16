---
name: swot
description: >
  Perform a comprehensive, evidence-based SWOT analysis (Strengths, Weaknesses, Opportunities, Threats) on any business — by researching a company via web search, analyzing pasted text, or reading an uploaded file. Outputs BOTH a structured JSON file AND a branded Upscale Excel workbook (.xlsx). This SWOT is designed as a synthesis tool — every item traces to evidence and can reference source analyses (9 Cs, PESTLE). Includes TOWS matrix with cross-quadrant strategies (SO, WO, ST, WT). Use this skill whenever the user mentions 'SWOT', 'strengths weaknesses opportunities threats', 'strategic assessment', 'TOWS matrix', or wants to synthesize internal and external factors for strategic planning. The Excel output uses Upscale brand colours (Eerie Black #191919, Lime Green #34C52A, Dark Cyan #429792, Ivory #FEFFEA) and Lexend font throughout.
---

# SWOT Analysis Skill

## Overview

This skill performs comprehensive, evidence-based SWOT analysis on any business entity. Unlike generic SWOT templates, this implementation emphasizes traceability and synthesis:

- **Strengths + Weaknesses = Internal factors** (organizational capabilities, resources, structure)
- **Opportunities + Threats = External factors** (market conditions, industry dynamics, environmental forces)
- **Evidence-driven**: Every item must include source analysis reference, evidence detail, and confidence level
- **Synthesis tool**: Designed to build on prior analyses (9 Cs, PESTLE) or incorporate primary research
- **Strategic application**: Includes TOWS matrix for converting SWOT into actionable strategies (SO, WO, ST, WT)
- **Dual output**: Structured JSON for data integration + branded Excel for presentation and decision-making

## Input Modes

The skill accepts three input modes:

### 1. Company Name Search
Provide a company name; the skill runs web research to gather strategic data, then synthesizes into SWOT factors.

### 2. Pasted Business Context
Paste business information, market analysis, financial summaries, or prior strategic analyses (e.g., 9 Cs or PESTLE). The skill extracts and organizes into SWOT.

### 3. File Upload
Upload a document (PDF, text, or Excel) containing business data, research, or prior analyses. The skill reads and analyzes to build SWOT.

## Core Methodology

### SWOT Item Structure

Every item in the SWOT matrix includes:

- **Statement**: 20–50 word description of the factor
- **Quadrant**: strength | weakness | opportunity | threat
- **Evidence**: 
  - *source_analysis*: pestle | 9cs | primary_research | financial_data | market_data | other
  - *source_element*: Reference to the originating element (e.g., "Economic_PESTLE", "Competitors_9Cs")
  - *detail*: Supporting evidence, specific data, or observation
  - *confidence*: high | medium | low
- **Impact Score**: 1–10 (severity of the factor on business success)
- **Likelihood Score**: 1–10 (probability or certainty of the factor)
- **Priority Score**: Calculated as (impact × likelihood) / 10
- **Strategic Implication**: How this factor affects strategic options

### Scoring & Prioritization

- **Impact Score (1–10)**: How significantly does this factor influence business outcomes? (1 = minor, 10 = critical)
- **Likelihood Score (1–10)**: How certain or probable is this factor? (1 = unlikely, 10 = certain/current)
- **Priority Score**: (impact × likelihood) / 10, yielding a 1–10 priority ranking
- Items are ranked by priority to surface the most important factors for strategy

### TOWS Matrix

The TOWS matrix converts SWOT into four strategic direction:

- **SO Strategies** (Strengths + Opportunities): Leverage organizational strengths to exploit market opportunities
- **WO Strategies** (Weaknesses + Opportunities): Overcome internal weaknesses by pursuing opportunities
- **ST Strategies** (Strengths + Threats): Use organizational strengths to defend against or mitigate threats
- **WT Strategies** (Weaknesses + Threats): Minimize weaknesses and avoid threats

Each strategy includes:
- Strategy name and description
- Linked SWOT items (traceability)
- Priority (critical | high | medium | low)
- Effort (high | medium | low)
- Timeframe (immediate | short_term | medium_term | long_term)
- Expected impact (transformative | high | moderate | low)

## Output Deliverables

### 1. JSON File (swot_analysis.json)

Complete structured data following the schema in `references/schema.md`:
- Company metadata and analysis date
- Data sources cited
- Executive summary
- All SWOT items with full evidence and scoring
- TOWS matrix strategies
- Overall strategic position and aggregate scores
- Top priorities ranked by impact
- Evidence coverage metrics

### 2. Excel Workbook (swot_analysis.xlsx)

Branded Upscale presentation workbook with seven sheets:

#### Overview Sheet
- 2×2 SWOT matrix summary (strength/weakness count, opportunity/threat count)
- Key scores: Internal (S vs W), External (O vs T), Overall strategic position
- Executive summary
- Top 5 priorities list

#### S Strengths Sheet
- Count and average priority score
- Table: Statement | Evidence Source | Evidence Detail | Impact | Likelihood | Priority | Confidence

#### W Weaknesses Sheet
- Count and average priority score
- Table: Statement | Evidence Source | Evidence Detail | Impact | Likelihood | Priority | Confidence

#### O Opportunities Sheet
- Count and average priority score
- Table: Statement | Evidence Source | Evidence Detail | Impact | Likelihood | Priority | Confidence

#### T Threats Sheet
- Count and average priority score
- Table: Statement | Evidence Source | Evidence Detail | Impact | Likelihood | Priority | Confidence

#### TOWS Matrix Sheet
Four sections:
- **SO Strategies**: Strategy Name | Description | Linked Items | Priority | Effort | Timeframe
- **WO Strategies**: Strategy Name | Description | Linked Items | Priority | Effort | Timeframe
- **ST Strategies**: Strategy Name | Description | Linked Items | Priority | Effort | Timeframe
- **WT Strategies**: Strategy Name | Description | Linked Items | Priority | Effort | Timeframe

#### Evidence Map Sheet
Traceability table linking each SWOT item to its source:
- Item Statement | Quadrant | Source Analysis | Source Element | Evidence Detail | Confidence

### Brand Styling (Excel)

All sheets use Upscale brand palette:
- **Primary**: Eerie Black (#191919) for headers, text
- **Accent**: Lime Green (#34C52A) for highlights, scores
- **Secondary**: Dark Cyan (#429792) for sub-sections
- **Background**: Ivory (#FEFFEA) for cell backgrounds
- **Font**: Lexend throughout for modern, accessible typography

## Quality Checklist

Before finalizing output, verify:

- [ ] **Evidence Traceability**: Every item has source analysis, source element, and detail
- [ ] **Quadrant Integrity**: S+W items are internal; O+T items are external (no mixing)
- [ ] **Scoring Logic**: Impact and likelihood scores are justified in evidence detail
- [ ] **Balanced Analysis**: No quadrant is empty; typically 4–8 items per quadrant
- [ ] **TOWS Coverage**: At least one strategy per TOWS quadrant (SO, WO, ST, WT)
- [ ] **Executive Summary**: 3–5 sentences capturing key findings and strategic position
- [ ] **Top Priorities**: At least 3–5 items with highest priority scores are highlighted
- [ ] **Data Sources**: All data sources listed; data no older than 12 months (if market/financial data)

## Usage Examples

### Example 1: Web Search Mode
```
User: "Run a SWOT analysis on Tesla"
→ Skill searches for Tesla company info, financials, market position, competitive landscape
→ Extracts strengths (innovation, brand), weaknesses (scaling, competition), opportunities (EV growth), threats (legacy automakers, supply chain)
→ Builds SWOT with evidence links to financial data, market research, competitor reports
→ Outputs JSON + branded Excel workbook
```

### Example 2: Pasted Context Mode
```
User: "I ran a 9 Cs analysis on our SaaS startup. Here's the output: [9 Cs data]... Now run SWOT based on this."
→ Skill parses 9 Cs analysis (Company, Collaborators, Customers, Competitors, etc.)
→ Maps insights to SWOT: Strengths from Company & Collaborators, Weaknesses from gaps, Opportunities from Customers & market trends, Threats from Competitors
→ Outputs JSON + Excel with 9 Cs traceability
```

### Example 3: File Upload Mode
```
User: "Here's our last PESTLE analysis [uploads PDF]. Can you convert to SWOT?"
→ Skill reads PDF, extracts PESTLE factors (Political, Economic, Social, Technological, Legal, Environmental)
→ Maps external factors (Economic, Technological, Legal, Environmental) to Opportunities & Threats
→ Conducts internal assessment of company capabilities to build Strengths & Weaknesses
→ Outputs JSON + Excel with PESTLE cross-reference
```

## Integration with Other Analyses

This SWOT skill is designed to work with:

- **9 Cs Analysis**: Map Company, Collaborators, Customers, Competitors to SWOT factors
- **PESTLE Analysis**: External factors (Political, Economic, Social, Tech, Legal, Environmental) map directly to Opportunities & Threats
- **Porter's Five Forces**: Competitive forces inform Opportunities, Threats, and Weaknesses
- **Financial Analysis**: Revenue, margin, cash flow trends inform Strengths and Weaknesses

When synthesizing from prior analyses, always cite the source element in the evidence field.

## File Structure

```
swot/
├── SKILL.md                    (this file)
├── references/
│   └── schema.md               (JSON schema documentation)
└── scripts/
    └── build_excel.py          (Excel workbook generator)
```

## Dependencies

- Python 3.8+
- openpyxl (Excel generation)
- json (data serialization)

## Support & Notes

For questions or enhancements, refer to the schema documentation in `references/schema.md` or review example JSON outputs in the skill's output folder.
