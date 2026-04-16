# SWOT Analysis JSON Schema

This document defines the complete JSON schema for SWOT analysis output, including all objects, properties, and constraints.

## Shared Sub-Objects

### SWOTItem

A single factor in the SWOT analysis (Strength, Weakness, Opportunity, or Threat).

```json
{
  "statement": "string (20-50 words describing the factor)",
  "quadrant": "enum: strength | weakness | opportunity | threat",
  "evidence": {
    "source_analysis": "enum: pestle | 9cs | primary_research | financial_data | market_data | other",
    "source_element": "string (reference to source, e.g., 'Economic_PESTLE', 'Competitors_9Cs', 'CEO Interview')",
    "detail": "string (supporting evidence, specific data, or observation)",
    "confidence": "enum: high | medium | low"
  },
  "impact_score": "number (1-10, where 1=minor, 10=critical)",
  "likelihood_score": "number (1-10, where 1=unlikely, 10=certain/current)",
  "priority_score": "number (calculated as (impact_score * likelihood_score) / 10, range 1-10)",
  "strategic_implication": "string (brief description of how this factor affects strategy)"
}
```

**Constraints:**
- Statement: 20-50 words
- impact_score: integer 1-10
- likelihood_score: integer 1-10
- priority_score: calculated; must equal (impact_score × likelihood_score) / 10
- All fields required
- Quadrant must match parent array (strengths array → quadrant must be "strength", etc.)

**Examples:**

*Strength example:*
```json
{
  "statement": "Established brand recognition and market leadership in premium automotive segment with 1.2M vehicles sold globally in 2024, strong customer loyalty, and 95% brand awareness among target demographic.",
  "quadrant": "strength",
  "evidence": {
    "source_analysis": "financial_data",
    "source_element": "Q4_2024_Annual_Report",
    "detail": "Annual report cites 1.2M global vehicle sales, 38% YoY growth, premium segment leadership; third-party brand study shows 95% awareness among age 25-55 demographic.",
    "confidence": "high"
  },
  "impact_score": 9,
  "likelihood_score": 10,
  "priority_score": 9.0,
  "strategic_implication": "Provides foundation for premium pricing strategy, attracts top talent, enables rapid go-to-market for new product lines."
}
```

*Opportunity example:*
```json
{
  "statement": "Global EV market projected to reach 50% of new car sales by 2030 (currently 20%), driven by government incentives, consumer demand shift, and regulatory phase-outs of ICE vehicles in major markets.",
  "quadrant": "opportunity",
  "evidence": {
    "source_analysis": "market_data",
    "source_element": "IEA_Global_EV_Outlook_2024",
    "detail": "IEA Global EV Outlook projects 50% EV market share by 2030. EU bans ICE sales 2035; China leads with 60% EV sales target; US incentives $7.5B/year through 2030.",
    "confidence": "high"
  },
  "impact_score": 10,
  "likelihood_score": 9,
  "priority_score": 9.0,
  "strategic_implication": "Enables rapid scaling of EV production, justifies R&D investment in battery and autonomous tech, opens new market segments (mass market vs. premium)."
}
```

---

### TOWSStrategy

A strategic direction derived from combining two SWOT quadrants.

```json
{
  "type": "enum: SO | WO | ST | WT",
  "strategy_name": "string (concise name for the strategy)",
  "description": "string (2-4 sentences describing the strategic approach)",
  "leveraged_items": [
    {
      "quadrant": "enum: strength | weakness | opportunity | threat",
      "statement_ref": "string (statement or identifier of the SWOT item being leveraged)"
    }
  ],
  "priority": "enum: critical | high | medium | low",
  "effort": "enum: high | medium | low",
  "timeframe": "enum: immediate | short_term | medium_term | long_term",
  "expected_impact": "enum: transformative | high | moderate | low"
}
```

**Constraints:**
- strategy_name: 3-8 words
- description: 2-4 sentences
- leveraged_items: array with 1-4 items
- Each leveraged item must reference an actual SWOT item in the analysis
- Type determines which quadrants are referenced:
  - SO: one or more Strength + one or more Opportunity
  - WO: one or more Weakness + one or more Opportunity
  - ST: one or more Strength + one or more Threat
  - WT: one or more Weakness + one or more Threat
- At least one strategy per TOWS quadrant (SO, WO, ST, WT) is recommended

**Examples:**

