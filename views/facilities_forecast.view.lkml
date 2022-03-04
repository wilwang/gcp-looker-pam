# The name of this view in Looker is "Facilities Forecast"
view: facilities_forecast {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `pam-staffing-demo.facilities_staffing.facilities_forecast`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Condition Current" in Explore.

  dimension: condition_current {
    type: string
    sql: ${TABLE}.condition_current ;;
  }

  dimension: condition_forecast {
    type: string
    sql: ${TABLE}.condition_forecast ;;
  }

  dimension: episodes_current {
    type: number
    sql: ${TABLE}.episodes_current ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_episodes_current {
    type: sum
    sql: ${episodes_current} ;;
  }

  measure: average_episodes_current {
    type: average
    sql: ${episodes_current} ;;
  }

  dimension: episodes_forecast {
    type: number
    sql: ${TABLE}.episodes_forecast ;;
  }

  dimension: facility {
    type: string
    sql: ${TABLE}.facility ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: nurses_current {
    type: number
    sql: ${TABLE}.nurses_current ;;
  }

  dimension: nurses_forecast {
    type: number
    sql: ${TABLE}.nurses_forecast ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
