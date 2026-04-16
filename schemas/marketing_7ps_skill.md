---
name: marketing-audit-7ps
description: >
  Perform a comprehensive Marketing Audit including the full 7Ps marketing mix (Product, Price, Place, Promotion, People, Process, Physical Evidence) plus strategic assessment, team capability, budget analysis, brand health, customer journey, and performance metrics. Works by researching a company via web search, analyzing pasted text, or reading an uploaded file. Outputs BOTH a structured JSON file AND a branded Upscale Excel workbook (.xlsx). Use this skill whenever the user mentions 'marketing audit', '7Ps', 'seven Ps', 'marketing assessment', 'brand health audit', 'customer journey analysis', 'marketing performance review', 'marketing team assessment', 'marketing budget analysis', or wants a comprehensive review of a company's entire marketing function. Distinct from the 4Ps skill — this is a full audit covering strategy, team, budget, and the extended marketing mix. The Excel output uses Upscale brand colours (Eerie Black #191919, Lime Green #34C52A, Dark Cyan #429792, Ivory #FEFFEA) and Lexend font throughout.
tags: [marketing, audit, 7ps, brand-health, customer-journey, budget-analysis, performance-metrics, marketing-strategy, marketing-team, team-assessment]
mode: multimodal
---

# Marketing Audit (7Ps) Skill

## Overview

This skill performs a **comprehensive marketing audit** covering the extended 7Ps framework plus strategic, operational, financial, and brand health dimensions. Unlike the 4Ps skill, this audit provides:

- **Strategic Assessment**: Market position, competitive advantages, segmentation & targeting
- **7Ps Marketing Mix**: Product, Price, Place, Promotion, People, Process, Physical Evidence
- **Brand & Customer**: Brand health metrics, customer journey mapping with touchpoint analysis
- **Operations & Finance**: Team capability, process maturity, budget allocation & ROI analysis
- **Performance**: KPIs, attribution, channel performance, marketing contribution to revenue

## Deliverables