*SO Strategy (Strengths + Opportunities):*
```json
{
  "type": "SO",
  "strategy_name": "Scale EV Market Leadership",
  "description": "Leverage premium brand reputation and established manufacturing footprint to capture mass-market EV segment (currently underpenetrated by premium players). Invest in mid-tier EV platform, expand distribution in Asia and Europe, and partner with governments on incentive programs.",
  "leveraged_items": [
    {
      "quadrant": "strength",
      "statement_ref": "Established brand recognition and market leadership"
    },
    {
      "quadrant": "strength",
      "statement_ref": "Global manufacturing and supply chain infrastructure"
    },
    {
      "quadrant": "opportunity",
      "statement_ref": "Global EV market projected to reach 50% by 2030"
    },
    {
      "quadrant": "opportunity",
      "statement_ref": "Government EV incentives and regulatory support"
    }
  ],
  "priority": "critical",
  "effort": "high",
  "timeframe": "medium_term",
  "expected_impact": "transformative"
}
```

*WO Strategy (Weaknesses + Opportunities):*
```json
{
  "type": "WO",
  "strategy_name": "Build In-House Battery Capability",
  "description": "Address battery supply chain vulnerability and high EV production costs by partnering or acquiring battery technology expertise. Secure lithium and cobalt supply contracts early. Use government R&D incentives to fund internal battery lab.",
  "leveraged_items": [
    {
      "quadrant": "weakness",
      "statement_ref": "Dependence on third-party battery suppliers"
    },
    {
      "quadrant": "weakness",
      "statement_ref": "Higher EV production costs vs. market competitors"
    },
    {
      "quadrant": "opportunity",
      "statement_ref": "Government R&D funding for battery technology"
    }
  ],
  "priority": "high",
  "effort": "high",
  "timeframe": "medium_term",
  "expected_impact": "high"
}
```

---

## Top-Level SWOT Analysis Object

Complete SWOT analysis with all components.

```json
{
  "company_name": "string (e.g., 'Tesla Inc.')",
  "industry": "string (e.g., 'Automotive / Electric Vehicles')",
  "analysis_date": "string (ISO 8601 format, e.g., '2024-04-09T15:30:00Z')",
  "data_sources": [
    "string (e.g., 'Annual Report 2024', 'IEA Global EV Outlook', 'Competitor Press Release')"
  ],
  "executive_summary": "string (3-5 sentences summarizing key findings and strategic position)",
  
  "strengths": [SWOTItem],
  "weaknesses": [SWOTItem],
  "opportunities": [SWOTItem],
  "threats": [SWOTItem],
  
  "tows_matrix": {
    "so_strategies": [TOWSStrategy],
    "wo_strategies": [TOWSStrategy],
    "st_strategies": [TOWSStrategy],
    "wt_strategies": [TOWSStrategy]
  },
  
  "overall_strategic_position": "enum: dominant | strong | favorable | tenable | weak | nonviable",
  "internal_score": "number (1-10, weighted average of strengths vs. weaknesses)",
  "external_score": "number (1-10, weighted average of opportunities vs. threats)",
  "overall_score": "number (1-10, composite of internal and external scores)",
  
  "top_priorities": [
    {
      "priority": "number (1-10)",
      "quadrant_source": "enum: strength | weakness | opportunity | threat",
      "statement": "string (SWOT item statement)",
      "expected_impact": "enum: transformative | high | moderate | low"
    }
  ],
  
  "evidence_coverage": {
    "total_items": "number (count of all SWOT items)",
    "with_evidence": "number (count of items with source_analysis specified)",
    "coverage_pct": "number (percentage, 0-100)"
  }
}
```

**Constraints & Calculations:**

- **analysis_date**: Must be ISO 8601 timestamp
- **company_name** & **industry**: Required
- **data_sources**: Array of strings, recommended minimum 3-5 sources
- **executive_summary**: 3-5 sentences; should mention strategic position and key drivers
- **Strengths, Weaknesses, Opportunities, Threats**: Arrays of SWOTItem objects
  - Recommended: 4-8 items per quadrant
  - Minimum: At least 1 item per quadrant
  - Each item's quadrant field must match parent array type
- **internal_score**: Calculated as weighted average of (strengths) vs. (weaknesses)
  - Formula: (avg_S_priority − avg_W_priority) / 10 + 5 (normalized to 1-10)
  - If more high-priority strengths than weaknesses → score > 5
  - If more high-priority weaknesses than strengths → score < 5
