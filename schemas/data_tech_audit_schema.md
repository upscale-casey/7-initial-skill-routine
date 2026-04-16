# Data & Technology Audit JSON Schema

## Shared Sub-Objects

### StrengthWeakness
```json
{
  "title": "string",
  "description": "string",
  "impact": "string"
}
```

### Recommendation
```json
{
  "action": "string",
  "rationale": "string",
  "effort": "high|medium|low",
  "impact": "string",
  "timeline": "string"
}
```

### TechTool
```json
{
  "name": "string",
  "category": "string",
  "vendor": "string",
  "purpose": "string",
  "utilization": "high|moderate|low|unused",
  "integration_quality": "excellent|good|poor|none",
  "annual_cost_estimate": "string",
  "decision": "keep|consolidate|replace|retire"
}
```

## Section: FirstPartyDataEstate

```json
{
  "summary": "string",
  "data_sources": [
    {
      "name": "string",
      "type": "crm|website|app|pos|iot|survey|social|other",
      "collection_method": "string",
      "volume_estimate": "string",
      "quality_score": "high|medium|low"
    }
  ],
  "data_quality_assessment": {
    "completeness": "high|medium|low",
    "accuracy": "high|medium|low",
    "timeliness": "high|medium|low",
    "consistency": "high|medium|low"
  },
  "data_governance": {
    "maturity": "advanced|competent|developing|basic|none",
    "named_owners": boolean,
    "data_dictionary": boolean,
    "lineage_tracking": boolean,
    "quality_monitoring": boolean
  },
  "data_architecture": {
    "unified_customer_view": boolean,
    "cdp_implemented": boolean,
    "data_warehouse": "string",
    "real_time_capability": boolean
  },
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "integer (1-10)"
}
```

## Section: MarTechStack

```json
{
  "summary": "string",
  "total_tools": "integer",
  "annual_spend_estimate": "string",
  "tools": [TechTool],
  "stack_completeness": {
    "categories_covered": ["string"],
    "categories_missing": ["string"]
  },
  "integration_health": "excellent|good|adequate|poor",
  "redundancy_assessment": {
    "redundant_tools": ["string"],
    "consolidation_savings_estimate": "string"
  },
  "utilization_rate": "high|moderate|low",
  "vendor_concentration_risk": "high|medium|low",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "integer (1-10)"
}
```

## Section: AnalyticsCapability

```json
{
  "summary": "string",
  "maturity_level": "descriptive|diagnostic|predictive|prescriptive",
  "maturity_details": {
    "descriptive": {
      "capability": "advanced|competent|developing|basic|none",
      "tools": ["string"]
    },
    "diagnostic": {
      "capability": "advanced|competent|developing|basic|none",
      "tools": ["string"]
    },
    "predictive": {
      "capability": "advanced|competent|developing|basic|none",
      "tools": ["string"]
    },
    "prescriptive": {
      "capability": "advanced|competent|developing|basic|none",
      "tools": ["string"]
    }
  },
  "team_capability": {
    "analysts_count": "integer",
    "skill_level": "advanced|competent|developing|basic",
    "key_gaps": ["string"]
  },
  "data_literacy_org": "high|moderate|low",
  "reporting_cadence": "real_time|daily|weekly|monthly|ad_hoc",
  "self_service_analytics": boolean,
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "integer (1-10)"
}
```

## Section: MeasurementAttribution

```json
{
  "summary": "string",
  "attribution_model": "first_touch|last_touch|linear|time_decay|position_based|algorithmic|none",
  "attribution_maturity": "advanced|competent|developing|basic|none",
  "identity_resolution": {
    "capability": "strong|moderate|weak|none",
    "method": "string"
  },
  "measurement_gaps": ["string"],
  "kpi_framework": {
    "defined": boolean,
    "cascaded": boolean,
    "reviewed_cadence": "string"
  },
  "experimentation_capability": {
    "ab_testing": boolean,
    "incrementality_testing": boolean,
    "mmm": boolean
  },
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "integer (1-10)"
}
```

## Section: PrivacyCompliance

```json
{
  "summary": "string",
  "regulatory_scope": ["GDPR|CCPA|LGPD|PIPEDA|PDPA|NZDPA|ePrivacy|COPPA|CASL|other"],
  "consent_management": {
    "cmp_implemented": boolean,
    "vendor": "string",
    "opt_in_rate": "string"
  },
  "data_subject_rights": {
    "automated": boolean,
    "response_time": "string"
  },
  "privacy_by_design": boolean,
  "data_retention_policy": "defined|partial|none",
  "vendor_dpa_coverage": "complete|partial|none",
  "audit_trail": boolean,
  "risk_assessment": {
    "overall_risk": "high|medium|low",
    "key_risks": ["string"]
  },
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "integer (1-10)"
}
```

## Section: TechnologyDebt

```json
{
  "summary": "string",
  "tech_debt_score": {
    "value": "integer (1-10)",
    "percentile": "string"
  },
  "legacy_systems": [
    {
      "system": "string",
      "age_years": "integer",
      "risk_level": "high|medium|low",
      "migration_plan": "planned|needed|none"
    }
  ],
  "maintenance_vs_innovation_ratio": {
    "maintenance_pct": "integer",
    "innovation_pct": "integer",
    "assessment": "healthy|warning|critical"
  },
  "code_quality_indicators": {
    "test_coverage": "string",
    "documentation": "good|adequate|poor",
    "technical_standards": boolean
  },
  "modernization_priorities": ["string"],
  "estimated_remediation_effort": "string",
  "strengths": [StrengthWeakness],
  "weaknesses": [StrengthWeakness],
  "recommendations": [Recommendation],
  "score": "integer (1-10)"
}
```

## Top-Level Schema

```json
{
  "company_name": "string",
  "industry": "string",
  "analysis_date": "YYYY-MM-DD",
  "data_sources": ["string"],
  "executive_summary": "string",
  "first_party_data": FirstPartyDataEstate,
  "martech_stack": MarTechStack,
  "analytics_capability": AnalyticsCapability,
  "measurement_attribution": MeasurementAttribution,
  "privacy_compliance": PrivacyCompliance,
  "technology_debt": TechnologyDebt,
  "overall_score": "integer (1-10)",
  "overall_assessment": "string",
  "digital_maturity": "leading|advanced|competent|developing|nascent",
  "top_priorities": [
    {
      "priority": "string",
      "rationale": "string",
      "estimated_impact": "string",
      "timeline": "string"
    }
  ],
  "cross_section_dynamics": [
    {
      "interaction": "string",
      "sections_involved": ["string"],
      "implication": "string"
    }
  ]
}
```

## Example Fragment

```json
{
  "company_name": "Acme Corp",
  "industry": "E-commerce",
  "analysis_date": "2026-04-09",
  "data_sources": ["web search", "company website", "industry research"],
  "executive_summary": "Acme Corp demonstrates competent data and technology maturity with well-established first-party data capture and a functional MarTech stack. Key gaps exist in analytics maturity (currently descriptive), attribution modeling, and technology debt management. Recommended priorities: upgrade analytics to diagnostic/predictive capability, implement multi-touch attribution, and modernize legacy payment processing.",
  "first_party_data": {
    "summary": "First-party data estate spans CRM, website analytics, and transactional databases with moderate quality oversight.",
    "data_sources": [
      {
        "name": "Salesforce CRM",
        "type": "crm",
        "collection_method": "Manual entry, web forms, integrations",
        "volume_estimate": "500K+ customer records",
        "quality_score": "medium"
      }
    ],
    "score": 6
  },
  "overall_score": 6,
  "digital_maturity": "competent"
}
```