1. **Structured JSON** – Complete audit data conforming to the schema (references/schema.md)
2. **Branded Excel Workbook** – Multi-sheet dashboard with Upscale brand styling (Eerie Black #191919, Lime Green #34C52A, Dark Cyan #429792, Ivory #FEFFEA) and Lexend font

## Input Modes

**1. Web Research Mode**
- User provides a company name
- Skill researches via web search to build the audit profile
- Gathers competitive, market, and brand intelligence

**2. Text Analysis Mode**
- User pastes business description, marketing brief, or strategic documents
- Skill analyzes provided text to inform audit sections

**3. File Upload Mode**
- User uploads .txt, .md, .pdf, or other marketing/strategic documents
- Skill extracts and analyzes content to populate audit

## Audit Sections & Scoring

Each section below is scored 1–10 with a quality checklist:

### Strategic Assessment
- Market positioning (leader/challenger/follower/nicher)
- Segmentation effectiveness & targeting accuracy
- Positioning clarity & strategic alignment
- Competitive advantages & market share trend
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: Exceptional clarity, advantage, alignment
- 7–8: Strong positioning, defined advantages
- 5–6: Adequate strategy, some gaps
- 3–4: Weak alignment, unclear positioning
- 1–2: No coherent strategy

### Product (7P#1)
- Product portfolio & lifecycle stage
- Differentiation & unique value proposition
- Quality & innovation assessment
- Features vs. competitor offering
- Product-market fit indicators
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: Clear differentiation, strong fit, innovation lead
- 7–8: Solid offering, competitive features
- 5–6: Adequate product, some gaps
- 3–4: Weak differentiation, fit concerns
- 1–2: Commoditized, low fit

### Price (7P#2)
- Pricing strategy (value-based/cost-plus/competitive)
- Price positioning vs. competition
- Price elasticity & customer perception
- Discount/promotion strategy effectiveness
- Margin health & profitability impact
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: Optimal pricing, strong margins, customer-perceived value
- 7–8: Competitive pricing, healthy margins
- 5–6: Adequate pricing, some discount dependency
- 3–4: Pricing pressure, margin concerns
- 1–2: Commoditized pricing, poor margins

### Place (7P#3)
- Distribution strategy (direct/indirect/hybrid)
- Channel coverage & accessibility
- Retail/online presence & footprint
- Supply chain efficiency
- Partner/reseller effectiveness
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: Comprehensive, accessible, optimized channels
- 7–8: Good coverage, effective partnerships
- 5–6: Adequate distribution, some gaps
- 3–4: Limited channels, accessibility issues
- 1–2: Poor coverage, fragmented distribution

### Promotion (7P#4)
- Marketing mix (advertising, PR, sales promotion)
- Message clarity & brand consistency
- Campaign effectiveness & reach
- Content strategy & engagement
- Digital vs. traditional media balance
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: Integrated campaigns, clear messaging, high engagement
- 7–8: Effective promotion, strong brand voice
- 5–6: Adequate campaigns, inconsistent messaging
- 3–4: Weak campaigns, limited reach
- 1–2: Disjointed, unclear messaging

### People (7P#5)
- Marketing team size, structure, capability
- Key skill gaps & training investment
- Employee brand advocacy & culture
- Customer service quality & training
- Sales-marketing alignment
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: Advanced capabilities, strong alignment, culture-driven
- 7–8: Competent team, adequate training, good alignment
- 5–6: Developing capabilities, some gaps
- 3–4: Basic skills, weak alignment, gaps
- 1–2: Limited capability, siloed, poorly trained

### Process (7P#6)
- Customer experience efficiency
- Lead management & nurture maturity
- Campaign execution workflow
- Response time & agility
- Marketing automation & digital tools
- Workflow bottlenecks & optimization
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: Advanced automation, fast response, optimized workflows
- 7–8: Competent processes, good automation, adequate speed
- 5–6: Basic workflows, manual elements, some delays
- 3–4: Poor efficiency, slow response, bottlenecks
- 1–2: Fragmented, ad-hoc processes

### Physical Evidence (7P#7)
- Brand visual consistency (logo, colors, fonts)
- Website UX quality & mobile responsiveness
- Packaging quality & shelf appeal
- Retail environment & merchandising
- Marketing materials quality & professionalism
- Trust indicators & social proof (reviews, testimonials)
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: Cohesive brand, excellent UX, strong trust signals
- 7–8: Consistent brand, good UX, positive reviews
- 5–6: Adequate visuals, functional website, some trust indicators
- 3–4: Inconsistent brand, poor UX, weak trust signals
- 1–2: Disjointed brand, broken UX, no social proof

### Brand Health
- Aided & unaided awareness (vs. category benchmark)
- Net Promoter Score (NPS) & trend
- Brand equity assessment (strong/moderate/weak)
- Brand sentiment & share of voice
- Brand consistency across touchpoints
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: High awareness, strong equity, excellent sentiment, market share growing
- 7–8: Moderate-to-high awareness, good equity, positive sentiment
- 5–6: Adequate awareness, moderate equity, neutral sentiment
- 3–4: Low awareness, weak equity, negative sentiment
- 1–2: Very low awareness, poor equity, very negative sentiment

### Customer Journey
- Journey stage mapping (awareness → advocacy)
- Touchpoint coverage & optimization per stage
- Customer pain points & drop-off analysis
- Omnichannel integration & consistency
- Journey mapping maturity (advanced/developing/basic)
- Opportunities for experience improvement
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: Advanced mapping, integrated touchpoints, proactive optimization
- 7–8: Developing journey map, good touchpoint coverage
- 5–6: Basic journey awareness, some touchpoints mapped
- 3–4: Minimal journey mapping, fragmented touchpoints
- 1–2: No formal journey map, disconnected touchpoints

### Budget Analysis
- Total marketing spend & as % of revenue
- Channel allocation (% across paid, owned, earned)
- ROI assessment per channel (high/adequate/low)
- Fixed vs. variable spend ratio
- Underinvested & overinvested areas
- Budget efficiency & benchmarking
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: Efficient allocation, high ROI channels, data-driven budget
- 7–8: Adequate allocation, good ROI, strategic investment
- 5–6: Basic allocation, mixed ROI, some inefficiency
- 3–4: Poor allocation, low ROI, reactive budgeting
- 1–2: Inefficient spend, negative ROI, no strategy

### Performance Metrics
- Funnel metrics (top/mid/bottom conversion rates)
- Attribution model (first/last/multi-touch)
- Channel ROI & trend per channel
- Key KPIs (CAC, LTV, engagement, conversion)
- Marketing contribution to revenue (%)
- Strengths, weaknesses, recommendations

**Score Rubric:**
- 9–10: Advanced attribution, strong ROI across channels, high contribution
- 7–8: Multi-touch attribution, adequate ROI, meaningful contribution
- 5–6: Basic tracking, some ROI insights, partial attribution
- 3–4: Limited metrics, low ROI visibility, weak contribution tracking
- 1–2: No attribution, poor ROI tracking, unmeasured contribution

## Overall Assessment Enum

- **World Class**: 9–10 average, exceptional execution, competitive advantage
- **Advanced**: 7–8 average, strong execution, industry-leading in most areas
- **Competent**: 5–6 average, solid baseline, with clear improvement areas
- **Developing**: 3–4 average, emerging capability, significant gaps
- **Basic**: 1–2 average, fragmented or immature marketing function

## Marketing Maturity Levels

- **World Class**: AI-driven optimization, predictive analytics, seamless omnichannel
- **Advanced**: Multi-touch attribution, advanced automation, integrated data
- **Competent**: Basic marketing automation, some analytics, functional channels
- **Developing**: Manual processes, limited data, siloed channels
- **Basic**: Ad-hoc tactics, no formal processes, minimal measurement

## Output Structure

### JSON File
Conforms to the schema in `references/schema.md`. Fields include:
- `company_name`, `industry`, `analysis_date`, `data_sources`
- `executive_summary`
- Sections: `strategic_assessment`, `product`, `price`, `place`, `promotion`, `people`, `process`, `physical_evidence`, `brand_health`, `customer_journey`, `budget_analysis`, `performance_metrics`
- `overall_score` (1–10), `overall_assessment` (enum), `marketing_maturity` (enum)
- `top_priorities` (array of action items)
- `cross_section_dynamics` (array of how sections interact)

### Excel Workbook
Generated by `scripts/build_excel.py` with sheets:
1. **Overview** – Scorecard of all 12 sections (Strategic, 7Ps, Performance categories)
2. **→ Strategy** – Strategic Assessment detail
3. **→ Product**, **→ Price**, **→ Place**, **→ Promotion** – Individual 4Ps sheets
4. **→ People**, **→ Process**, **→ Physical Evidence** – Individual 7P sheets
5. **→ Brand Health** – Brand metrics & sentiment
6. **→ Customer Journey** – Journey stages with touchpoint table
7. **→ Budget** – Budget allocation & ROI table
8. **→ Performance** – KPI table with trends & benchmarks
9. **Dynamics** – Cross-section interactions & strategic implications

**Design:**
- Upscale brand palette: Eerie Black #191919, Lime Green #34C52A, Dark Cyan #429792, Ivory #FEFFEA
- Lexend font throughout
- Professional formatting, charts for key metrics
- Interactive tabs with consistent styling

## Quality Checklist

✓ All 12 sections assessed & scored  
✓ Executive summary captures key insights  
✓ Strengths, weaknesses, recommendations populated for each section  
✓ Cross-section dynamics identified (e.g., price-place tradeoffs)  
✓ Data sources cited (web, document, user input)  
✓ Benchmarks included where available  
✓ Overall assessment & maturity level assigned  
✓ Top priorities ranked for immediate action  
✓ JSON valid & complete  
✓ Excel professionally formatted with Upscale branding  
✓ Charts & visualizations support key metrics  
✓ Output files named consistently (e.g., `{company}_7ps_audit.json`, `{company}_7ps_audit.xlsx`)

## Usage Examples

**Web Research:**
> "Run a marketing audit on Tesla using the 7Ps framework."

**Text Analysis:**
> "Here's our marketing brief [paste text]. Run a 7Ps audit on our current strategy."

**File Upload:**
> "I've uploaded our marketing strategy doc. Can you run a comprehensive 7Ps audit?"

---

*Created by Upscale. Last updated: 2026-04-09*
