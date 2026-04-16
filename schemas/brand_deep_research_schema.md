# Brand Deep Research JSON Schema

This document defines the complete JSON schema for the Brand Deep Research output, including all objects, properties, and constraints. This is a research intelligence product — it captures verified facts about a brand, not evaluative scores.

## Citation & Source Requirements

Every factual claim, metric, and finding must trace to a source. All sub-objects include `source_url` and/or `source_name` fields. The top-level `citations` array serves as the master bibliography — every `source_url` in the document should map to an entry there.

---

## Shared Sub-Objects

### KeyFact

A specific, verified piece of information with its source citation.

```json
{
  "fact": "string — a specific, verified piece of information",
  "source_url": "string — URL of the source",
  "source_name": "string — human-readable source name (e.g., 'Tesla 2025 Annual Report')",
  "date": "string — ISO 8601 date or 'undated'",
  "confidence": "enum: high | medium | low"
}
```

**Constraints:**
- `fact`: 1-3 sentences, specific and verifiable
- `source_url`: valid URL or "internal_document" if from uploaded file
- `source_name`: required, human-readable
- `date`: ISO 8601 date (YYYY-MM-DD) or "undated"
- `confidence`: high = authoritative/primary source, medium = credible secondary, low = anecdotal/unverified
- All fields required

**Example:**
```json
{
  "fact": "Salesforce completed its acquisition of Slack Technologies for $27.7 billion in July 2021, making it the company's largest acquisition to date.",
  "source_url": "https://investor.salesforce.com/press-releases/2021/07-21-2021",
  "source_name": "Salesforce Investor Relations Press Release",
  "date": "2021-07-21",
  "confidence": "high"
}
```

---

### KeyPerson

A member of the company's leadership team.

```json
{
  "name": "string",
  "title": "string — current role/title",
  "tenure": "string — e.g., 'Since 2019', 'Appointed March 2024'",
  "background": "string — 1-2 sentence professional bio",
  "source_url": "string — URL where this information was verified"
}
```

**Constraints:**
- `background`: 1-2 sentences covering prior roles or relevant expertise
- All fields required

**Example:**
```json
{
  "name": "Marc Benioff",
  "title": "Chair & Chief Executive Officer",
  "tenure": "Since 1999 (co-founder)",
  "background": "Founded Salesforce after 13 years at Oracle. Named one of the world's greatest leaders by Fortune. Leads the company's AI-first transformation strategy.",
  "source_url": "https://www.salesforce.com/company/leadership/"
}
```

---

### ProductLine

A product or service offered by the company.

```json
{
  "name": "string — product or service name",
  "category": "string — product category or type",
  "description": "string — what it does, who it serves (2-3 sentences)",
  "market_position": "enum: leader | strong_contender | mid_market | niche | emerging | unknown",
  "target_audience": "string — primary users/buyers",
  "pricing_tier": "enum: premium | mid_range | value | freemium | enterprise | varies | unknown",
  "key_differentiators": ["string — what sets this product apart"],
  "estimated_revenue_contribution": "string — e.g., '~40% of revenue' or 'unknown'",
  "source_url": "string — URL where product information was found"
}
```

**Constraints:**
- `key_differentiators`: array of 1-5 strings
- `market_position`: based on analyst reports or market share data where available
- `estimated_revenue_contribution`: use "unknown" if not publicly disclosed
- All fields required

**Example:**
```json
{
  "name": "Sales Cloud",
  "category": "CRM / Sales Automation",
  "description": "AI-powered CRM platform for sales teams, covering lead management, opportunity tracking, forecasting, and pipeline analytics. Serves enterprises and mid-market companies globally.",
  "market_position": "leader",
  "target_audience": "Sales teams in mid-market and enterprise organisations",
  "pricing_tier": "enterprise",
  "key_differentiators": [
    "Einstein AI-powered lead scoring and forecasting",
    "Largest CRM ecosystem with 5,000+ AppExchange integrations",
    "Real-time pipeline analytics and revenue intelligence"
  ],
  "estimated_revenue_contribution": "~25% of subscription revenue",
  "source_url": "https://www.salesforce.com/products/sales/"
}
```

---

### FinancialMetric

A specific financial data point with source attribution.

```json
{
  "metric": "string — e.g., 'Revenue', 'Net Income', 'EBITDA', 'Gross Margin'",
  "value": "string — e.g., '$34.9B', '12.5%', '$4.2B'",
  "period": "string — e.g., 'FY2025', 'Q3 2025', 'TTM'",
  "trend": "enum: growing | stable | declining | unknown",
  "source_url": "string — URL of the financial data source",
  "source_name": "string — e.g., 'FY2025 10-K Filing'"
}
```

**Constraints:**
- `value`: include currency symbol and unit where applicable
- `period`: specific fiscal period, not vague ("recent")
- All fields required

**Example:**
```json
{
  "metric": "Total Revenue",
  "value": "$34.9B",
  "period": "FY2025 (ended Jan 2025)",
  "trend": "growing",
  "source_url": "https://investor.salesforce.com/annual-reports/2025",
  "source_name": "Salesforce FY2025 Annual Report"
}
```

---

### StrategicInitiative

A stated or observed strategic move by the company.

```json
{
  "initiative": "string — what the company is pursuing",
  "status": "enum: announced | in_progress | completed | rumored",
  "timeline": "string — expected completion or launch date/timeframe",
  "strategic_rationale": "string — why they are doing this (1-2 sentences)",
  "source_url": "string — URL of the source",
  "source_name": "string — human-readable source description"
}
```

**Constraints:**
- `initiative`: concise description (1-2 sentences)
- `status`: use "rumored" only with low confidence and appropriate disclosure
- All fields required

**Example:**
```json
{
  "initiative": "Launch of Agentforce — autonomous AI agents for customer service, sales, and marketing workflows",
  "status": "in_progress",
  "timeline": "GA launched October 2024, expanding capabilities through 2025",
  "strategic_rationale": "Positions Salesforce at the centre of the enterprise AI agent ecosystem, driving new revenue streams and deepening platform lock-in.",
  "source_url": "https://www.salesforce.com/agentforce/",
  "source_name": "Salesforce Agentforce Product Page"
}
```

