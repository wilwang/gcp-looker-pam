# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
explore: nurses {
  hidden: yes

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

# The name of this view in Looker is "Nurses"
view: nurses {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `pam-staffing-demo.facilities_staffing.nurses`
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
  # This dimension will be called "Emp ID" in Explore.

  dimension: emp_id {
    type: number
    sql: ${TABLE}.emp_id ;;
  }

  dimension: home_facility {
    type: string
    sql: ${TABLE}.home_facility ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: specialization {
    hidden: yes
    sql: ${TABLE}.specialization ;;
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

# The name of this view in Looker is "Nurses Specialization"
view: nurses__specialization {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Nurses Specialization" in Explore.

  dimension: nurses__specialization {
    type: string
    sql: nurses__specialization ;;
  }
}

# The name of this view in Looker is "Nurses Certified States"
view: nurses__certified_states {
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Nurses Certified States" in Explore.

  dimension: nurses__certified_states {
    type: string
    sql: nurses__certified_states ;;
  }
}
