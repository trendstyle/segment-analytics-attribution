connection: "contactually_data_warehouse"
week_start_day: sunday

label: "Segment Ads"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

## Google Adwords ##
explore: ad_performance_reports {
  label: "Google Adwords Ad Performance Reports"
  join: ads {
    relationship: many_to_one
    sql_on: ${ad_performance_reports.ad_id} = ${ads.id} ;;
  }
  join: ad_groups {
    relationship: many_to_one
    sql_on: ${ads.ad_group_id} = ${ad_groups.id} ;;
  }
  join: campaigns {
    relationship: many_to_one
    sql_on: ${ad_groups.campaign_id} = ${campaigns.id} ;;
  }
}

explore: campaign_performance_reports {
  label: "Google Adwords Campaign Performance Reports"
  join: campaigns {
    relationship: many_to_one
    sql_on: ${campaign_performance_reports.campaign_id} = ${campaigns.id} ;;
  }
  join: ad_groups {
    relationship: one_to_many
    sql_on: ${ad_groups.campaign_id} = ${campaigns.id} ;;
  }

}

## Facebook Ads ##
explore: facebook_ads {
  label: "Facebook Ads"
  join: facebook_campaigns {
    type: left_outer
    sql_on: ${facebook_ads.campaign_id} = ${facebook_campaigns.id} ;;
    relationship: many_to_one
  }

  join: facebook_ad_sets {
    type: left_outer
    sql_on: ${facebook_ads.adset_id} = ${facebook_ad_sets.id} ;;
    relationship: many_to_one
  }

  join: facebook_insights {
    type: left_outer
    sql_on: ${facebook_ads.id} = ${facebook_insights.ad_id} ;;
    relationship: many_to_one
  }
}

explore: facebook_insights {
  label: "Facebook Insights"
  join: facebook_ads {
    type: left_outer
    sql_on: ${facebook_insights.ad_id} = ${facebook_ads.id} ;;
    relationship: many_to_one
  }

  join: facebook_ad_sets {
    type: left_outer
    sql_on: ${facebook_ads.adset_id} = ${facebook_ad_sets.id} ;;
    relationship: many_to_one
  }

  join: facebook_campaigns {
    type: left_outer
    sql_on: ${facebook_ads.campaign_id} = ${facebook_campaigns.id} ;;
    relationship: many_to_one
  }
}

## Facebook Ads and Google Adwords Comparison ##
explore: ads_compare {}