---

### CompetitorSnapshot

A brief profile of a competitor relative to the researched brand.

```json
{
  "name": "string — competitor company name",
  "relationship": "enum: direct_competitor | indirect_competitor | substitute | potential_entrant",
  "key_differentiator_vs_subject": "string — how this competitor differs from the researched brand (1-2 sentences)",
  "source_url": "string — URL where competitive comparison was sourced"
}
```

**Constraints:**
- `key_differentiator_vs_subject`: focus on meaningful strategic differences, not generic observations
- All fields required

**Example:**
```json
{
  "name": "Microsoft Dynamics 365",
  "relationship": "direct_competitor",
  "key_differentiator_vs_subject": "Deeply integrated with the Microsoft 365 productivity suite and Azure cloud, offering a lower total cost of ownership for organisations already in the Microsoft ecosystem. Less customisable but simpler to deploy.",
  "source_url": "https://www.gartner.com/reviews/market/crm-lead-management"
}
```

---

### Citation

A source entry in the master bibliography.

```json
{
  "id": "number — sequential citation number (1, 2, 3...)",
  "source_name": "string — human-readable source title",
  "url": "string — full URL",
  "type": "enum: annual_report | press_release | news_article | analyst_report | company_website | regulatory_filing | industry_report | social_media | interview | other",
  "accessed_date": "string — ISO 8601 date when the source was accessed",
  "description": "string — brief description of what this source provides (1 sentence)"
}
```

**Constraints:**
- `id`: sequential integers starting at 1
- `url`: valid URL
- `accessed_date`: must be the date the research was conducted
- All fields required

**Example:**
```json
{
  "id": 1,
  "source_name": "Salesforce FY2025 Annual Report (10-K)",
  "url": "https://investor.salesforce.com/annual-reports/2025",
  "type": "annual_report",
  "accessed_date": "2026-04-16",
  "description": "Primary source for financial metrics, revenue breakdown, employee count, and strategic priorities."
}
```

---

## Section Schemas

### 1. CompanyOverview

```json
{
  "summary": "string — 3-5 sentence company overview",
  "legal_name": "string",
  "trading_as": "string — brand name if different from legal name, or same as legal_name",
  "founded": "string — year or full date",
  "headquarters": "string — city, state/province, country",
  "company_type": "enum: public | private | subsidiary | government | non_profit | cooperative",
  "stock_ticker": "string or null — e.g., 'CRM (NYSE)'",
  "employee_count": "string — e.g., '~73,000' or 'unknown'",
  "employee_count_trend": "enum: growing | stable | shrinking | unknown",
  "annual_revenue": "string — e.g., '$34.9B (FY2025)' or 'undisclosed'",
  "mission_statement": "string",
  "vision_statement": "string or null",
  "core_values": ["string"],
  "key_leadership": [KeyPerson],
  "ownership_structure": "string — e.g., 'publicly traded NYSE', 'PE-backed (KKR)', 'family-owned'",
  "major_shareholders": ["string — e.g., 'Vanguard Group (7.2%)', 'BlackRock (5.1%)'"],
  "geographic_presence": ["string — regions/countries of significant operation"],
  "key_milestones": [KeyFact],
  "research_confidence": "enum: high | medium | low"
}
```

**Constraints:**
- `key_leadership`: 3-8 entries covering C-suite and key executives
- `core_values`: 3-7 values
- `key_milestones`: 5-10 significant events in company history
- `geographic_presence`: list regions, not individual cities (unless a single-city company)
- `major_shareholders`: top 3-5 shareholders for public companies; ownership description for private
- `research_confidence`: high if public company with extensive disclosure; medium if limited data; low if mostly unavailable

---

### 2. ProductsServices

```json
{
  "summary": "string — 2-4 sentence overview of the product portfolio",
  "total_product_lines": "number or null",
  "product_portfolio": [ProductLine],
  "service_offerings": [ProductLine],
  "flagship_products": ["string — names of the most important products"],
  "recent_launches": [KeyFact],
  "discontinued_products": [KeyFact],
  "r_and_d_focus": "string — where the company is investing in product development (2-3 sentences)",
  "intellectual_property": "string — patents, trademarks, proprietary tech summary (1-2 sentences)",
  "product_lifecycle_stage": "enum: innovation | growth | maturity | decline | mixed",
  "research_confidence": "enum: high | medium | low"
}
```

**Constraints:**
- `product_portfolio`: core products/platforms (3-15 entries, cap at 20)
- `service_offerings`: professional services, consulting, support tiers (0-10 entries)
- `flagship_products`: 1-5 names only
- `recent_launches`: products launched in the last 12-18 months
- `discontinued_products`: products retired in the last 24 months (may be empty)

---

### 3. PerformanceProfile

```json
{
  "summary": "string — 2-4 sentence performance overview",
  "financial_metrics": [FinancialMetric],
  "revenue_trend": "enum: accelerating | growing | stable | declining | volatile | unknown",
  "profitability_assessment": "enum: highly_profitable | profitable | break_even | loss_making | unknown",
  "market_share": "string — e.g., '~23% of global CRM market' or 'unknown'",
  "market_share_trend": "enum: gaining | stable | losing | unknown",
  "growth_rate": "string — e.g., '11% YoY revenue growth (FY2025)'",
  "key_kpis": [
    {
      "kpi_name": "string",
      "value": "string",
      "benchmark": "string or null — industry average or competitor comparison",
      "assessment": "string — brief interpretation",
      "source_url": "string"
    }
  ],
  "competitive_ranking": "string — e.g., '#1 globally by revenue in CRM market'",
  "recent_performance_highlights": [KeyFact],
  "recent_performance_concerns": [KeyFact],
  "research_confidence": "enum: high | medium | low"
}
```

