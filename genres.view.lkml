view: genres {
  sql_table_name: mak_movies.genres ;;
  view_label: "Movies"

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

# VISIBLE

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [movies.title, genre]
  }

# INVISIBLE

  dimension: movieid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.movieid ;;
  }

}
