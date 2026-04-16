---
name: brand-deep-research
description: >
  Perform deep brand research to produce a comprehensive, cited brand intelligence profile — covering company overview, products and services, financial performance, strategic outlook, and brand identity. Works by researching a company via extensive web search, analyzing pasted text, or reading an uploaded file. Outputs BOTH a structured JSON file AND a branded Upscale Word document (.docx). Every factual claim includes inline citations with source URLs. Use this skill whenever the user mentions 'brand research', 'brand profile', 'company profile', 'deep research', 'brand intelligence', 'brand dossier', 'company dossier', 'company research', 'brand deep dive', or wants a comprehensive factual profile of a company or brand. Also trigger for 'tell me everything about [company]', 'research [brand]', 'brand overview', 'company backgrounder', or 'company deep dive'. Distinct from the 7 analytical frameworks — this is a research intelligence product, not a scoring framework. The Word document output uses Upscale brand colours (Eerie Black #191919, Lime Green #34C52A, Dark Cyan #429792, Ivory #FEFFEA) and Lexend font throughout.
---

# Brand Deep Research Skill

## Overview

This skill performs comprehensive, cited research on any brand or company, producing a factual intelligence profile across five dimensions:

1. **Company Overview** — history, leadership, structure, mission, geographic presence
2. **Products & Services** — portfolio, flagship offerings, market positioning, R&D direction
3. **Performance** — financial metrics, market share, growth trajectory, KPIs
4. **Outlook & Strategy** — strategic initiatives, growth plans, risks, industry trends
5. **Brand Profile** — positioning, messaging, perception, competitive differentiation, digital presence

Unlike the analytical framework skills (9Cs, SWOT, PESTLE, etc.), this skill gathers and organises **verified facts** rather than scoring or rating dimensions. It serves as a research foundation that the analytical frameworks can then interpret.

**Dual output**: Structured JSON for data integration + branded Word document (.docx) for presentation and decision-making.

## Input Modes

The skill accepts three input modes:

### 1. Company Name Search
Provide a company name and/or website URL. The skill runs extensive web research (minimum 10-15 searches) to gather comprehensive data across all five dimensions.

### 2. Pasted Business Context
Paste company information, financial reports, press releases, or strategic documents directly. The skill extracts, organises, and structures the information into the five-dimension profile.

### 3. File Upload
Upload documents (PDF, DOCX, TXT) containing company data, annual reports, pitch decks, or research. The skill reads and analyses to build the profile.

## Research Standards

### Minimum Research Requirements
- **Web research mode**: Minimum 10-15 web searches targeting different dimensions (company info, financials, products, news, analyst coverage, brand perception, competitor landscape)
- **Source diversity**: Use at least 3 different source types (company website, news articles, analyst reports, review sites, regulatory filings)
- **Recency**: Prioritise data from the last 12 months; flag older data with date context

### Citation Requirements

**Every factual claim, metric, and finding must include an inline citation.**

- All sub-objects in the JSON schema include `source_url` and `source_name` fields — these must be populated with real, verifiable sources
- The top-level `citations` array serves as the master bibliography — every `source_url` in the document maps to an entry there
- The Word document renders citations as superscript numbers (e.g., "Revenue grew 11% YoY [1]") with a full numbered bibliography in the Research Notes section
- Never fabricate sources or URLs — if a fact cannot be cited, note it in `key_gaps` instead
- Confidence levels reflect source quality:
  - **high**: Primary/authoritative source (annual report, official press release, regulatory filing)
  - **medium**: Credible secondary source (reputable news outlet, industry analyst)
  - **low**: Anecdotal, unverified, or single-source claim

### Data Integrity
- Use specific numbers, dates, and named sources — avoid vague language ("recently", "significant growth")
- For private companies, honestly note gaps rather than fabricating metrics
- Include the `research_confidence` assessment per section
- The `overall_profile_completeness` score (1-10) measures research thoroughness, not brand quality

## The Five Research Dimensions

### 1. Company Overview
Research and document:
- Legal name, trading name, founding date, headquarters location
- Company type (public/private/subsidiary) and ownership structure
- Stock ticker and exchange (if public), major shareholders
- Employee count and trend
- Annual revenue (most recent reported period)
- Mission statement, vision statement, core values
- Key leadership team (3-8 executives with bios)
- Geographic presence and operational footprint
- Key historical milestones (5-10 significant events)

### 2. Products & Services
Research and document:
- Complete product portfolio with market position, target audience, pricing tier
- Service offerings (consulting, support, professional services)
- Flagship products (top 1-5 by strategic importance)
- Recent product launches (last 12-18 months)
- Discontinued products (last 24 months)
- R&D investment focus and direction
- Intellectual property summary (patents, trademarks, proprietary tech)
- Overall product lifecycle stage

### 3. Performance
Research and document:
- Key financial metrics (revenue, margins, growth, cash flow, profitability) — 5-12 metrics
- Revenue trend assessment (accelerating, growing, stable, declining)
- Profitability assessment
- Market share and market share trend
- Growth rate with specific figures
- Key performance indicators relevant to the industry (3-8 KPIs)
- Competitive ranking
- Recent performance highlights and concerns

### 4. Outlook & Strategy
Research and document:
- Stated strategy (from CEO letters, earnings calls, investor presentations)
- Active strategic initiatives (3-8) with status and timeline
- Growth plans and expansion targets
- Investment priorities
- Industry trends affecting the company (3-6 with impact assessment)
- Key risks (3-6 with severity, likelihood, and mitigation)
- Analyst consensus (for public companies)
- Overall growth outlook

### 5. Brand Profile
Research and document:
- Brand positioning and brand promise
- Brand archetype and tagline/slogan
- Target audience (primary, secondary, demographics, psychographics)
- Brand voice and tone
- Visual identity description
- Key messaging pillars (3-6)
- Competitive differentiation (3-6 points)
- Brand perception (customer sentiment, industry reputation, employer brand)
- Competitor snapshots (3-8 competitors with differentiation)
- Brand equity indicators (awards, rankings, NPS)
- Digital presence (website, social platforms, engagement)
- Recent brand activity (campaigns, rebrand, sponsorships)

## Deliverables

### 1. JSON File (brand_deep_research.json)

Complete structured data following the schema in `schemas/brand_deep_research_schema.md`:
- Company metadata (name, website, industry, date)
- Full data sources array with access dates
- Research depth assessment
- Executive summary
- All five section objects with complete sub-objects
- Overall profile completeness score (1-10)
- Key research gaps
- Cross-section insights
- Master citations bibliography

### 2. Branded Word Document (brand_deep_research.docx)

Professional Upscale-branded Word document with seven sections:

#### Cover / Title Page
- Upscale logo (top-left) with Lime Green horizontal rule below
- Company name as hero heading
- Industry, analysis date, research depth
- Executive summary block
- Research completeness score badge

#### 1. Company Overview
- Key facts grid: Founded, HQ, Type, Employees, Revenue, Ticker
- Mission and vision statements
- Leadership table (Name | Title | Tenure | Background)
- Ownership structure and major shareholders
- Geographic presence
- Key milestones timeline

#### 2. Products & Services
- Product portfolio table (Name | Category | Position | Audience | Pricing | Differentiators | Revenue %)
- Flagship products callout
- Recent launches
- R&D focus summary
- IP summary

#### 3. Performance
- Financial metrics table (Metric | Value | Period | Trend | Source)
- Revenue and profitability assessment
- Market share and competitive ranking
- KPI table (KPI | Value | Benchmark | Assessment)
- Performance highlights and concerns

#### 4. Outlook & Strategy
- Stated strategy summary
- Strategic initiatives table (Initiative | Status | Timeline | Rationale)
- Industry trends table (Trend | Impact | Timeframe)
- Risk register table (Risk | Severity | Likelihood | Mitigation)
- Growth plans and analyst consensus

#### 5. Brand Profile
- Brand positioning statement and promise
- Target audience card
- Messaging pillars and competitive differentiation
- Brand perception indicators
- Competitor snapshot table (Name | Relationship | Differentiator)
- Digital presence summary

#### 6. Research Notes & Citations
- Cross-section insights (numbered list)
- Key data gaps (flagged clearly)
- Full numbered bibliography (all sources cited throughout, with URLs, access dates, and source types)

## Upscale Brand Styling (Word Document)

The Word document applies Upscale branding from the brand skill:

### Typography
- **Headings**: Lexend Bold, Eerie Black (#191919)
- **Section Labels**: Lexend SemiBold, Lime Green (#34C52A), UPPERCASE, wide letter-spacing
- **Body Text**: Lexend Regular, Eerie Black (#191919)
- **Metadata/Captions**: Lexend Light, Dark Cyan (#429792)
- **Citations**: Superscript numbers in body text, Lexend Regular in bibliography

### Colours
- **Eerie Black** (#191919): body text, headings, table headers
- **Lime Green** (#34C52A): section labels, horizontal rules, accents
- **Dark Cyan** (#429792): metadata, captions, header/footer text
- **Ivory** (#FEFFEA): callout block backgrounds

### Layout Elements
- `→` arrow bullets instead of standard bullets
- Tables with Eerie Black header row and white text
- Lime Green horizontal rules between major sections
- Callout blocks with Lime Green left border (3pt) and Ivory background
- Logo placement: top-left on cover page with Lime Green rule below
- Document title in header (Lexend SemiBold, Dark Cyan)
- Page numbers in footer

### Brand Voice
- Confident and direct, short declarative sentences
- Em-dash (—) for rhythm and emphasis
- Active voice throughout
- Specific, quantified language — no vague claims

## Quality Checklist

Before finalising output, verify:

- [ ] **Citation Coverage**: Every factual claim, metric, and data point has a source citation
- [ ] **Bibliography Completeness**: All cited sources appear in the master citations array and bibliography section
- [ ] **Source Diversity**: At least 3 different source types used (company website, news, analyst, review, filing)
- [ ] **Section Completeness**: All five sections populated with substantive content
- [ ] **Research Confidence**: Per-section confidence ratings reflect actual data quality
- [ ] **Key Gaps Disclosed**: Areas with missing data honestly noted in key_gaps array
- [ ] **Recency**: Financial data from the most recent available period, clearly dated
- [ ] **Specificity**: Named people, specific numbers, exact dates — no vague language
- [ ] **Executive Summary**: 4-6 sentences covering identity, position, strengths, and outlook
- [ ] **Cross-Section Insights**: 3-6 meaningful connections identified across dimensions
- [ ] **Word Document Branding**: Lexend font, Upscale colours, arrow bullets, branded tables
- [ ] **JSON Schema Compliance**: Output matches the schema in brand_deep_research_schema.md exactly

## Usage Triggers

Use this skill when the user mentions:
- Brand research, brand profile, company profile
- Deep research, brand intelligence, brand dossier
- Company dossier, company research, brand deep dive
- Tell me everything about [company]
- Research [brand], brand overview, company backgrounder
- Company deep dive, full brand analysis (research context)
- What do we know about [company]
- Background on [brand]

## Integration with Other Analyses

This skill produces the research foundation that other analytical frameworks can build on:

- **9 Cs Analysis**: Company Overview feeds the Company C; Products feeds Category; Brand Profile feeds Customers and Competitors
- **SWOT Analysis**: Performance highlights map to Strengths; concerns map to Weaknesses; Outlook trends map to Opportunities and Threats
- **PESTLE Analysis**: Outlook industry trends and risks provide context for macro-environmental assessment
- **Commercial Model**: Performance financial metrics and Products pricing data feed revenue model and unit economics analysis
- **Marketing Audit (7Ps)**: Products feeds Product P; Brand Profile feeds Promotion P; Performance KPIs feed measurement

When synthesising from this research into other frameworks, cite the Brand Deep Research output as a source.

## File Structure

```
brand-deep-research/
├── schemas/
│   ├── brand_deep_research_skill.md     (this file)
│   └── brand_deep_research_schema.md    (JSON schema documentation)
└── scripts/
    └── build_brand_research_docx.py     (Word document generator)
```

## Dependencies

- Python 3.8+
- python-docx (Word document generation)
- cairosvg (SVG logo to PNG conversion)
- json (data serialisation)
