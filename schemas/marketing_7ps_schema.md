# Marketing Audit (7Ps) JSON Schema

## Shared Sub-Objects

### StrengthWeakness
```json
{
  "statement": "string",
  "section_impact": "number (1-10)",
  "evidence": "string (supporting fact/quote)"
}
```

### Recommendation
```json
{
  "action": "string (imperative verb + action)",
  "rationale": "string (why this matters)",
  "priority": "critical|high|medium|low",
  "estimated_impact": "number (1-10)",
  "timeline": "string (e.g., 'Q2 2026')"
}
```

### CompetitivePosition
```json
{
  "competitor": "string (company name)",
  "performance_vs_them": "better|equal|worse|unknown",
  "gap_size": "number (1-10, 10 = large gap)",
  "notes": "string"
}
```

---

## Section Schemas

### StrategicAssessment
```json
{
  "summary": "string (2-3 sentences)",
  "market_position": "leader|challenger|follower|nicher",
  "segmentation_effectiveness": "excellent|good|adequate|poor",
  "targeting_accuracy": "excellent|good|adequate|poor",
  "positioning_clarity": "excellent|good|adequate|poor",
  "strategic_alignment_with_business": "strong|adequate|weak",
  "competitive_advantages": [
    {
      "advantage": "string",
      "defensibility": "string (moat, patent, brand, scale, etc.)"
    }
  ],
  "market_share_trend": "growing|stable|declining",
  "target_market_description": "string",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

### Product (4Ps Pattern)
```json
{
  "summary": "string (2-3 sentences)",
  "product_portfolio": {
    "num_active_skus": "number",
    "key_products": ["string"],
    "lifecycle_stage": "growth|maturity|decline"
  },
  "differentiation": {
    "unique_value_proposition": "string",
    "vs_competition": "string"
  },
  "quality_assessment": "excellent|good|adequate|poor",
  "innovation_rate": "high|moderate|low|minimal",
  "product_market_fit": "strong|adequate|weak",
  "key_features": ["string"],
  "customer_perception": "string (2-3 sentences)",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

### Price (4Ps Pattern)
```json
{
  "summary": "string (2-3 sentences)",
  "pricing_strategy": "value_based|cost_plus|competitive|dynamic|premium|penetration",
  "price_positioning": {
    "positioning": "premium|mainstream|value|budget",
    "vs_competitors": "string"
  },
  "price_range": "string (e.g., '$99-$499')",
  "elasticity_assessment": "string (elastic|inelastic|unknown)",
  "customer_price_perception": "string (acceptable|high|low)",
  "discount_promotion_strategy": "string (frequency, depth)",
  "discount_dependency": "high|moderate|low|minimal",
  "margin_health": "strong|adequate|weak",
  "price_change_frequency": "frequent|occasional|stable",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

### Place (4Ps Pattern)
```json
{
  "summary": "string (2-3 sentences)",
  "distribution_strategy": "direct|indirect|hybrid|omnichannel",
  "primary_channels": ["string (e.g., 'ecommerce', 'retail', 'resellers')"],
  "channel_coverage": {
    "geographic_reach": "global|multi_region|regional|local",
    "coverage_assessment": "comprehensive|good|adequate|limited"
  },
  "retail_presence": {
    "num_locations": "number|null",
    "flagship_stores": "number|null",
    "online_presence": "strong|moderate|weak|none"
  },
  "supply_chain_efficiency": "excellent|good|adequate|poor",
  "partner_reseller_effectiveness": "strong|adequate|weak|na",
  "inventory_management": "optimized|adequate|challenged",
  "accessibility": "string (ease of purchase)",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

### Promotion (4Ps Pattern)
```json
{
  "summary": "string (2-3 sentences)",
  "promotional_mix": {
    "advertising": "string (channels, budget allocation)",
    "public_relations": "string (media relations, events)",
    "sales_promotion": "string (discounts, contests, loyalty)",
    "digital_marketing": "string (seo, ppc, social, email)"
  },
  "marketing_message": {
    "primary_message": "string",
    "message_clarity": "excellent|good|adequate|poor",
    "consistency": "excellent|good|adequate|poor"
  },
  "campaign_effectiveness": {
    "recent_major_campaign": "string (name/description)",
    "reach_and_frequency": "string",
    "engagement_rate": "high|moderate|low|unknown"
  },
  "content_strategy": "string (themes, formats, frequency)",
  "media_mix": {
    "paid_media_pct": "number (0-100)",
    "owned_media_pct": "number (0-100)",
    "earned_media_pct": "number (0-100)"
  },
  "brand_voice": "string (tone, personality)",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

### People (NEW for 7Ps)
```json
{
  "summary": "string (2-3 sentences)",
  "marketing_team_size": "number",
  "team_structure": "string (e.g., 'centralized', 'decentralized', 'hub-and-spoke')",
  "team_capability_assessment": "advanced|competent|developing|basic",
  "key_roles": ["string"],
  "key_skill_gaps": ["string"],
  "training_investment": "heavy|adequate|light|minimal",
  "employee_brand_advocacy": "strong|moderate|weak",
  "employee_nps": "number|null",
  "customer_service_quality": "excellent|good|adequate|poor",
  "sales_marketing_alignment": "strong|moderate|weak|siloed",
  "leadership_marketing_experience": "string",
  "turnover_rate": "low|moderate|high|unknown",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

### Process (NEW for 7Ps)
```json
{
  "summary": "string (2-3 sentences)",
  "customer_experience_efficiency": "excellent|good|adequate|poor",
  "lead_management_maturity": "advanced|competent|developing|basic",
  "lead_scoring": "implemented|partial|not_used",
  "campaign_execution_process": "excellent|good|adequate|poor",
  "planning_cycle": "string (e.g., 'quarterly', 'annual')",
  "response_times_assessment": "fast|adequate|slow",
  "approval_workflows": "streamlined|adequate|bottlenecked",
  "automation_level": "advanced|moderate|basic|manual",
  "tools_used": ["string (e.g., 'HubSpot', 'Salesforce', 'Marketo')"],
  "workflow_bottlenecks": ["string"],
  "data_integration": "excellent|good|adequate|poor",
  "process_documentation": "comprehensive|adequate|minimal|none",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

### PhysicalEvidence (NEW for 7Ps)
```json
{
  "summary": "string (2-3 sentences)",
  "brand_visual_consistency": "excellent|good|adequate|poor",
  "brand_visual_identity": {
    "primary_logo": "string (description)",
    "color_palette": "string",
    "typography": "string",
    "brand_guidelines_exists": "boolean"
  },
  "website_ux_quality": "excellent|good|adequate|poor",
  "website_mobile_responsive": "yes|no|partial",
  "website_load_speed": "fast|moderate|slow|unknown",
  "website_conversion_optimization": "advanced|adequate|basic|poor",
  "packaging_quality": "excellent|good|adequate|poor|na",
  "packaging_differentiation": "strong|adequate|weak|na",
  "retail_environment": "excellent|good|adequate|poor|na",
  "merchandising_effectiveness": "strong|adequate|weak|na",
  "marketing_materials_quality": "excellent|good|adequate|poor",
  "brand_consistency_across_touchpoints": "excellent|good|adequate|poor",
  "social_proof": {
    "review_score": "number (1-5)|null",
    "review_count": "number|null",
    "review_platforms": ["string"],
    "testimonials_quality": "excellent|good|adequate|poor|none"
  },
  "trust_indicators": [
    {
      "indicator": "string (e.g., 'SSL certificate', 'Money-back guarantee')",
      "presence": "yes|no"
    }
  ],
  "customer_testimonials": "number|null",
  "awards_certifications": ["string"],
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

### BrandHealth (NEW for 7Ps)
```json
{
  "summary": "string (2-3 sentences)",
  "aided_awareness": {
    "level": "high|moderate|low|unknown",
    "percentage": "number (0-100)|null",
    "benchmark": "string (category average)"
  },
  "unaided_awareness": {
    "level": "high|moderate|low|unknown",
    "percentage": "number (0-100)|null"
  },
  "nps": {
    "score": "number (0-100)|null",
    "benchmark": "string (industry average)",
    "trend": "improving|stable|declining|unknown"
  },
  "brand_equity_assessment": "strong|moderate|weak",
  "brand_sentiment": "very_positive|positive|neutral|negative|very_negative",
  "share_of_voice": {
    "level": "high|moderate|low|unknown",
    "percentage": "number (0-100)|null",
    "vs_top_competitors": [
      {
        "competitor": "string",
        "our_sov": "number",
        "their_sov": "number"
      }
    ]
  },
  "brand_perception": "string (key perceptions and attributes)",
  "brand_consistency": "excellent|good|adequate|poor",
  "brand_personality": "string (tone, values, archetype)",
  "repeat_purchase_rate": "high|moderate|low|unknown",
  "customer_loyalty": "strong|moderate|weak",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

### CustomerJourney (NEW for 7Ps)
```json
{
  "summary": "string (2-3 sentences)",
  "journey_stages": [
    {
      "stage": "awareness|consideration|purchase|retention|advocacy",
      "description": "string",
      "touchpoints": [
        {
          "touchpoint": "string (e.g., 'Google Search')",
          "channel": "string (paid|owned|earned)",
          "effectiveness": "excellent|good|adequate|poor|unknown"
        }
      ],
      "metrics": {
        "metric_name": "number",
        "baseline_benchmark": "string"
      },
      "pain_points": ["string"],
      "opportunities": ["string"]
    }
  ],
  "journey_mapping_maturity": "advanced|developing|basic|none",
  "omnichannel_integration": "excellent|good|adequate|poor",
  "customer_drop_off_analysis": "string (where are they leaving?)",
  "journey_optimization_priorities": ["string"],
  "personalization_level": "advanced|moderate|basic|none",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

### BudgetAnalysis (NEW for 7Ps)
```json
{
  "summary": "string (2-3 sentences)",
  "total_marketing_spend": "string (e.g., '$2.5M', 'estimated $1-2M')",
  "marketing_spend_as_pct_revenue": "number (e.g., 2.5)|null",
  "channel_allocation": [
    {
      "channel": "string (e.g., 'paid_search', 'social', 'email', 'content', 'events')",
      "pct_of_budget": "number (0-100)",
      "roi_assessment": "high|adequate|low|unknown",
      "trend": "increasing|stable|decreasing"
    }
  ],
  "fixed_vs_variable_ratio": "string (e.g., '40/60')",
  "budget_efficiency": "excellent|good|adequate|poor",
  "budget_process": "data_driven|strategic|reactive|ad_hoc",
  "underinvested_areas": [
    {
      "area": "string",
      "rationale": "string"
    }
  ],
  "overinvested_areas": [
    {
      "area": "string",
      "rationale": "string"
    }
  ],
  "benchmarks": {
    "industry_average_pct_revenue": "number|null",
    "top_performer_pct_revenue": "number|null"
  },
  "cost_per_acquisition": "string (e.g., '$150')|null",
  "customer_lifetime_value": "string (e.g., '$2000')|null",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

### PerformanceMetrics (NEW for 7Ps)
```json
{
  "summary": "string (2-3 sentences)",
  "funnel_metrics": {
    "top_of_funnel": {
      "metric": "string (e.g., 'unique_visitors')",
      "value": "number|string",
      "trend": "improving|stable|declining",
      "benchmark": "string"
    },
    "mid_funnel": {
      "metric": "string (e.g., 'lead_generation_rate')",
      "value": "number|string",
      "trend": "improving|stable|declining",
      "benchmark": "string"
    },
    "bottom_funnel": {
      "metric": "string (e.g., 'conversion_rate')",
      "value": "number|string",
      "trend": "improving|stable|declining",
      "benchmark": "string"
    }
  },
  "attribution_model": "first_touch|last_touch|multi_touch|algorithmic|none",
  "channel_roi": [
    {
      "channel": "string",
      "roi": "number (e.g., 3.5)|null",
      "trend": "improving|stable|declining|unknown"
    }
  ],
  "key_kpis": [
    {
      "metric": "string (e.g., 'CAC', 'LTV', 'engagement_rate')",
      "value": "number|string",
      "trend": "improving|stable|declining|unknown",
      "benchmark": "string"
    }
  ],
  "marketing_contribution_to_revenue_pct": "number|null",
  "measurement_maturity": "advanced|competent|developing|basic",
  "tools_used": ["string"],
  "data_quality": "excellent|good|adequate|poor",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "number (1-10)"
}
```

---

## Top-Level JSON Structure

```json
{
  "company_name": "string",
  "industry": "string",
  "analysis_date": "string (ISO 8601, e.g., '2026-04-09')",
  "analysis_method": "web_research|text_analysis|file_upload",
  "data_sources": ["string"],
  "executive_summary": "string (4-5 sentences, key findings)",
  
  "strategic_assessment": {StrategicAssessment},
  "product": {Product},
  "price": {Price},
  "place": {Place},
  "promotion": {Promotion},
  "people": {People},
  "process": {Process},
  "physical_evidence": {PhysicalEvidence},
  "brand_health": {BrandHealth},
  "customer_journey": {CustomerJourney},
  "budget_analysis": {BudgetAnalysis},
  "performance_metrics": {PerformanceMetrics},
  
  "overall_score": "number (1-10, average of all sections)",
  "overall_assessment": "world_class|advanced|competent|developing|basic",
  "marketing_maturity": "world_class|advanced|competent|developing|basic",
  
  "top_priorities": [
    {
      "priority": "number (1, 2, 3, ...)",
      "action": "string",
      "rationale": "string",
      "section": "string (which section this addresses)",
      "estimated_impact": "number (1-10)",
      "timeline": "string"
    }
  ],
  
  "cross_section_dynamics": [
    {
      "dynamic": "string (e.g., 'Price-Place Tradeoff')",
      "sections_involved": ["string"],
      "insight": "string (how sections interact or conflict)"
    }
  ]
}
```

---

## Notes

- All `score` fields are 1–10, with brief justification in the summary
- `null` values used when data unavailable; document in `summary` with "unknown" qualifier
- `trend` fields capture direction: improving, stable, declining, or unknown
- `benchmark` fields provide context (industry average, competitor, category norm)
- `strengths` and `weaknesses` arrays are required for each section; 2–5 items typical
- `recommendations` arrays prioritize by impact and timeline
- All string fields are concise, actionable, and evidence-backed
