# The name of this view in Looker is "Facilities Episodes Specialization Staff Ratio"
view: facilities_episodes_specialization_staff_ratio {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `pam-staffing-demo.facilities_staffing.facilities_episodes_specialization_staff_ratio`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Condition" in Explore.

  dimension: condition {
    type: string
    sql: ${TABLE}.condition ;;
  }

  dimension: episodes_count {
    type: number
    sql: ${TABLE}.episodes_count ;;
  }

  dimension: episodes_nurse_ratio {
    type: number
    sql: ${TABLE}.episodes_nurse_ratio ;;
    value_format: "#.00"
  }

  dimension: facility {
    type: string
    sql: ${TABLE}.facility ;;
  }

  dimension: specialization_count {
    type: number
    sql: ${TABLE}.specialization_count ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