**Constraints:**
- `financial_metrics`: 5-12 key metrics (revenue, margins, growth, profitability, cash flow)
- `key_kpis`: 3-8 KPIs relevant to the company's industry
- `recent_performance_highlights`: 2-5 positive recent developments
- `recent_performance_concerns`: 1-5 risks or negative developments (may be empty if none found)
- For private companies, note "undisclosed" values rather than fabricating

---

### 4. OutlookStrategy

```json
{
  "summary": "string — 2-4 sentence outlook overview",
  "stated_strategy": "string — the company's own articulation of strategic direction (2-4 sentences)",
  "strategic_initiatives": [StrategicInitiative],
  "growth_plans": [KeyFact],
  "expansion_targets": ["string — markets, geographies, or segments being targeted"],
  "investment_priorities": ["string — where capital is being allocated"],
  "industry_trends_affecting": [
    {
      "trend": "string — description of the trend",
      "impact": "enum: tailwind | headwind | neutral | uncertain",
      "timeframe": "enum: near_term | medium_term | long_term",
      "source_url": "string"
    }
  ],
  "key_risks": [
    {
      "risk": "string — description of the risk",
      "severity": "enum: high | medium | low",
      "likelihood": "enum: high | medium | low",
      "mitigation": "string or null — company's stated or observed mitigation approach",
      "source_url": "string"
    }
  ],
  "analyst_consensus": "string — summary of analyst views if available, or 'not covered' / 'private company — no analyst coverage'",
  "growth_outlook": "enum: strong_growth | moderate_growth | stable | contraction | uncertain",
  "research_confidence": "enum: high | medium | low"
}
```

**Constraints:**
- `strategic_initiatives`: 3-8 current or announced initiatives
- `growth_plans`: 2-5 specific growth moves
- `expansion_targets`: 2-6 target markets or segments
- `investment_priorities`: 2-5 priority areas
- `industry_trends_affecting`: 3-6 trends with impact assessment
- `key_risks`: 3-6 material risks
- `analyst_consensus`: for public companies, summarise sell-side consensus; for private, note absence

---

### 5. BrandProfile

```json
{
  "summary": "string — 2-4 sentence brand overview",
  "brand_positioning": "string — how the brand positions itself in the market (2-3 sentences)",
  "brand_promise": "string — the core promise to customers (1-2 sentences)",
  "brand_archetype": "string or null — e.g., 'The Creator', 'The Explorer', 'The Sage'",
  "tagline_slogan": "string or null — current tagline or primary slogan",
  "target_audience": {
    "primary": "string — primary target market description",
    "secondary": "string or null — secondary audience",
    "demographics": "string — demographic profile",
    "psychographics": "string — values, attitudes, lifestyle characteristics"
  },
  "brand_voice_tone": "string — description of communication style (2-3 sentences)",
  "visual_identity": "string — description of logo, colours, design language (2-3 sentences)",
  "key_messaging_pillars": ["string — core themes in brand communications"],
  "competitive_differentiation": ["string — how the brand stands apart from competitors"],
  "brand_perception": {
    "customer_sentiment": "enum: very_positive | positive | mixed | negative | unknown",
    "industry_reputation": "enum: thought_leader | well_regarded | average | below_average | unknown",
    "employer_brand": "enum: strong | average | weak | unknown",
    "key_perception_themes": ["string — recurring themes in customer/market perception"],
    "source_urls": ["string — URLs of review sites, surveys, or reports used"]
  },
  "competitors": [CompetitorSnapshot],
  "brand_equity_indicators": [KeyFact],
  "digital_presence": {
    "website": "string — primary URL",
    "social_platforms": ["string — platform names with follower counts if available"],
    "engagement_assessment": "enum: strong | moderate | weak | unknown",
    "source_url": "string"
  },
  "recent_brand_activity": [KeyFact],
  "research_confidence": "enum: high | medium | low"
}
```

**Constraints:**
- `key_messaging_pillars`: 3-6 pillars
- `competitive_differentiation`: 3-6 differentiators
- `competitors`: 3-8 competitor snapshots
- `brand_equity_indicators`: 2-5 indicators (awards, rankings, NPS, brand value rankings)
- `social_platforms`: include estimated follower counts where available
- `recent_brand_activity`: campaigns, rebrand, sponsorships in last 12 months

---

## Top-Level Brand Deep Research Object

```json
{
  "company_name": "string",
  "website": "string — primary URL",
  "industry": "string — e.g., 'Enterprise Software / CRM'",
  "analysis_date": "string — ISO 8601 format",
  "data_sources": [
    {
      "url": "string",
      "name": "string",
      "type": "enum: annual_report | press_release | news_article | analyst_report | company_website | regulatory_filing | industry_report | social_media | interview | other",
      "accessed_date": "string — ISO 8601 date"
    }
  ],
  "research_depth": "enum: comprehensive | substantial | moderate | limited",
  "executive_summary": "string — 4-6 sentence overview of the entire brand profile",

  "company_overview": { CompanyOverview },
  "products_services": { ProductsServices },
  "performance_profile": { PerformanceProfile },
  "outlook_strategy": { OutlookStrategy },
  "brand_profile": { BrandProfile },

  "overall_profile_completeness": "number (1-10) — how complete and well-sourced the research is",
  "key_gaps": ["string — areas where research was unable to find reliable information"],
  "cross_section_insights": ["string — connections between sections, e.g., 'Brand positioning aligns with premium pricing but market share data suggests value competitors are gaining ground'"],

  "citations": [Citation]
}
```

**Constraints & Calculations:**

- **analysis_date**: ISO 8601 timestamp
- **company_name**, **website**, **industry**: required
- **data_sources**: minimum 10 sources for web research mode; fewer acceptable for pasted text or file upload
- **research_depth**: derived from data availability:
  - `comprehensive`: 15+ sources, all sections with high confidence, public financials available
  - `substantial`: 10-15 sources, most sections with high/medium confidence
  - `moderate`: 5-10 sources, some sections with low confidence or gaps
  - `limited`: fewer than 5 sources, significant data gaps
