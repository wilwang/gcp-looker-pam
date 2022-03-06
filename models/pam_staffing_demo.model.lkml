include: "/views/**/*.view" # include all the views
#include: "/dashboards/*.dashboard.lookml" # include all the dashboards

# Define the database connection to be used for this model.
connection: "ww_pam_staffing"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: pam_staffing_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: pam_staffing_demo_default_datagroup

explore: facilities {
  label: "Facilites"
  join: facilities_forecast {
    type: inner
    relationship: one_to_one
    sql_on: ${facilities.facility} = ${facilities_forecast.facility} ;;
  }
  persist_with: pam_staffing_demo_default_datagroup
}

explore: facilities_forecast {
  label: "Facilities Forecast"
  persist_with: pam_staffing_demo_default_datagroup
}

explore: facilities_overview {
  label: "Facilities Overview"
  persist_with: pam_staffing_demo_default_datagroup
}

explore: episodes {
  label: "Episodes"
  persist_with: pam_staffing_demo_default_datagroup
}

explore: nurses {
  join: nurses__specialization {
    view_label: "Nurses: Specialization"
    sql: LEFT JOIN UNNEST(${nurses.specialization}) as nurses__specialization ;;
    relationship: one_to_many
  }

  join: nurses__certified_states {
    view_label: "Nurses: Certified States"
    sql: LEFT JOIN UNNEST(${nurses.certified_states}) as nurses__certified_states ;;
    relationship: one_to_many
  }
}

explore: facilities_episodes_specialization_staff_ratio {
  view_label: "Episode to Staff Specialization Ratio"
  persist_with: pam_staffing_demo_default_datagroup
}

explore: nurses_facilities_distance_matrix {
  join: nurses_facilities_distance_matrix__specialization {
    view_label: "Nurses Facilities Distance Matrix: Specialization"
    sql: LEFT JOIN UNNEST(${nurses_facilities_distance_matrix.specialization}) as nurses_facilities_distance_matrix__specialization ;;
    relationship: one_to_many
  }

  join: nurses_facilities_distance_matrix__certified_states {
    view_label: "Nurses Facilities Distance Matrix: Certified States"
    sql: LEFT JOIN UNNEST(${nurses_facilities_distance_matrix.certified_states}) as nurses_facilities_distance_matrix__certified_states ;;
    relationship: one_to_many
  }
}

explore: episodes_history {
  label: "Episodes History"
  persist_with: pam_staffing_demo_default_datagroup
}

explore: episodes_forecast {
  label: "Episodes Forecast"
  persist_with: pam_staffing_demo_default_datagroup
}
