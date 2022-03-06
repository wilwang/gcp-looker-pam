# The name of this view in Looker is "Facilities Overview"
view: facilities_overview {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `pam-staffing-demo.facilities_staffing.facilities_overview`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Address" in Explore.

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: facility {
    primary_key: yes
    type: string
    sql: ${TABLE}.facility ;;
    link: {
      label: "Facilities Overview"
      url: "https://googlecloud.looker.com/dashboards/1279?Facility={{value}}&Specialization={{prevalent_condition}}&Certified+States={{state}}"
    }
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: num_episodes {
    label: "Episodes (#)"
    type: number
    sql: ${TABLE}.num_episodes ;;
  }

  dimension: num_nurses {
    label: "Nurses (#)"
    type: number
    sql: ${TABLE}.num_nurses ;;
  }

  dimension: patient_nurse_ratio {
    label: "Patient:Nurse Ratio"
    type: number
    sql: ${TABLE}.patient_nurse_ratio ;;
    value_format: "#.00"
  }

  dimension: prevalent_condition {
    label: "Prevalent Condition"
    type: string
    sql: ${TABLE}.prevalent_condition ;;
  }

  # NOTE: can probably be a facility level business rules rather than an overall business rule
  dimension: alert_level {
    label: "Alert Level"
    type: number
    sql: CASE WHEN ${TABLE}.patient_nurse_ratio > 3 THEN 1
    WHEN ${TABLE}.patient_nurse_ratio BETWEEN 2.5 AND 3 THEN 2
    ELSE 3 END;;
  }

  dimension: state {
    label: "State"
    type: string
    sql: RIGHT(${TABLE}.facility, 2);;
  }

  measure: count {
    type: count
    drill_fields: [name, patient_nurse_ratio, prevalent_condition]
  }
}
