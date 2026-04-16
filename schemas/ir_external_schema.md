# IR & External Relations Audit — Data Schema

## Shared Sub-Objects

### StrengthWeakness
```json
{
  "point": "string",
  "evidence": "string",
  "impact": "high|medium|low"
}
```

### Recommendation
```json
{
  "action": "string",
  "rationale": "string",
  "priority": "critical|high|medium|low",
  "effort": "high|medium|low",
  "timeframe": "string"
}
```

### ComparableMetric
```json
{
  "metric_name": "string",
  "company_value": "number",
  "peer_median": "number",
  "peer_range": "[low, high]",
  "percentile": "number (0-100)",
  "assessment": "premium|inline|discount"
}
```

## Section Schemas

### Governance

```json
{
  "summary": "string",
  "board_composition": {
    "total_members": "number",
    "independent_pct": "number (0-100)",
    "diversity_score": "string (0-100 scale)",
    "avg_tenure_years": "number",
    "committee_structure": [
      {
        "name": "string",
        "chair": "string",
        "members": "number",
        "focus": "string"
      }
    ]
  },
  "esg_disclosure": {
    "level": "leading|advanced|developing|basic|minimal",
    "frameworks_adopted": ["string"],
    "esg_ratings": [
      {
        "agency": "string",
        "rating": "string",
        "percentile": "number"
      }
    ]
  },
  "transparency_assessment": "excellent|good|adequate|poor",
  "regulatory_compliance": {
    "sox_compliant": "boolean",
    "governance_code_aligned": "boolean",
    "audit_findings": "string",
    "remediation_status": "string"
  },
  "ir_function": {
    "reports_to": "string",
    "team_size": "number",
    "maturity": "advanced|competent|developing|basic",
    "capability_areas": ["string"]
  },
  "strengths": ["StrengthWeakness"],
  "weaknesses": ["StrengthWeakness"],
  "recommendations": ["Recommendation"],
  "score": "number (1-10)"
}
```

### InvestorBase

```json
{
  "summary": "string",
  "ownership_structure": {
    "institutional_pct": "number (0-100)",
    "retail_pct": "number (0-100)",
    "insider_pct": "number (0-100)",
    "top_10_concentration_pct": "number (0-100)"
  },
  "investor_segments": [
    {
      "type": "string (e.g., 'Growth Fund', 'Value Fund', 'Activist', 'Index')",
      "pct": "number (0-100)",
      "sentiment": "positive|neutral|negative"
    }
  ],
  "activist_risk": "high|medium|low|none",
  "long_term_vs_short_term": {
    "long_term_pct": "number (0-100)",
    "short_term_pct": "number (0-100)"
  },
  "investor_sentiment": "very_positive|positive|neutral|negative|very_negative",
  "recent_changes": [
    {
      "date": "ISO 8601",
      "change": "string",
      "impact": "positive|neutral|negative"
    }
  ],
  "strengths": ["StrengthWeakness"],
  "weaknesses": ["StrengthWeakness"],
  "recommendations": ["Recommendation"],
  "score": "number (1-10)"
}
```

### ValuationComparables

```json
{
  "summary": "string",
  "current_valuation": {
    "market_cap": "number",
    "enterprise_value": "number",
    "share_price": "number",
    "shares_outstanding": "number",
    "valuation_date": "ISO 8601"
  },
  "key_multiples": ["ComparableMetric"],
  "peer_group": {
    "peers": ["string"],
    "selection_rationale": "string",
    "count": "number"
  },
  "historical_trading": {
    "52_week_high": "number",
    "52_week_low": "number",
    "current_vs_range": "string (e.g., 'near_high', 'mid_range', 'near_low')"
  },
  "premium_discount_analysis": "string",
  "target_price_consensus": {
    "mean": "number",
    "median": "number",
    "high": "number",
    "low": "number",
    "sample_size": "number"
  },
  "strengths": ["StrengthWeakness"],
  "weaknesses": ["StrengthWeakness"],
  "recommendations": ["Recommendation"],
  "score": "number (1-10)"
}
```

### CommitmentsPerformance