- **external_score**: Calculated as weighted average of (opportunities) vs. (threats)
  - Formula: (avg_O_priority − avg_T_priority) / 10 + 5 (normalized to 1-10)
  - If more high-priority opportunities than threats → score > 5
  - If more high-priority threats than opportunities → score < 5
- **overall_score**: Average of internal_score and external_score (1-10)
- **overall_strategic_position**: Derived from overall_score
  - 9.0-10.0: dominant
  - 7.5-8.9: strong
  - 6.0-7.4: favorable
  - 4.0-5.9: tenable
  - 2.0-3.9: weak
  - 0.0-1.9: nonviable
- **top_priorities**: Array of 3-5 items with highest priority_score across all quadrants
- **evidence_coverage**: Tracking completeness
  - total_items: Count all SWOT items
  - with_evidence: Count items where evidence.source_analysis is specified
  - coverage_pct: (with_evidence / total_items) × 100

**TOWS Matrix Rules:**
- At least one strategy per TOWS quadrant (SO, WO, ST, WT)
- Each strategy must reference actual SWOT items
- Strategies are ranked by priority (critical > high > medium > low)

---

## Complete Example

```json
{
  "company_name": "Tesla Inc.",
  "industry": "Automotive / Electric Vehicles",
  "analysis_date": "2024-04-09T15:30:00Z",
  "data_sources": [
    "Tesla Annual Report (10-K) 2024",
    "IEA Global EV Outlook 2024",
    "Bloomberg Industries Report - EV Market",
    "CEO Earnings Call Q1 2024",
    "Competitor Analysis: BMW, Ford, VW"
  ],
  "executive_summary": "Tesla maintains a dominant market position in premium EVs with exceptional profitability, global brand strength, and technological leadership in battery and autonomous systems. However, accelerating competition from legacy automakers and Chinese EV manufacturers, combined with battery supply constraints and geopolitical risks, require aggressive scaling of production and cost reduction. Key opportunities lie in mass-market EV expansion, government incentives, and emerging autonomous capabilities. Strategic priorities include scaling manufacturing, securing battery supply, defending market share against competitors, and investing in autonomous technology.",
  
  "strengths": [
    {
      "statement": "Established brand recognition and market leadership in premium automotive segment with 1.2M vehicles sold globally in 2024, strong customer loyalty, and 95% brand awareness among target demographic.",
      "quadrant": "strength",
      "evidence": {
        "source_analysis": "financial_data",
        "source_element": "Tesla_10K_2024",
        "detail": "2024 annual report: 1.2M vehicles sold (38% YoY growth), premium segment leadership. Third-party brand study shows 95% awareness among age 25-55 demographic.",
        "confidence": "high"
      },
      "impact_score": 9,
      "likelihood_score": 10,
      "priority_score": 9.0,
      "strategic_implication": "Foundation for premium pricing, attracts talent, enables rapid go-to-market for new products."
    },
    {
      "statement": "Proprietary battery technology and vertical integration from cell manufacturing to vehicle assembly, resulting in 15-20% cost advantage over competitors on battery production.",
      "quadrant": "strength",
      "evidence": {
        "source_analysis": "financial_data",
        "source_element": "CEO_Earnings_Call_Q1_2024",
        "detail": "CEO stated Tesla's in-house battery manufacturing delivers 15-20% cost savings. Vertical integration from raw material (lithium, cobalt) through cell production unique among volume EV makers.",
        "confidence": "high"
      },
      "impact_score": 9,
      "likelihood_score": 10,
      "priority_score": 9.0,
      "strategic_implication": "Enables aggressive price competition, improves margins, reduces supply chain risk."
    }
  ],
  
  "weaknesses": [
    {
      "statement": "Limited mid-range and mass-market EV portfolio; 85% of sales in premium segment ($50K+), creating vulnerability to market saturation and mass-market entrants.",
      "quadrant": "weakness",
      "evidence": {
        "source_analysis": "financial_data",
        "source_element": "Tesla_10K_2024",
        "detail": "2024 sales breakdown: ~85% Model 3/Y (premium tier $45K+), limited sub-$35K options. Competitors (BYD, VW, Ford) launching aggressive mass-market EV lineups.",
        "confidence": "high"
      },
      "impact_score": 8,
      "likelihood_score": 9,
      "priority_score": 7.2,
      "strategic_implication": "Limits TAM growth, risks market share loss to mass-market competitors, constrains revenue diversification."
    }
  ],
  
  "opportunities": [
    {
      "statement": "Global EV market projected to reach 50% of new car sales by 2030 (currently 20%), driven by government incentives, consumer demand shift, and regulatory phase-outs of ICE vehicles in major markets.",
      "quadrant": "opportunity",
      "evidence": {
        "source_analysis": "market_data",
        "source_element": "IEA_Global_EV_Outlook_2024",
        "detail": "IEA projects 50% EV market share by 2030. EU bans ICE 2035; China targets 60% EV sales; US provides $7.5B annual incentives through 2030.",
        "confidence": "high"
      },
      "impact_score": 10,
      "likelihood_score": 9,
      "priority_score": 9.0,
      "strategic_implication": "Massive TAM expansion, justifies aggressive capital investment, enables sustained revenue growth."
    }
  ],
  
  "threats": [
    {
      "statement": "Intensifying competition from legacy automakers (BMW, Audi, Mercedes) and Chinese manufacturers (BYD, NIO, XPeng) launching premium and mass-market EVs with comparable or superior features at lower prices.",
      "quadrant": "threat",
      "evidence": {
        "source_analysis": "market_data",
        "source_element": "Bloomberg_EV_Competition_Report_2024",
        "detail": "BYD shipped 1.8M EVs in 2023 (60% market share globally). BMW and Audi each launched 5+ premium EV models in 2023-2024. VW targets 50% EV sales by 2030 across group.",
        "confidence": "high"
      },
      "impact_score": 9,
      "likelihood_score": 10,
      "priority_score": 9.0,
      "strategic_implication": "Market share compression, margin pressure, potential loss of premium segment dominance, capital intensity of R&D race."
    }
  ],
  
  "tows_matrix": {
    "so_strategies": [
      {
        "type": "SO",
        "strategy_name": "Scale EV Market Leadership",
        "description": "Leverage premium brand and manufacturing footprint to capture mass-market EV segment. Launch affordable mid-tier EV platform ($25-35K), expand in Asia and Europe, and partner with governments on incentive programs to drive adoption.",
        "leveraged_items": [
          {"quadrant": "strength", "statement_ref": "Established brand recognition and market leadership"},
          {"quadrant": "opportunity", "statement_ref": "Global EV market projected to reach 50% by 2030"}
        ],
        "priority": "critical",
        "effort": "high",
        "timeframe": "medium_term",
        "expected_impact": "transformative"
      }
    ],
    "wo_strategies": [],
    "st_strategies": [
      {
        "type": "ST",
        "strategy_name": "Defend Market Share via Cost Leadership",
        "description": "Accelerate cost reduction on existing premium platforms (Model 3, Y) to compete with legacy automaker pricing. Use vertical integration and battery cost advantage to undercut competitors while maintaining premium positioning and margins.",
        "leveraged_items": [
          {"quadrant": "strength", "statement_ref": "Proprietary battery technology and vertical integration"},
          {"quadrant": "threat", "statement_ref": "Intensifying competition from legacy automakers and Chinese EV makers"}
        ],
        "priority": "critical",
        "effort": "medium",
        "timeframe": "short_term",
        "expected_impact": "high"
      }
    ],
    "wt_strategies": []
  },
  
  "overall_strategic_position": "strong",
  "internal_score": 8.5,
  "external_score": 7.0,
  "overall_score": 7.75,
  
  "top_priorities": [
    {
      "priority": 9.0,
      "quadrant_source": "strength",
      "statement": "Established brand recognition and market leadership in premium automotive segment",
      "expected_impact": "high"
    },
    {
      "priority": 9.0,
      "quadrant_source": "opportunity",
      "statement": "Global EV market projected to reach 50% of new car sales by 2030",
      "expected_impact": "transformative"
    },
    {
      "priority": 9.0,
      "quadrant_source": "threat",
      "statement": "Intensifying competition from legacy automakers and Chinese manufacturers",
      "expected_impact": "high"
    }
  ],
  
  "evidence_coverage": {
    "total_items": 5,
    "with_evidence": 5,
    "coverage_pct": 100.0
  }
}
```

---

## Notes

- All date fields use ISO 8601 format (e.g., `2024-04-09T15:30:00Z`)
- Priority scores are always calculated as (impact × likelihood) / 10; keep decimal precision to one place
- Strategic position categories are mutually exclusive; choose the single best fit
- Evidence confidence is subjective but should reflect data quality and source reliability (high = peer-reviewed or authoritative, medium = credible secondary source, low = anecdotal or unverified)
- All arrays maintain order (first item is highest priority for SWOT items and strategies)
