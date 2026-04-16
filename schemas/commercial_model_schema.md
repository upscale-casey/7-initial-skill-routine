# Commercial Model Analysis Schema

## Shared Sub-Objects

### StrengthWeakness
```json
{
  "point": "string - concise statement",
  "evidence": "string - supporting data or observation",
  "impact": "high | medium | low"
}
```

### Recommendation
```json
{
  "action": "string - specific actionable step",
  "rationale": "string - why this matters",
  "priority": "critical | high | medium | low",
  "effort": "high | medium | low",
  "timeframe": "string - e.g., 'Q2 2026', '3-6 months', 'immediate'"
}
```

### Benchmark
```json
{
  "metric_name": "string",
  "company_value": "string",
  "industry_benchmark": "string",
  "percentile_estimate": "string - e.g., '75th percentile'",
  "assessment": "above_benchmark | at_benchmark | below_benchmark"
}
```

---

## Section Schemas

### RevenueModel
```json
{
  "summary": "string - 2-3 sentences on revenue strategy",
  "pricing_strategy": "cost_plus | value_based | penetration | skimming | dynamic | freemium | subscription | usage_based | hybrid | other",
  "revenue_streams": [
    {
      "name": "string",
      "type": "recurring | transactional | licensing | advertising | other",
      "contribution_pct": "number 0-100",
      "growth_trend": "growing | stable | declining"
    }
  ],
  "customer_concentration_risk": "high | medium | low",
  "revenue_diversification_score": "number 1-10",
  "geographic_revenue_split": [
    {
      "region": "string",
      "pct": "number 0-100"
    }
  ],
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10"
}
```

### UnitEconomics
```json
{
  "summary": "string - overview of unit-level profitability",
  "cac_assessment": {
    "value": "string - e.g., '$45 per customer'",
    "trend": "increasing | stable | decreasing",
    "channel_breakdown": [
      {
        "channel": "string",
        "cac": "string"
      }
    ]
  },
  "ltv_assessment": {
    "value": "string - e.g., '$1,200 over 24 months'",
    "calculation_method": "string - e.g., 'ARPU × Months × Gross Margin'",
    "confidence": "high | medium | low"
  },
  "ltv_cac_ratio": {
    "value": "number",
    "assessment": "excellent | good | adequate | poor | critical",
    "benchmark": "string - e.g., '3:1 or higher is healthy'"
  },
  "cac_payback_period": {
    "months": "number",
    "assessment": "string - e.g., 'acceptable for SaaS'"
  },
  "arpu": {
    "value": "string - e.g., '$85/month'",
    "trend": "increasing | stable | decreasing"
  },
  "churn_rate": {
    "value": "string - e.g., '5% monthly'",
    "type": "monthly | annual",
    "benchmark": "string"
  },
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10"
}
```

### MarginProfile
```json
{
  "summary": "string - overview of profitability margins",
  "gross_margin": {
    "pct": "number 0-100",
    "trend": "expanding | stable | contracting",
    "benchmark": "string"
  },
  "contribution_margin": {
    "pct": "number 0-100",
    "trend": "expanding | stable | contracting"
  },
  "operating_margin": {
    "pct": "number 0-100",
    "trend": "expanding | stable | contracting",
    "benchmark": "string"
  },
  "net_margin": {
    "pct": "number 0-100",
    "trend": "expanding | stable | contracting",
    "benchmark": "string"
  },
  "ebitda_margin": {
    "pct": "number 0-100",
    "trend": "expanding | stable | contracting"
  },
  "margin_trajectory": "expanding | stable | contracting",
  "segment_margins": [
    {
      "segment": "string",
      "margin_pct": "number 0-100"
    }
  ],
  "cost_structure_assessment": "string - breakdown of COGS, OpEx categories",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10"
}
```

