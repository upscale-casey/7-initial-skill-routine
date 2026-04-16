# 9 Cs Analysis JSON Schema Reference

This document defines every field in the output JSON. Follow this schema exactly — every field is required unless noted otherwise.

## Shared Sub-Objects

These structures are reused across all nine C sections.

### StrengthWeakness

```json
{
  "point": "string — A specific strength or weakness",
  "evidence": "string — Supporting evidence, data, or reasoning",
  "impact": "enum: high | medium | low — How significant this is to the overall business"
}
```

### Recommendation

```json
{
  "action": "string — A specific, actionable recommendation",
  "rationale": "string — Why this recommendation would improve performance or mitigate risk",
  "priority": "enum: critical | high | medium | low",
  "effort": "enum: high | medium | low — Estimated effort to implement",
  "timeframe": "enum: immediate | short_term | medium_term | long_term"
}
```

### CompetitivePosition

```json
{
  "dimension": "string — The competitive dimension being assessed (e.g. 'market share in enterprise segment', 'innovation velocity')",
  "position": "enum: leader | strong | average | weak | lagging",
  "key_competitors": ["string — Named competitors relevant to this dimension"],
  "notes": "string — Additional context about the competitive position"
}
```

---

## Company Analysis

```json
{
  "summary": "string — Executive summary of the company's health, position, and strategic context (2-4 sentences)",
  "financial_health": "enum: excellent | strong | stable | stressed | critical — Overall financial condition",
  "organizational_structure": "string — Description of organizational design, hierarchy, and key functions",
  "core_capabilities": ["string — Key operational and strategic capabilities that differentiate the company"],
  "strategic_vision": "string — The company's mission, vision, or stated strategic direction",
  "operational_efficiency": "enum: world_class | advanced | competent | developing | poor — Quality of operations and execution",
  "brand_positioning": "string — How the brand is positioned in the market and customer perception",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10 — Overall company health and positioning score"
}
```

---

## Customers Analysis (B2B decision-makers, contract holders)

```json
{
  "summary": "string — Executive summary of the customer base, value delivery, and account health (2-4 sentences)",
  "customer_segments": [
    {
      "segment_name": "string — Name or description of the customer segment",
      "size": "string — Estimated number of accounts or revenue contribution",
      "strategic_importance": "enum: critical | high | medium | low",
      "characteristics": "string — What defines this segment"
    }
  ],
  "buying_process": "string — How customers evaluate, decide, and purchase; sales cycle length",
  "contract_health": "enum: excellent | strong | stable | at_risk | critical — Overall renewal rates and expansion potential",
  "retention_rate_assessment": "enum: excellent | strong | stable | declining | poor",
  "lifetime_value_assessment": "enum: very_high | high | moderate | low | very_low",
  "account_concentration_risk": "enum: low | moderate | high | critical — Revenue concentration in top customers",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10 — Overall customer relationship health and value delivery score"
}
```

---

## Consumers Analysis (End users, beneficiaries)

```json
{
  "summary": "string — Executive summary of consumer base, satisfaction, and engagement (2-4 sentences)",
  "demographics": "string — Age, income, geography, education, professional profile of primary users",
  "psychographics": "string — Values, attitudes, lifestyle, motivations of primary users",
  "behavior_patterns": ["string — How consumers discover, use, and derive value from the offering"],
  "needs_assessment": "string — What core needs does the offering address; are there unmet needs?",
  "satisfaction_level": "enum: exceptional | strong | adequate | declining | poor",
  "usage_frequency": "enum: daily | weekly | monthly | occasional | rare",
  "pain_points": ["string — Frustrations, barriers, or gaps in the current experience"],
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10 — Overall consumer satisfaction and engagement score"
}
```

---

## Category Analysis (Market and industry context)

```json
{
  "summary": "string — Executive summary of market size, growth, and structural dynamics (2-4 sentences)",
  "market_size_assessment": "enum: very_large | large | moderate | small | emerging",
  "growth_trajectory": "enum: accelerating | high_growth | moderate_growth | flat | declining",
  "industry_trends": ["string — Key secular trends reshaping the category (e.g. consolidation, tech disruption, regulatory shift)"],
  "regulatory_environment": "string — Current regulations, compliance requirements, and regulatory direction",
  "technology_shifts": ["string — How technology is disrupting or transforming the category"],
  "supply_chain_dynamics": "string — Upstream supplier landscape, logistics, inventory, and dependencies",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10 — Overall category attractiveness and growth opportunity score"
}
```

---

## Competitors Analysis

```json
{
  "summary": "string — Executive summary of competitive landscape, intensity, and positioning (2-4 sentences)",
  "key_competitors": [
    {
      "name": "string — Competitor name",
      "market_share_est": "string — Estimated market share or relative size",
      "positioning": "string — How they position relative to your company",
      "key_strengths": ["string"],
      "key_weaknesses": ["string"]
    }
  ],
  "competitive_intensity": "enum: extreme | high | moderate | low | minimal",
  "barriers_to_entry": "enum: very_high | high | moderate | low | minimal",
  "competitive_position": [CompetitivePosition],
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10 — Overall competitive positioning and advantage score"
}
```

---

## Collaborators Analysis (Partners, suppliers, ecosystem)

