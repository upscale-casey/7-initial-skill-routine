---
name: 9cs
description: >
  Perform a comprehensive 9 Cs analysis (Company, Customers, Consumers, Category, Competitors, Collaborators, Climate, Culture, Community) on any business — by researching a company name via web search, analyzing pasted business text, or reading an uploaded file. Outputs BOTH a structured JSON file AND a branded Upscale Excel workbook (.xlsx). Use this skill whenever the user mentions '9 Cs', '9Cs', '9C analysis', '360 business analysis', 'stakeholder analysis', wants a comprehensive business lens across company and market dimensions, or asks to 'analyze the business holistically'. Also trigger when the user asks about competitive landscape, organizational culture assessment, or community/stakeholder impact in the context of a full business analysis. The Excel output uses Upscale brand colours (Eerie Black #191919, Lime Green #34C52A, Dark Cyan #429792, Ivory #FEFFEA) and Lexend font throughout.
---

# 9 Cs Excel Skill

Produces two deliverables from a single analysis run:
1. `{company}_9cs_analysis.json` — the full structured analysis covering all 9 Cs
2. `{company}_9cs_analysis.xlsx` — a branded Upscale Excel workbook with one sheet per C plus an Overview and Cross-C Dynamics sheet

## Workflow

1. **Read the 9Cs schema** from `references/schema.md`
2. **Determine input mode** — company name research, pasted text analysis, or uploaded file
3. **Research the company** — use web search and web fetch across all nine Cs (company financials, customer segments, consumer insights, category trends, competitors, partners, macro environment, culture, community impact). Record all source URLs.
4. **Analyse** each C systematically, filling every field in the schema
5. **Save the JSON** to `/mnt/user-data/outputs/{slug}_9cs_analysis.json`
6. **Build the Excel workbook** by running the bundled script:
   ```bash
   python scripts/build_excel.py \
     --json /mnt/user-data/outputs/{slug}_9cs_analysis.json \
     --out  /mnt/user-data/outputs/{slug}_9cs_analysis.xlsx
   ```
   Note: run the script from the skill's own directory so relative imports resolve, or pass the full path to the script.
7. **Recalculate** with `python /mnt/skills/public/xlsx/scripts/recalc.py {xlsx_path} 30`
8. **Present both files** using `present_files`
9. **Print a chat summary**: company name, industry, the nine C scores, overall score, and top 3 priorities

## Three Input Modes

### Mode 1: Company Name Research
- User provides company name
- Execute web search for company name + each C dimension
- Fetch and analyze company website, investor relations, industry reports, news, social media
- Deep dive into financials (if public), customer reviews, market analysis, ESG reports, cultural reviews

### Mode 2: Pasted Business Text
- User pastes business plan, pitch deck text, annual report excerpt, or business description
- Analyze the text directly against the 9 Cs framework
- Infer scores and cross-C dynamics from the provided content
- Cite specific text passages as evidence

### Mode 3: Uploaded File
- User uploads .docx, .pdf, or .txt file
- Extract and analyze content against the 9 Cs framework
- Record file as a data source

## Analysis Standards

Follow these exactly — comprehensive, specific, and evidence-backed:

- Write a clear, specific summary (2–4 sentences) per C — no generic platitudes
- At least 2 strengths and 2 weaknesses each, backed by concrete evidence
- Named competitors in competitive position entries (where applicable)
- Actionable recommendations with priority, effort, and timeframe
- Score 1–10 using the rubric below
- `data_sources` must have 5+ URLs in research mode
- All scores are independent per C, but overall_score is weighted by strategic importance and risk/opportunity magnitude

### Scoring Rubric
| Score | Meaning |
|-------|---------|
| 9–10  | World-class, industry-leading, exceptional competitive advantage or market position |
| 7–8   | Strong strategy/positioning, minor gaps, above industry average |
| 5–6   | Adequate, on par with industry norms or acceptable baseline |
| 3–4   | Below average, notable weaknesses or market headwinds |
| 1–2   | Critically weak, fundamental overhaul needed, existential risk |

## The 9 Cs Framework

1. **Company** — Financial health, operational structure, core capabilities, strategic vision, brand positioning
2. **Customers** — B2B decision-makers, contract health, account concentration, retention and lifetime value
3. **Consumers** — End-user demographics, psychographics, behavior, satisfaction, usage, pain points
4. **Category** — Market size, growth trajectory, industry trends, regulatory environment, supply chain dynamics
5. **Competitors** — Key competitors, competitive intensity, barriers to entry, relative positioning
6. **Collaborators** — Key partners, supplier health, channel partners, ecosystem maturity
7. **Climate** — Economic conditions, regulatory changes, ESG factors, macro risks, currency impacts
8. **Culture** — Organizational values, decision-making style, innovation capacity, employee engagement, change readiness
9. **Community** — Stakeholder groups, social responsibility, local impact, industry standing, corporate citizenship

## JSON Schema

Full schema is in `references/schema.md`. Top-level structure:

```json
{
  "company_name": "string",
  "industry": "string",
  "analysis_date": "string (ISO 8601)",
  "data_sources": ["string"],
  "executive_summary": "string (3–5 sentences)",
  "company": { ...CompanyAnalysis },
  "customers": { ...CustomerAnalysis },
  "consumers": { ...ConsumerAnalysis },
  "category": { ...CategoryAnalysis },
  "competitors": { ...CompetitorAnalysis },
  "collaborators": { ...CollaboratorAnalysis },
  "climate": { ...ClimateAnalysis },
  "culture": { ...CultureAnalysis },
  "community": { ...CommunityAnalysis },
  "overall_score": number,
  "overall_assessment": "enum: excellent|strong|good|adequate|needs_improvement|weak|critical",
  "top_priorities": [ { "priority": "string", "c_category": "enum", "expected_impact": "enum" } ],
  "cross_c_dynamics": ["string — synergies and conflicts between the 9 Cs"]
}
```

## Excel Workbook Structure

The script produces **11 sheets**:

| Sheet | Contents |
|-------|----------|
| `Overview` | Scorecard table with all 9 C scores, executive summary, top 5 priorities |
| `① Company` | Summary, characteristics, strengths, weaknesses, recommendations |
| `② Customers` | Summary, customer segments, contract health, strengths, weaknesses, recommendations |
| `③ Consumers` | Summary, demographics, behavior, satisfaction, strengths, weaknesses, recommendations |
| `④ Category` | Summary, market size, trends, regulatory, strengths, weaknesses, recommendations |
| `⑤ Competitors` | Summary, key competitors, intensity, barriers, competitive position, recommendations |
| `⑥ Collaborators` | Summary, key partners, supplier health, ecosystem, strengths, weaknesses, recommendations |
| `⑦ Climate` | Summary, economic, regulatory, ESG, macro risks, strengths, weaknesses, recommendations |
| `⑧ Culture` | Summary, organizational values, decision-making, engagement, strengths, weaknesses, recommendations |
| `⑨ Community` | Summary, stakeholders, social responsibility, standing, strengths, weaknesses, recommendations |
| `Cross-C Dynamics` | Synergies and conflicts table identifying where the 9 Cs reinforce or undermine each other |

## Upscale Brand Applied in Excel

The script applies Upscale branding automatically — no manual steps needed:

- **Font**: Lexend throughout (Bold for headers, Regular for body)
- **Dark headers**: Eerie Black (`#191919`) background, white text
- **Accent bars**: Lime Green (`#34C52A`) subtitle strips and section labels (uppercase)
- **Score colours**: Green tint (good ≥7), Cyan tint (adequate 5–6), Purple tint (weak <5)
- **Row fills**: Ivory (`#FEFFEA`) alternating rows
- **Circled numerals**: `①` through `⑨` used for per-C sheet tabs per brand voice

## Quality Checklist

Before delivering, verify:
- [ ] JSON has all required fields populated (no nulls, no empty arrays)
- [ ] All nine C scores are 1–10 and justified
- [ ] Every strength/weakness has concrete evidence
- [ ] Every recommendation has priority, effort, and timeframe
- [ ] Competitive positions (where applicable) name actual competitors
- [ ] `data_sources` has 5+ URLs (or descriptive sources in non-research modes)
- [ ] Excel opened without formula errors (recalc script returned `"status": "success"`)
- [ ] Both files are in `/mnt/user-data/outputs/` and presented via `present_files`
- [ ] All 9 Cs are analyzed with equal rigor and comparable depth
- [ ] Cross-C Dynamics sheet identifies real synergies and conflicts (minimum 3 distinct dynamics)
- [ ] Overall score reflects weighted assessment of all 9 Cs, not simple average