### Remuneration
```json
{
  "summary": "string - overview of compensation strategy",
  "fixed_variable_mix": "string - e.g., '70% base / 30% variable'",
  "sales_compensation_pct_revenue": "string - e.g., '8-10% of revenue'",
  "commission_structure": "string - description of tiers, caps, clawback rules",
  "incentive_alignment": "strong | adequate | misaligned | unknown",
  "retention_impact": "positive | neutral | negative | unknown",
  "total_comp_benchmarking": "string - vs industry standards",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10"
}
```

### MarketingROI
```json
{
  "summary": "string - overview of marketing efficiency and ROI",
  "overall_roi_pct": "number",
  "roas": {
    "value": "number",
    "benchmark": "string"
  },
  "marketing_efficiency_ratio": "string - e.g., 'CAC / LTV ratio'",
  "cac_by_channel": [
    {
      "channel": "string",
      "cac": "string",
      "roi": "number or string"
    }
  ],
  "attribution_model": "first_touch | last_touch | multi_touch | algorithmic | unknown",
  "budget_allocation": [
    {
      "channel": "string",
      "pct": "number 0-100",
      "roi_assessment": "string"
    }
  ],
  "mer_magic_number": "string - e.g., '0.75 magic number SaaS metric'",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number 1-10"
}
```

### ScenarioPlanning
```json
{
  "base_case": {
    "assumptions": ["string"],
    "revenue_forecast": "string - e.g., '$10M year 1, $18M year 2'",
    "margin_forecast": "string - e.g., '35% gross, 15% net'",
    "key_metrics": {
      "metric_name": "value"
    }
  },
  "bull_case": {
    "assumptions": ["string"],
    "revenue_forecast": "string",
    "margin_forecast": "string",
    "key_metrics": {
      "metric_name": "value"
    }
  },
  "bear_case": {
    "assumptions": ["string"],
    "revenue_forecast": "string",
    "margin_forecast": "string",
    "key_metrics": {
      "metric_name": "value"
    }
  },
  "key_sensitivities": [
    {
      "variable": "string - e.g., 'churn rate'",
      "impact_on_revenue": "string - e.g., '2% change = $500K impact'",
      "impact_on_margin": "string - e.g., '2% change = 150bp impact'"
    }
  ],
  "breakeven_analysis": "string - monthly burn, runway, breakeven timeline",
  "cash_runway_assessment": "string - months of runway at various burn rates"
}
```

---

## Top-Level Schema

```json
{
  "company_name": "string",
  "industry": "string",
  "analysis_date": "ISO 8601 format YYYY-MM-DDTHH:MM:SSZ",
  "data_sources": ["string - list of sources used"],
  "executive_summary": "string - 3-4 paragraph overview",
  "revenue_model": {RevenueModel},
  "unit_economics": {UnitEconomics},
  "margin_profile": {MarginProfile},
  "remuneration": {Remuneration},
  "marketing_roi": {MarketingROI},
  "scenario_planning": {ScenarioPlanning},
  "overall_score": "number 1-10",
  "overall_assessment": "string - enum: excellent | strong | adequate | concerning | critical",
  "commercial_health": "enum: thriving | healthy | stable | stressed | critical",
  "top_priorities": [
    {
      "priority": "number - 1, 2, 3, etc",
      "section": "string - which section",
      "expected_impact": "string - what improvement you expect"
    }
  ],
  "key_benchmarks": [Benchmark],
  "cross_section_dynamics": [
    "string - relationships between sections, e.g., 'High CAC requires stronger LTV through longer contract terms'"
  ]
}
```

---

## Notes

- All numeric percentages should be stored as 0-100, not 0-1
- Scores are always 1-10, with 5 as neutral/average
- Trend fields support: growing/increasing, stable, declining/decreasing
- Use ISO 8601 for all dates (YYYY-MM-DDTHH:MM:SSZ)
- String fields for currency/metrics should include units (e.g., "$45", "5% monthly")
- Confidence and assessment fields are constrained enums
- All recommendations must include priority and effort for prioritization