```json
{
  "summary": "string — Executive summary of partnership landscape, supplier health, and ecosystem dynamics (2-4 sentences)",
  "key_partners": [
    {
      "name": "string — Partner or supplier name",
      "type": "enum: strategic_partner | vendor | channel_partner | technology_partner | investor | other",
      "relationship_strength": "enum: critical | strong | stable | weak | at_risk",
      "strategic_importance": "enum: critical | high | medium | low"
    }
  ],
  "supplier_health": "enum: excellent | strong | stable | at_risk | critical — Overall supplier landscape health",
  "channel_partners": ["string — Distribution, reseller, or go-to-market partners"],
  "ecosystem_maturity": "enum: world_class | advanced | competent | developing | fragmented",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10 — Overall partnership quality and ecosystem health score"
}
```

---

## Climate Analysis (Macro environment: economic, regulatory, ESG, geo-political)

```json
{
  "summary": "string — Executive summary of macro environment, risks, and tailwinds (2-4 sentences)",
  "economic_conditions": "enum: expansion | stable | slowdown | recession | crisis",
  "regulatory_changes": ["string — Recent or pending regulatory shifts and compliance requirements"],
  "esg_factors": "string — Environmental, social, governance risks and opportunities affecting the business",
  "sustainability_trends": ["string — How climate, resource scarcity, or circular economy trends impact the business"],
  "macro_risks": ["string — Geopolitical, inflation, supply chain, or other macro risks"],
  "currency_trade_impacts": "string — Effects of forex volatility, tariffs, or trade policy on operations",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10 — Overall macro environment favorability and risk mitigation score"
}
```

---

## Culture Analysis (Organizational capabilities, values, engagement)

```json
{
  "summary": "string — Executive summary of culture, decision-making, and organizational health (2-4 sentences)",
  "organizational_values": "string — Core stated or lived values; cultural pillars",
  "decision_making_style": "enum: hierarchical | consensus | distributed | entrepreneurial | other",
  "innovation_capacity": "enum: industry_leading | strong | moderate | limited | minimal",
  "employee_engagement": "enum: exceptional | strong | adequate | declining | poor",
  "change_readiness": "enum: exceptional | strong | adequate | resistant | rigid",
  "cultural_alignment_score": "number 1-10 — How well strategy aligns with culture",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10 — Overall organizational culture health and capability score"
}
```

---

## Community Analysis (Stakeholder relations, social impact, reputation)

```json
{
  "summary": "string — Executive summary of stakeholder landscape, impact, and reputation (2-4 sentences)",
  "stakeholder_groups": [
    {
      "name": "string — Stakeholder group (e.g. employees, local community, NGOs, regulators, media)",
      "importance": "enum: critical | high | medium | low",
      "sentiment": "enum: very_positive | positive | neutral | negative | very_negative"
    }
  ],
  "social_responsibility_assessment": "enum: exemplary | strong | adequate | minimal | concerning",
  "local_impact": "string — Effect on local economy, employment, community development where company operates",
  "industry_standing": "enum: thought_leader | respected | accepted | questioned | controversial",
  "corporate_citizenship": "enum: exemplary | strong | adequate | minimal | absent",
  "reputation_score": "number 1-10 — Overall brand reputation and stakeholder trust",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10 — Overall community impact and stakeholder relationship score"
}
```

---

## Top-Level Structure

```json
{
  "company_name": "string — Name of the business being analyzed",
  "industry": "string — Industry or sector",
  "analysis_date": "string — ISO 8601 date (e.g. '2026-04-09')",
  "data_sources": ["string — URLs or descriptions of sources used"],
  "executive_summary": "string — High-level synthesis of the entire 9 Cs analysis (3-5 sentences)",
  "company": { CompanyAnalysis },
  "customers": { CustomerAnalysis },
  "consumers": { ConsumerAnalysis },
  "category": { CategoryAnalysis },
  "competitors": { CompetitorAnalysis },
  "collaborators": { CollaboratorAnalysis },
  "climate": { ClimateAnalysis },
  "culture": { CultureAnalysis },
  "community": { CommunityAnalysis },
  "overall_score": "number 1-10 — Weighted overall business health score",
  "overall_assessment": "enum: excellent | strong | good | adequate | needs_improvement | weak | critical",
  "top_priorities": [
    {
      "priority": "string — The priority action item",
      "c_category": "enum: company | customers | consumers | category | competitors | collaborators | climate | culture | community",
      "expected_impact": "enum: transformative | high | moderate | low"
    }
  ],
  "cross_c_dynamics": ["string — Identified synergies or conflicts between the 9 Cs (e.g., 'Strong culture enables innovation which is critical to competitive positioning', or 'Over-reliance on single customer segment conflicts with category fragmentation risk')"]
}
```

## Notes

- `top_priorities` should contain 3-5 items, ranked by expected impact
- `cross_c_dynamics` should identify real inter-C interactions (minimum 3 distinct dynamics) showing where strength in one C amplifies or limits another
- `overall_score` is a weighted assessment, not a simple average of the nine C scores — weight by strategic impact and risk/opportunity magnitude
- `data_sources` in research mode should contain at least 5 URLs; in text/file mode, describe the source (e.g., "User-provided business plan document")
- All arrays (strengths, weaknesses, competitive_position, recommendations) should have at least 2 items each
- Each C should be analyzed with comparable depth and rigor; avoid superficial treatment of any C
