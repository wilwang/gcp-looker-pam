# The name of this view in Looker is "Nurses Facilities Distance Matrix"
view: nurses_facilities_distance_matrix {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `pam-staffing-demo.facilities_staffing.nurses_facilities_distance_matrix`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # This field is hidden, which means it will not show up in Explore.
  # If you want this field to be displayed, remove "hidden: yes".

  dimension: certified_states {
    hidden: yes
    sql: ${TABLE}.certified_states ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Distance" in Explore.

  dimension: distance {
    label: "Distance (km)"
    type: number
    sql: ${TABLE}.distance / 1000;;
    value_format: "#,###"
  }

  dimension: emp_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.emp_id ;;
  }

  dimension: facility {
    type: string
    sql: ${TABLE}.facility ;;
  }

  dimension: home_facility {
    type: string
    sql: ${TABLE}.home_facility ;;
  }

  dimension: home_geo {
    type: string
    sql: ${TABLE}.home_geo ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    action: {
      label: "Email {{value}}"
      url: "https://www.google.com"
      form_param: {
        name: "Message"
        type: textarea
        default: "Hi {{ value }},

We have a need for your expertise at {{ facility }}.
Please call your hospital administrator for details.

Thank you!"
      }
    }
  }

  dimension: specialization {
    hidden: yes
    sql: ${TABLE}.specialization ;;
  }

  dimension: targ_geo {
    type: string
    sql: ${TABLE}.targ_geo ;;
  }

  dimension: willing_to_travel {
    type: yesno
    sql: ${TABLE}.willing_to_travel ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}

# The name of this view in Looker is "Nurses Facilities Distance Matrix Specialization"
view: nurses_facilities_distance_matrix__specialization {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Nurses Facilities Distance Matrix Specialization" in Explore.

  dimension: nurses_facilities_distance_matrix__specialization {
    type: string
    full_suggestions: yes
    sql: nurses_facilities_distance_matrix__specialization ;;
  }
}

# The name of this view in Looker is "Nurses Facilities Distance Matrix Certified States"
view: nurses_facilities_distance_matrix__certified_states {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Nurses Facilities Distance Matrix Certified States" in Explore.

  dimension: nurses_facilities_distance_matrix__certified_states {
    type: string
    full_suggestions: yes
    sql: nurses_facilities_distance_matrix__certified_states ;;
  }
}