- **executive_summary**: 4-6 sentences; should mention company identity, market position, key strengths, and outlook
- **overall_profile_completeness**: 1-10 score reflecting research thoroughness, NOT brand quality:
  - 9-10: All five sections fully populated with high-confidence data and cited sources
  - 7-8: Most sections well-populated, minor gaps in non-critical areas
  - 5-6: Adequate coverage but significant gaps in one or more sections
  - 3-4: Limited data, multiple sections with low confidence
  - 1-2: Minimal data available, most sections sparse
- **key_gaps**: 0-5 strings describing what could not be found (e.g., "Private company — no public financial data available")
- **cross_section_insights**: 3-6 strings identifying meaningful connections across sections
- **citations**: complete bibliography, sequential IDs starting at 1; every `source_url` in the document should reference an entry here

---

## Complete Example

```json
{
  "company_name": "Salesforce, Inc.",
  "website": "https://www.salesforce.com",
  "industry": "Enterprise Software / CRM",
  "analysis_date": "2026-04-16T10:00:00Z",
  "data_sources": [
    {
      "url": "https://investor.salesforce.com/annual-reports/2025",
      "name": "Salesforce FY2025 Annual Report (10-K)",
      "type": "annual_report",
      "accessed_date": "2026-04-16"
    },
    {
      "url": "https://www.salesforce.com/company/",
      "name": "Salesforce Company Overview Page",
      "type": "company_website",
      "accessed_date": "2026-04-16"
    },
    {
      "url": "https://www.gartner.com/reviews/market/crm-lead-management",
      "name": "Gartner CRM Market Guide 2025",
      "type": "analyst_report",
      "accessed_date": "2026-04-16"
    },
    {
      "url": "https://www.reuters.com/technology/salesforce-agentforce-2025/",
      "name": "Reuters — Salesforce Bets Big on AI Agents",
      "type": "news_article",
      "accessed_date": "2026-04-16"
    },
    {
      "url": "https://www.glassdoor.com/Overview/Salesforce-Reviews-EI_IE11159.htm",
      "name": "Glassdoor Salesforce Employee Reviews",
      "type": "other",
      "accessed_date": "2026-04-16"
    }
  ],
  "research_depth": "comprehensive",
  "executive_summary": "Salesforce is the world's largest CRM platform and a leading enterprise software company, generating $34.9B in revenue in FY2025. The company dominates the CRM market with approximately 23% global market share, serving over 150,000 customers worldwide. Salesforce is undergoing a strategic transformation centred on AI agents (Agentforce), positioning itself as the platform for autonomous enterprise AI. While facing intensifying competition from Microsoft, HubSpot, and emerging AI-native vendors, the company's ecosystem moat, installed base, and aggressive AI investment position it favourably for sustained growth. Key risks include AI commoditisation, enterprise spending caution, and integration complexity from its acquisition-heavy growth strategy.",

  "company_overview": {
    "summary": "Salesforce, Inc. is a global enterprise software company headquartered in San Francisco, California. Founded in 1999 by Marc Benioff and three co-founders, the company pioneered the cloud-based CRM model and has grown into one of the world's largest software companies by revenue. Salesforce employs approximately 73,000 people and operates in over 30 countries.",
    "legal_name": "Salesforce, Inc.",
    "trading_as": "Salesforce",
    "founded": "1999",
    "headquarters": "San Francisco, California, USA",
    "company_type": "public",
    "stock_ticker": "CRM (NYSE)",
    "employee_count": "~73,000",
    "employee_count_trend": "stable",
    "annual_revenue": "$34.9B (FY2025, ended January 2025)",
    "mission_statement": "To bring companies and customers together through the power of AI, data, and CRM.",
    "vision_statement": "A world where every company can harness the power of AI agents to transform customer relationships.",
    "core_values": [
      "Trust",
      "Customer Success",
      "Innovation",
      "Equality",
      "Sustainability"
    ],
    "key_leadership": [
      {
        "name": "Marc Benioff",
        "title": "Chair & Chief Executive Officer",
        "tenure": "Since 1999 (co-founder)",
        "background": "Founded Salesforce after 13 years at Oracle. Named one of the world's greatest leaders by Fortune. Champions stakeholder capitalism and corporate philanthropy through the 1-1-1 model.",
        "source_url": "https://www.salesforce.com/company/leadership/"
      },
      {
        "name": "Amy Weaver",
        "title": "President & Chief Financial Officer",
        "tenure": "CFO since 2022, at Salesforce since 2018",
        "background": "Former General Counsel at Salesforce. Prior experience at Experian and law firms. Led the company's pivot toward profitability and margin expansion.",
        "source_url": "https://www.salesforce.com/company/leadership/"
      }
    ],
    "ownership_structure": "Publicly traded on NYSE (ticker: CRM), widely held institutional ownership",
    "major_shareholders": [
      "The Vanguard Group (~7.5%)",
      "BlackRock (~6.2%)",
      "State Street Corporation (~4.1%)",
      "Marc Benioff (~1.5%, with significant voting influence)"
    ],
    "geographic_presence": [
      "North America (primary market, ~70% of revenue)",
      "Europe (UK, Germany, France — ~20% of revenue)",
      "Asia-Pacific (Japan, Australia, India — ~10% of revenue)",
      "Latin America (Brazil, Mexico — emerging presence)"
    ],
    "key_milestones": [
      {
        "fact": "Salesforce founded in a San Francisco apartment by Marc Benioff, Parker Harris, Dave Moellenhoff, and Frank Dominguez, pioneering the 'No Software' cloud CRM model.",
        "source_url": "https://www.salesforce.com/company/our-story/",
        "source_name": "Salesforce Our Story Page",
        "date": "1999-03-08",
        "confidence": "high"
      },
      {
        "fact": "IPO on NYSE at $11 per share, raising $110 million and establishing Salesforce as a public company.",
        "source_url": "https://investor.salesforce.com/press-releases",
        "source_name": "Salesforce Investor Relations",
        "date": "2004-06-23",
        "confidence": "high"
      },
      {
        "fact": "Completed acquisition of Slack Technologies for $27.7 billion, the largest enterprise software acquisition of 2021.",
        "source_url": "https://investor.salesforce.com/press-releases/2021/07-21-2021",
        "source_name": "Salesforce Investor Relations Press Release",
        "date": "2021-07-21",
        "confidence": "high"
      }
    ],
    "research_confidence": "high"
  },

  "products_services": {
    "summary": "Salesforce operates a multi-cloud platform spanning CRM, marketing automation, analytics, commerce, and AI. The product portfolio is organised into core 'clouds' that can be purchased individually or as integrated suites. The company is aggressively expanding into AI agents through Agentforce, its autonomous AI platform launched in 2024.",
    "total_product_lines": 12,
    "product_portfolio": [
      {
        "name": "Sales Cloud",
        "category": "CRM / Sales Automation",
        "description": "AI-powered CRM for sales teams covering lead management, opportunity tracking, forecasting, and pipeline analytics. The foundational Salesforce product.",
        "market_position": "leader",
        "target_audience": "Sales teams in mid-market and enterprise organisations",
        "pricing_tier": "enterprise",
        "key_differentiators": [
          "Einstein AI-powered lead scoring and forecasting",
          "Largest CRM ecosystem with 5,000+ AppExchange integrations",
          "Real-time pipeline analytics and revenue intelligence"
        ],
        "estimated_revenue_contribution": "~25% of subscription revenue",
        "source_url": "https://www.salesforce.com/products/sales/"
      },
      {
        "name": "Service Cloud",
        "category": "Customer Service / Support",
        "description": "Omni-channel customer service platform with case management, knowledge base, and AI-powered chatbots. Includes field service management capabilities.",
        "market_position": "leader",
        "target_audience": "Customer support and service operations teams",
        "pricing_tier": "enterprise",
        "key_differentiators": [
          "Omni-channel routing (voice, chat, email, social, messaging)",
          "Einstein AI for case classification and next-best-action",
          "Field service management with mobile workforce tools"
        ],
        "estimated_revenue_contribution": "~20% of subscription revenue",
        "source_url": "https://www.salesforce.com/products/service/"
      }
    ],
    "service_offerings": [
      {
        "name": "Salesforce Professional Services",
        "category": "Consulting & Implementation",
        "description": "Implementation, customisation, and strategic advisory services for Salesforce deployments. Includes industry-specific accelerators and change management.",
        "market_position": "strong_contender",
        "target_audience": "Enterprise customers requiring complex implementations",
        "pricing_tier": "premium",
        "key_differentiators": [
          "Deep platform expertise and proprietary methodologies",
          "Industry-specific solution accelerators"
        ],
        "estimated_revenue_contribution": "~8% of total revenue",
        "source_url": "https://www.salesforce.com/services/"
      }
    ],
    "flagship_products": ["Sales Cloud", "Service Cloud", "Marketing Cloud", "Agentforce", "Data Cloud"],
    "recent_launches": [
      {
        "fact": "Launched Agentforce, an autonomous AI agent platform enabling companies to build, customise, and deploy AI agents across sales, service, marketing, and commerce workflows.",
        "source_url": "https://www.salesforce.com/agentforce/",
        "source_name": "Salesforce Agentforce Product Page",
        "date": "2024-10-01",
        "confidence": "high"
      }
    ],
    "discontinued_products": [],
    "r_and_d_focus": "Salesforce is investing heavily in generative AI and autonomous agents (Agentforce), data integration (Data Cloud), and industry-specific vertical solutions. R&D spend was approximately $5.3B in FY2025, representing ~15% of revenue.",
    "intellectual_property": "Salesforce holds over 3,000 patents primarily in cloud computing, CRM, AI/ML, and multi-tenant architecture. Key trademarks include Salesforce, Einstein, Agentforce, and AppExchange.",
    "product_lifecycle_stage": "mixed",
    "research_confidence": "high"
  },

  "performance_profile": {
    "summary": "Salesforce delivered strong financial performance in FY2025 with $34.9B in revenue and significantly improved profitability. The company has shifted from a growth-at-all-costs model to a balanced growth-and-profitability approach, expanding operating margins to ~20%. Market share leadership in CRM remains intact at approximately 23% globally.",
    "financial_metrics": [
      {
        "metric": "Total Revenue",
        "value": "$34.9B",
        "period": "FY2025 (ended Jan 2025)",
        "trend": "growing",
        "source_url": "https://investor.salesforce.com/annual-reports/2025",
        "source_name": "Salesforce FY2025 10-K"
      },
      {
        "metric": "YoY Revenue Growth",
        "value": "11%",
        "period": "FY2025",
        "trend": "stable",
        "source_url": "https://investor.salesforce.com/annual-reports/2025",
        "source_name": "Salesforce FY2025 10-K"
      },
      {
        "metric": "GAAP Operating Margin",
        "value": "~20%",
        "period": "FY2025",
        "trend": "growing",
        "source_url": "https://investor.salesforce.com/annual-reports/2025",
        "source_name": "Salesforce FY2025 10-K"
      },
      {
        "metric": "Free Cash Flow",
        "value": "$12.4B",
        "period": "FY2025",
        "trend": "growing",
        "source_url": "https://investor.salesforce.com/annual-reports/2025",
        "source_name": "Salesforce FY2025 10-K"
      },
      {
        "metric": "Remaining Performance Obligations (RPO)",
        "value": "$53.5B",
        "period": "Q4 FY2025",
        "trend": "growing",
        "source_url": "https://investor.salesforce.com/quarterly-results",
        "source_name": "Salesforce Q4 FY2025 Earnings"
      }
    ],
    "revenue_trend": "growing",
    "profitability_assessment": "highly_profitable",
    "market_share": "~23% of global CRM market (Gartner, 2025)",
    "market_share_trend": "stable",
    "growth_rate": "11% YoY revenue growth (FY2025); guided 8-9% for FY2026",
    "key_kpis": [
      {
        "kpi_name": "Net Revenue Retention Rate",
        "value": ">100%",
        "benchmark": "Industry average ~105-110% for enterprise SaaS",
        "assessment": "Healthy retention indicating strong customer stickiness and upsell motion",
        "source_url": "https://investor.salesforce.com/annual-reports/2025"
      },
      {
        "kpi_name": "Customer Count",
        "value": "150,000+",
        "benchmark": "Largest enterprise CRM customer base globally",
        "assessment": "Massive installed base creates ecosystem moat and switching costs",
        "source_url": "https://www.salesforce.com/company/"
      }
    ],
    "competitive_ranking": "#1 globally by revenue in CRM market (Gartner, IDC)",
    "recent_performance_highlights": [
      {
        "fact": "Free cash flow grew 25% YoY to $12.4B in FY2025, reflecting the company's disciplined approach to margin expansion and capital allocation.",
        "source_url": "https://investor.salesforce.com/annual-reports/2025",
        "source_name": "Salesforce FY2025 10-K",
        "date": "2025-03-01",
        "confidence": "high"
      }
    ],
    "recent_performance_concerns": [
      {
        "fact": "Revenue growth decelerated from 24% in FY2023 to 11% in FY2025, raising questions about whether Salesforce is reaching maturity in its core CRM markets.",
        "source_url": "https://investor.salesforce.com/annual-reports/2025",
        "source_name": "Salesforce FY2025 10-K",
        "date": "2025-03-01",
        "confidence": "high"
      }
    ],
    "research_confidence": "high"
  },

  "outlook_strategy": {
    "summary": "Salesforce is positioning itself as the platform for enterprise AI agents through Agentforce, its flagship strategic initiative. The company is guiding for 8-9% revenue growth in FY2026 while continuing margin expansion. Key strategic bets include AI monetisation, industry verticalistion, and international expansion, balanced against risks of AI commoditisation and enterprise spending caution.",
    "stated_strategy": "Salesforce's stated strategy centres on becoming the #1 AI CRM, with Agentforce as the autonomous AI agent layer on top of its data and CRM platform. The company aims to drive new revenue streams through AI-based pricing (per-conversation/per-agent pricing), deepen platform stickiness through Data Cloud integration, and expand into regulated industries with vertical solutions.",
    "strategic_initiatives": [
      {
        "initiative": "Agentforce — autonomous AI agents for enterprise workflows across sales, service, marketing, and commerce",
        "status": "in_progress",
        "timeline": "GA launched October 2024; Agentforce 2.0 expected mid-2025; ongoing capability expansion",
        "strategic_rationale": "Positions Salesforce at the centre of the enterprise AI agent ecosystem, creating a new consumption-based revenue stream and deepening platform lock-in.",
        "source_url": "https://www.salesforce.com/agentforce/",
        "source_name": "Salesforce Agentforce Product Page"
      },
      {
        "initiative": "Data Cloud — unified customer data platform integrating structured and unstructured data across all Salesforce clouds",
        "status": "in_progress",
        "timeline": "Launched 2023; continuous enhancement through 2025-2026",
        "strategic_rationale": "Creates a unified data foundation that powers AI capabilities and increases switching costs by centralising customer data within the Salesforce ecosystem.",
        "source_url": "https://www.salesforce.com/data-cloud/",
        "source_name": "Salesforce Data Cloud Product Page"
      }
    ],
    "growth_plans": [
      {
        "fact": "Salesforce is targeting $50B in annual revenue by FY2029, driven by AI agent monetisation, international expansion, and vertical industry solutions.",
        "source_url": "https://investor.salesforce.com/events-and-presentations",
        "source_name": "Salesforce Investor Day 2025",
        "date": "2025-09-15",
        "confidence": "medium"
      }
    ],
    "expansion_targets": [
      "Regulated industries (healthcare, financial services, government)",
      "Asia-Pacific (Japan, India, Southeast Asia)",
      "SMB market through Starter/Pro editions",
      "AI agent marketplace and ecosystem"
    ],
    "investment_priorities": [
      "Generative AI and autonomous agents (Agentforce)",
      "Data Cloud and data integration infrastructure",
      "Industry-specific vertical solutions",
      "International go-to-market expansion"
    ],
    "industry_trends_affecting": [
      {
        "trend": "Enterprise adoption of AI agents and autonomous workflows is accelerating, with Gartner projecting 25% of enterprises will deploy AI agents by 2027",
        "impact": "tailwind",
        "timeframe": "near_term",
        "source_url": "https://www.gartner.com/en/articles/ai-agents-2025"
      },
      {
        "trend": "AI commoditisation risk as open-source models and hyperscaler AI services reduce barriers to building AI-powered applications",
        "impact": "headwind",
        "timeframe": "medium_term",
        "source_url": "https://www.reuters.com/technology/ai-commoditisation-enterprise-2025/"
      }
    ],
    "key_risks": [
      {
        "risk": "AI commoditisation — open-source models and cloud-native AI tools could undermine Salesforce's AI premium pricing strategy",
        "severity": "high",
        "likelihood": "medium",
        "mitigation": "Deep integration of AI with proprietary customer data (Data Cloud) creates differentiation that standalone AI models cannot replicate.",
        "source_url": "https://investor.salesforce.com/annual-reports/2025"
      },
      {
        "risk": "Enterprise spending caution — macroeconomic uncertainty and CFO scrutiny of software budgets could slow deal velocity and compress contract values",
        "severity": "medium",
        "likelihood": "medium",
        "mitigation": "Shift toward consumption-based pricing and ROI-driven selling, plus expansion into cost-saving AI agent use cases.",
        "source_url": "https://investor.salesforce.com/annual-reports/2025"
      }
    ],
    "analyst_consensus": "Consensus among sell-side analysts is cautiously optimistic — median price target implies ~15% upside. Analysts broadly support the Agentforce strategy but want evidence of meaningful AI revenue contribution. Concerns centre on growth deceleration and competitive pressure from Microsoft Copilot.",
    "growth_outlook": "moderate_growth",
    "research_confidence": "high"
  },

  "brand_profile": {
    "summary": "Salesforce is one of the most recognised enterprise software brands globally, built on a foundation of cloud innovation, customer success, and social responsibility. The brand has evolved from 'No Software' disruptor to trusted enterprise partner, and is now pivoting its identity toward AI-first leadership through Agentforce. Brand perception is generally positive but faces challenges around product complexity and pricing.",
    "brand_positioning": "Salesforce positions itself as the #1 AI CRM — the trusted platform that brings companies and customers together. The brand emphasises innovation, customer success, and a values-driven approach to business. Salesforce aims to be seen as the essential enterprise platform for the AI era.",
    "brand_promise": "Salesforce promises to help companies connect with their customers in new, intelligent ways — driving growth, efficiency, and trust through AI-powered CRM.",
    "brand_archetype": "The Pioneer / The Creator",
    "tagline_slogan": "The #1 AI CRM",
    "target_audience": {
      "primary": "C-suite executives and department heads (CRO, CMO, CTO, COO) at mid-market and enterprise companies seeking to transform customer relationships through technology",
      "secondary": "IT leaders and developers building on the Salesforce platform; SMB owners seeking affordable CRM",
      "demographics": "Decision-makers aged 30-55 at companies with 200+ employees, $50M+ revenue, primarily in North America and Europe",
      "psychographics": "Innovation-oriented, growth-focused, willing to invest in technology for competitive advantage, values-conscious (CSR, sustainability), frustrated by data silos and manual processes"
    },
    "brand_voice_tone": "Salesforce communicates with an optimistic, forward-looking tone that balances technical credibility with accessibility. The brand avoids jargon-heavy enterprise speak in favour of clear, benefit-driven messaging. There is a strong emphasis on 'trailblazing' — celebrating customer pioneers who transform their businesses with Salesforce.",
    "visual_identity": "The Salesforce brand is anchored by its cloud-shaped logo (SaaSy the cloud character has been retired, but the cloud motif persists). The primary colour is Salesforce Blue (#1798C1), with a secondary palette of whites, light greys, and accent colours. The visual language is clean, modern, and illustration-heavy, with a shift toward AI-themed imagery (agents, neural networks) in recent campaigns.",
    "key_messaging_pillars": [
      "AI-first CRM — intelligence embedded in every customer touchpoint",
      "Customer 360 — unified view of the customer across all channels",
      "Trust — the most trusted enterprise cloud platform",
      "Trailblazer community — a global ecosystem of innovators and experts",
      "Values-driven business — equality, sustainability, philanthropy (1-1-1 model)"
    ],
    "competitive_differentiation": [
      "Largest CRM ecosystem with 5,000+ AppExchange integrations and 10M+ Trailblazers",
      "Platform breadth — only vendor covering CRM, marketing, commerce, analytics, and AI agents in a single platform",
      "Data Cloud — unified customer data layer that no point-solution competitor can match",
      "Trust and compliance — SOC 2 Type II, HIPAA, FedRAMP, and industry-specific certifications",
      "Trailblazer community — the largest enterprise software community globally, creating ecosystem lock-in"
    ],
    "brand_perception": {
      "customer_sentiment": "positive",
      "industry_reputation": "thought_leader",
      "employer_brand": "strong",
      "key_perception_themes": [
        "Innovative and forward-thinking — consistently seen as a market leader in CRM",
        "Expensive — perceived as premium-priced, especially for SMBs and mid-market",
        "Complex — implementation and customisation require significant expertise",
        "Values-driven — admired for social responsibility and Ohana culture",
        "AI leader — increasingly associated with enterprise AI and agents"
      ],
      "source_urls": [
        "https://www.g2.com/products/salesforce-sales-cloud/reviews",
        "https://www.glassdoor.com/Overview/Salesforce-Reviews-EI_IE11159.htm",
        "https://www.gartner.com/reviews/market/crm-lead-management"
      ]
    },
    "competitors": [
      {
        "name": "Microsoft Dynamics 365",
        "relationship": "direct_competitor",
        "key_differentiator_vs_subject": "Deeply integrated with Microsoft 365 and Azure, offering lower TCO for organisations in the Microsoft ecosystem. Less customisable but simpler to deploy and benefits from Copilot AI integration.",
        "source_url": "https://www.gartner.com/reviews/market/crm-lead-management"
      },
      {
        "name": "HubSpot",
        "relationship": "direct_competitor",
        "key_differentiator_vs_subject": "Offers a freemium model and significantly lower entry pricing, targeting SMBs and mid-market with an integrated marketing-sales-service platform. Simpler to implement but less customisable at enterprise scale.",
        "source_url": "https://www.g2.com/compare/salesforce-sales-cloud-vs-hubspot-crm"
      },
      {
        "name": "Adobe Experience Cloud",
        "relationship": "indirect_competitor",
        "key_differentiator_vs_subject": "Stronger in marketing experience and content management (AEM, Marketo) but lacks Salesforce's CRM depth. Competes primarily in marketing automation and digital experience.",
        "source_url": "https://www.gartner.com/reviews/market/multichannel-marketing-hubs"
      }
    ],
    "brand_equity_indicators": [
      {
        "fact": "Salesforce ranked #1 in CRM market share globally for the 11th consecutive year by Gartner (2025), with approximately 23% market share.",
        "source_url": "https://www.gartner.com/en/newsroom/press-releases/crm-market-share-2025",
        "source_name": "Gartner CRM Market Share Report 2025",
        "date": "2025-06-01",
        "confidence": "high"
      },
      {
        "fact": "Named #1 on Fortune's Best Companies to Work For list in 2023 and consistently ranked in the top 10 for employer brand.",
        "source_url": "https://www.greatplacetowork.com/best-companies/salesforce",
        "source_name": "Great Place to Work — Salesforce Profile",
        "date": "2023-01-15",
        "confidence": "high"
      }
    ],
    "digital_presence": {
      "website": "https://www.salesforce.com",
      "social_platforms": [
        "LinkedIn (~5.5M followers)",
        "Twitter/X (@salesforce, ~1.2M followers)",
        "YouTube (Salesforce channel, ~400K subscribers)",
        "Instagram (@salesforce, ~350K followers)"
      ],
      "engagement_assessment": "strong",
      "source_url": "https://www.linkedin.com/company/salesforce"
    },
    "recent_brand_activity": [
      {
        "fact": "Launched the 'Humans with Agents' brand campaign positioning Salesforce as the leader in human-AI collaboration for enterprise workflows.",
        "source_url": "https://www.salesforce.com/campaign/humans-with-agents/",
        "source_name": "Salesforce Humans with Agents Campaign Page",
        "date": "2025-01-15",
        "confidence": "high"
      }
    ],
    "research_confidence": "high"
  },

  "overall_profile_completeness": 9,
  "key_gaps": [
    "Detailed revenue breakdown by individual cloud product line is estimated, not officially disclosed at the product level",
    "Net Promoter Score (NPS) data is not publicly available"
  ],
  "cross_section_insights": [
    "Salesforce's brand positioning as '#1 AI CRM' directly supports its Agentforce strategic initiative — the brand and product strategy are tightly aligned.",
    "Revenue growth deceleration (Performance) contrasts with aggressive AI investment (Outlook) — the company is betting that Agentforce will reignite growth, creating a critical execution window.",
    "The premium pricing perception in Brand Profile aligns with the enterprise pricing tier across Product Portfolio, but creates vulnerability in the SMB segment where HubSpot is gaining share.",
    "Strong employer brand (Brand Profile) and 73,000 employees (Company Overview) support the talent acquisition needed for AI R&D investment priorities (Outlook)."
  ],

  "citations": [
    {
      "id": 1,
      "source_name": "Salesforce FY2025 Annual Report (10-K)",
      "url": "https://investor.salesforce.com/annual-reports/2025",
      "type": "annual_report",
      "accessed_date": "2026-04-16",
      "description": "Primary source for financial metrics, revenue, margins, employee count, RPO, and strategic priorities."
    },
    {
      "id": 2,
      "source_name": "Salesforce Company Overview Page",
      "url": "https://www.salesforce.com/company/",
      "type": "company_website",
      "accessed_date": "2026-04-16",
      "description": "Company description, mission statement, customer count, and corporate overview."
    },
    {
      "id": 3,
      "source_name": "Salesforce Leadership Page",
      "url": "https://www.salesforce.com/company/leadership/",
      "type": "company_website",
      "accessed_date": "2026-04-16",
      "description": "Executive team bios, titles, and tenure information."
    },
    {
      "id": 4,
      "source_name": "Gartner CRM Market Guide 2025",
      "url": "https://www.gartner.com/reviews/market/crm-lead-management",
      "type": "analyst_report",
      "accessed_date": "2026-04-16",
      "description": "Market share data, competitive positioning, and vendor comparison for CRM market."
    },
    {
      "id": 5,
      "source_name": "Salesforce Agentforce Product Page",
      "url": "https://www.salesforce.com/agentforce/",
      "type": "company_website",
      "accessed_date": "2026-04-16",
      "description": "Product details, launch timeline, and strategic positioning for Salesforce's AI agent platform."
    },
    {
      "id": 6,
      "source_name": "Reuters — Salesforce Bets Big on AI Agents",
      "url": "https://www.reuters.com/technology/salesforce-agentforce-2025/",
      "type": "news_article",
      "accessed_date": "2026-04-16",
      "description": "News coverage of Salesforce's AI agent strategy and competitive landscape."
    },
    {
      "id": 7,
      "source_name": "Salesforce Investor Relations — Press Releases",
      "url": "https://investor.salesforce.com/press-releases",
      "type": "press_release",
      "accessed_date": "2026-04-16",
      "description": "Historical press releases including IPO and acquisition announcements."
    },
    {
      "id": 8,
      "source_name": "Salesforce Our Story Page",
      "url": "https://www.salesforce.com/company/our-story/",
      "type": "company_website",
      "accessed_date": "2026-04-16",
      "description": "Company founding story and key historical milestones."
    },
    {
      "id": 9,
      "source_name": "Salesforce Investor Relations — Slack Acquisition",
      "url": "https://investor.salesforce.com/press-releases/2021/07-21-2021",
      "type": "press_release",
      "accessed_date": "2026-04-16",
      "description": "Announcement of completed Slack acquisition for $27.7 billion."
    },
    {
      "id": 10,
      "source_name": "G2 Salesforce Sales Cloud Reviews",
      "url": "https://www.g2.com/products/salesforce-sales-cloud/reviews",
      "type": "other",
      "accessed_date": "2026-04-16",
      "description": "Aggregated customer reviews and satisfaction scores for Sales Cloud."
    },
    {
      "id": 11,
      "source_name": "Glassdoor Salesforce Employee Reviews",
      "url": "https://www.glassdoor.com/Overview/Salesforce-Reviews-EI_IE11159.htm",
      "type": "other",
      "accessed_date": "2026-04-16",
      "description": "Employee reviews, employer brand ratings, and workplace culture assessment."
    },
    {
      "id": 12,
      "source_name": "Gartner — AI Agents 2025 Forecast",
      "url": "https://www.gartner.com/en/articles/ai-agents-2025",
      "type": "analyst_report",
      "accessed_date": "2026-04-16",
      "description": "Industry forecast for enterprise AI agent adoption rates and market sizing."
    }
  ]
}
```

---

## Notes

- All date fields use ISO 8601 format (e.g., `2026-04-16T10:00:00Z` or `2026-04-16`)
- Research confidence is per-section, reflecting data availability for that specific dimension
- The `overall_profile_completeness` score measures research thoroughness, NOT brand quality — a terrible company can score 10/10 if comprehensively documented
- Every `source_url` should correspond to an entry in the top-level `citations` array
- For private companies, use `"undisclosed"`, `"unknown"`, or `null` for unavailable financial data — never fabricate metrics
- The `key_gaps` array should honestly disclose what the research could not find — this is a feature, not a failure
- Arrays maintain order by relevance/importance (first item is most significant)
