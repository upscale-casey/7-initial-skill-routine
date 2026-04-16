# PESTLE Analysis JSON Schema

## Overview

This document defines the complete JSON structure for PESTLE analysis output. The schema is hierarchical, with top-level metadata, six per-factor sections, and aggregate scoring/risk assessment.

---

## Shared Sub-Objects

### PESTLEFactor

Each individual trend or force within a PESTLE factor follows this structure:

```json
{
  "factor_name": "string — e.g., 'AI Regulation Tightening'",
  "description": "string — 1–2 sentence explanation of the trend",
  "impact_score": "integer 1–5 — transformative impact (5) to negligible (1)",
  "likelihood_score": "integer 1–5 — highly probable (5) to unlikely (1)",
  "priority_score": "integer 1–25 — calculated as impact_score × likelihood_score",
  "risk_zone": "enum: 'low' | 'medium' | 'high' | 'critical'",
  "time_horizon": "enum: 'immediate' | 'short_term' | 'medium_term' | 'long_term'",
  "swot_mapping": {
    "type": "enum: 'opportunity' | 'threat'",
    "strategic_implication": "string — how this factor affects strategy (1–2 sentences)"
  },
  "evidence": [
    "string — specific data point, quote, or example (2–3 items)"
  ],
  "data_sources": [
    "string — URL, report name, or source attribution (2–3 items)"
  ]
}
```

**Example:**
```json
{
  "factor_name": "Generative AI Adoption in Enterprise",
  "description": "Rapid deployment of LLMs in corporate workflows is increasing productivity and reducing manual labor, but also creating skills gaps and cost pressures.",
  "impact_score": 5,
  "likelihood_score": 5,
  "priority_score": 25,
  "risk_zone": "critical",
  "time_horizon": "immediate",
  "swot_mapping": {
    "type": "opportunity",
    "strategic_implication": "Early adoption of AI-augmented tools can drive competitive advantage in talent retention and operational efficiency."
  },
  "evidence": [
    "McKinsey (2024): 55% of enterprises have deployed AI in one or more business functions",
    "LinkedIn Skills Report: AI literacy ranked among top 5 in-demand skills globally",
    "Gartner: 45% of CIOs expect significant productivity gains from AI within 18 months"
  ],
  "data_sources": [
    "https://www.mckinsey.com/...",
    "https://www.linkedin.com/jobs/skills/...",
    "https://www.gartner.com/..."
  ]
}
```

---

### Recommendation

Each recommendation within a factor is structured as:

```json
{
  "action": "string — concrete, actionable step (e.g., 'Establish an AI Governance Board')",
  "rationale": "string — why this action matters (1–2 sentences)",
  "priority": "enum: 'critical' | 'high' | 'medium' | 'low'",
  "effort": "enum: 'high' | 'medium' | 'low'",
  "timeframe": "enum: 'immediate' | 'short_term' | 'medium_term' | 'long_term'"
}
```

**Example:**
```json
{
  "action": "Launch a cross-functional task force to identify and pilot AI applications in core workflows",
  "rationale": "Early pilots reduce deployment risk and build internal capability in a low-stakes environment.",
  "priority": "high",
  "effort": "medium",
  "timeframe": "immediate"
}
```

---

## Per-Factor Section Structure

Each of Political, Economic, Social, Technological, Legal, and Environmental follows this template:

```json
{
  "summary": "string — 2–4 sentence overview of the factor's implications (required)",
  "factors": [
    { PESTLEFactor object },
    { PESTLEFactor object },
    ...
  ],
  "overall_impact": "enum: 'high' | 'medium' | 'low'",
  "trend_direction": "enum: 'improving' | 'stable' | 'deteriorating'",
  "key_risks": [
    "string — up to 3 bulleted risks",
    ...
  ],
  "key_opportunities": [
    "string — up to 3 bulleted opportunities",
    ...
  ],
  "recommendations": [
    { Recommendation object },
    { Recommendation object },
    ...
  ],
  "score": "integer 1–10 — holistic rating of this factor's strategic importance"
}
```

**Example (Political):**
```json
{
  "summary": "Regulatory environments in key markets are tightening around data privacy, AI governance, and market competition. The EU's AI Act and China's AI regulation set a precedent for stricter oversight globally. Compliance costs are rising, but early compliance can differentiate competitors.",
  "factors": [
    { PESTLEFactor },
    { PESTLEFactor }
  ],
  "overall_impact": "high",
  "trend_direction": "deteriorating",
  "key_risks": [
    "Regulatory delays slowing product launches in high-value markets",
    "Compliance costs eroding margins in price-sensitive segments",
    "Political instability in key geographies disrupting supply chains"
  ],
  "key_opportunities": [
    "Early compliance positioning as trusted, premium vendor",
    "Partnerships with policy bodies to shape regulation in company's favor",
    "Expansion into markets with favorable policy regimes"
  ],
  "recommendations": [
    { Recommendation },
    { Recommendation }
  ],
  "score": 9
}
```

---

## Top-Level Structure

The root JSON object ties all six factors together and includes aggregate analysis:

```json
{
  "company_name": "string — name of the business or industry analyzed",
  "industry": "string — e.g., 'SaaS', 'Healthcare', 'Automotive'",
  "market_scope": "string — geographic or market focus (e.g., 'North America', 'Global Enterprise')",
  "analysis_date": "string — ISO 8601 timestamp (e.g., '2026-04-09')",
  "data_sources": [
    "string — list of primary sources consulted (URLs, reports, news outlets)",
    ...
  ],
  "executive_summary": "string — 3–5 sentence synopsis of headline findings and overall strategic posture",
  
  "political": { PoliticalAnalysis object },
  "economic": { EconomicAnalysis object },
  "social": { SocialAnalysis object },
  "technological": { TechnologicalAnalysis object },
  "legal": { LegalAnalysis object },
  "environmental": { EnvironmentalAnalysis object },
  
  "overall_risk_score": "integer 1–10 — aggregate downside exposure across all factors",
  "overall_opportunity_score": "integer 1–10 — aggregate upside potential",
  "overall_assessment": "enum: 'highly_favorable' | 'favorable' | 'neutral' | 'challenging' | 'highly_challenging'",
  
  "risk_matrix": [
    {
      "factor_name": "string",
      "category": "enum: 'political' | 'economic' | 'social' | 'technological' | 'legal' | 'environmental'",
      "impact_score": "integer 1–5",
      "likelihood_score": "integer 1–5",
      "priority_score": "integer 1–25",
      "risk_zone": "enum: 'low' | 'medium' | 'high' | 'critical'"
    },
    ...
  ],
  
  "swot_feed": {
    "opportunities": [
      "string — opportunity statement to carry into SWOT analysis",
      ...
    ],
    "threats": [
      "string — threat statement to carry into SWOT analysis",
      ...
    ]
  },
  
  "top_priorities": [
    {
      "priority": "integer (1–5 or 1–N) — ranking within top priorities",
      "pestle_category": "enum: 'political' | 'economic' | 'social' | 'technological' | 'legal' | 'environmental'",
      "factor_name": "string",
      "expected_impact": "enum: 'transformative' | 'high' | 'moderate' | 'low'"
    },
    ...
  ],
  
  "cross_factor_dynamics": [
    "string — observation on how two or more PESTLE factors interact (2–3 statements)",
    ...
  ]
}
```

---

## Validation & Rules

1. **Priority Score**: Must equal `impact_score × likelihood_score` (1–25 range)
2. **Risk Zone Classification**:
   - 1–6: low
   - 7–12: medium
   - 13–19: high
   - 20–25: critical
3. **Time Horizons**: Must be one of immediate | short_term | medium_term | long_term
4. **Scores (1–10)**: Must be integers in range [1, 10]
5. **Scores (1–5)**: Must be integers in range [1, 5]
6. **Enum fields**: Must be one of the specified values; no free text
7. **Arrays**: Must contain at least 1 item (except optional sections)
8. **Dates**: Must be valid ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ or with offset)

---

## Example: Minimal Top-Level Structure

```json
{
  "company_name": "CloudSync Inc.",
  "industry": "SaaS / Cloud Storage",
  "market_scope": "Global",
  "analysis_date": "2026-04-09",
  "data_sources": [
    "https://example.com/market-report-2026",
    "https://news.example.com/cloud-trends"
  ],
  "executive_summary": "CloudSync operates in a highly competitive, rapidly evolving market with strong tailwinds from cloud adoption and AI integration, offset by regulatory pressures on data privacy and the emergence of new competitors. Overall, the macro environment is favorable but requires aggressive positioning on compliance and differentiation.",
  
  "political": { ... },
  "economic": { ... },
  "social": { ... },
  "technological": { ... },
  "legal": { ... },
  "environmental": { ... },
  
  "overall_risk_score": 6,
  "overall_opportunity_score": 8,
  "overall_assessment": "favorable",
  
  "risk_matrix": [ ... ],
  
  "swot_feed": {
    "opportunities": [
      "First-mover advantage in AI-powered data governance solutions",
      "Growing demand for privacy-first cloud infrastructure",
      "Expansion into emerging markets with rising digital adoption"
    ],
    "threats": [
      "Regulatory compliance costs eating into margins",
      "Competition from hyperscale cloud providers (AWS, Azure, GCP)",
      "Economic slowdown reducing enterprise IT budgets"
    ]
  },
  
  "top_priorities": [
    {
      "priority": 1,
      "pestle_category": "technological",
      "factor_name": "AI-Powered Cloud Services",
      "expected_impact": "transformative"
    },
    {
      "priority": 2,
      "pestle_category": "legal",
      "factor_name": "Data Privacy Regulations (GDPR, CCPA, etc.)",
      "expected_impact": "high"
    }
  ],
  
  "cross_factor_dynamics": [
    "Technological AI adoption is driving regulatory scrutiny (Legal), increasing compliance costs but also creating differentiation opportunities.",
    "Economic pressures on IT budgets (Economic) are forcing companies to seek efficiency gains, which AI solutions (Technological) can deliver, supporting demand growth."
  ]
}
```

---

## Notes for Implementers

- **Optional fields**: None at the top level; however, `key_risks`, `key_opportunities`, `recommendations`, `evidence`, and `data_sources` may be empty arrays if not applicable (though this should be rare).
- **Nested objects**: Ensure all nested objects (PESTLEFactor, Recommendation, etc.) are fully validated.
- **Localization**: Market scope and data sources should reflect the geography/market of analysis.
- **Consistency**: Ensure score assignments are consistent across factors (e.g., if two factors have similar priority_scores, they should be adjacent in `top_priorities`).
