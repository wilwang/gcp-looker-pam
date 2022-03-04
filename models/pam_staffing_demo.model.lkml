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
  label: "pam_staffing_demo_facilites"
  persist_with: pam_staffing_demo_default_datagroup
}