```json
{
  "summary": "string",
  "guidance_history": [
    {
      "period": "string (e.g., 'Q1 2024', 'FY 2024')",
      "metric": "string (e.g., 'Revenue Growth', 'EPS', 'EBITDA Margin')",
      "guidance": "string or number",
      "actual": "string or number",
      "variance_pct": "number",
      "assessment": "beat|met|missed"
    }
  ],
  "guidance_accuracy_pct": "number (0-100)",
  "strategic_promises": [
    {
      "promise": "string",
      "date": "ISO 8601",
      "status": "delivered|on_track|delayed|abandoned",
      "evidence": "string"
    }
  ],
  "credibility_assessment": "excellent|good|adequate|poor|critical",
  "forward_commitments": [
    {
      "commitment": "string",
      "target_date": "ISO 8601",
      "current_status": "string"
    }
  ],
  "strengths": ["StrengthWeakness"],
  "weaknesses": ["StrengthWeakness"],
  "recommendations": ["Recommendation"],
  "score": "number (1-10)"
}
```

### ExternalReputation

```json
{
  "summary": "string",
  "media_sentiment": {
    "overall": "positive|neutral|negative",
    "volume_trend": "increasing|stable|decreasing",
    "key_themes": ["string"],
    "sentiment_data": {
      "positive_pct": "number (0-100)",
      "neutral_pct": "number (0-100)",
      "negative_pct": "number (0-100)"
    }
  },
  "analyst_coverage": {
    "total_analysts": "number",
    "buy_pct": "number (0-100)",
    "hold_pct": "number (0-100)",
    "sell_pct": "number (0-100)",
    "consensus": "strong_buy|buy|hold|sell|strong_sell"
  },
  "stakeholder_trust_assessment": "very_high|high|moderate|low|very_low",
  "awards_recognition": [
    {
      "award": "string",
      "issuer": "string",
      "year": "number"
    }
  ],
  "controversies_risks": [
    {
      "issue": "string",
      "date": "ISO 8601",
      "severity": "high|medium|low",
      "resolution": "string or null"
    }
  ],
  "social_media_presence": {
    "sentiment": "positive|neutral|negative",
    "engagement_level": "high|medium|low",
    "key_platforms": ["string"]
  },
  "strengths": ["StrengthWeakness"],
  "weaknesses": ["StrengthWeakness"],
  "recommendations": ["Recommendation"],
  "score": "number (1-10)"
}
```

## Top-Level Schema

```json
{
  "company_name": "string",
  "industry": "string",
  "analysis_date": "ISO 8601",
  "data_sources": ["string"],
  "executive_summary": "string",
  "governance": {},
  "investor_base": {},
  "valuation_comparables": {},
  "commitments_performance": {},
  "external_reputation": {},
  "overall_score": "number (1-10)",
  "overall_assessment": "world_class|advanced|competent|developing|basic",
  "ir_maturity": "world_class|advanced|competent|developing|basic",
  "top_priorities": [
    {
      "priority": "number",
      "section": "string",
      "action": "string",
      "expected_impact": "string"
    }
  ],
  "cross_section_dynamics": [
    "string"
  ]
}
```

## Assessment Levels & Scoring

### Overall Assessment Scale
- **world_class** (9-10) — Exceptional IR & external relations posture; best-in-class governance, investor confidence, reputation
- **advanced** (7-8) — Strong execution; mature IR function; well-regarded by investors and stakeholders
- **competent** (5-6) — Solid fundamentals; adequate governance and investor relations; room for improvement
- **developing** (3-4) — Basic IR function; governance gaps; investor/stakeholder concerns
- **basic** (1-2) — Minimal IR infrastructure; significant governance issues; low investor/stakeholder confidence

### ESG Disclosure Levels
- **leading** — Comprehensive disclosure aligned with ISSB, TCFD, SASB; third-party assurance
- **advanced** — Detailed disclosure across E, S, G with clear metrics and targets
- **developing** — Growing disclosure practice; some gaps in metrics/targets
- **basic** — Limited ESG disclosure; ad-hoc approach
- **minimal** — Little to no structured ESG reporting

### Transparency Assessment
- **excellent** — Proactive disclosure; clear communication; timely updates; accessible governance information
- **good** — Regular disclosure; mostly clear communication; some gaps
- **adequate** — Required disclosures made; communication could be clearer
- **poor** — Minimal disclosure; opaque communication; governance information difficult to access

### Credibility Assessment (Commitments)
- **excellent** — Consistent guidance beats; delivers on strategic promises; high investor confidence
- **good** — Generally accurate guidance; most promises delivered
- **adequate** — Mixed guidance accuracy; some promises achieved
- **poor** — Frequent guidance misses; delayed/abandoned promises
- **critical** — Persistent credibility issues; investor skepticism

