# The name of this view in Looker is "Episodes Forecast"
view: episodes_forecast {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  # sql_table_name: `pam-staffing-demo.facilities_staffing.episodes_forecast`
  #  ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  derived_table:  {
    sql:
      SELECT date, facility, num_episodes, num_nurses, 0 as type
      FROM `pam-staffing-demo.facilities_staffing.episodes_history`
      UNION ALL
      SELECT date, facility, num_episodes, num_nurses, 1 as type
      FROM `pam-staffing-demo.facilities_staffing.episodes_forecast`;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Facility" in Explore.

  dimension: facility {
    primary_key: yes
    type: string
    sql: ${TABLE}.facility ;;
  }

  dimension: num_episodes {
    type: number
    sql: ${TABLE}.num_episodes ;;
  }

  dimension: num_nurses {
    type: number
    sql: ${TABLE}.num_nurses ;;
  }

  dimension: type {
    type: number
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
