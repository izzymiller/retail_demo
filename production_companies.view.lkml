view: production_companies {
  sql_table_name: mak_movies.production_companies ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

# VISIBLE

  dimension: production_company {
    view_label: "Movies"
    type: string
    sql: ${TABLE}.production_company ;;
  }

# INVISBLE

  dimension: movieid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.movieid ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [movies.title, production_company]
  }

}
