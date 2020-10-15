view: collections {
  sql_table_name: mak_movies.collections ;;
  view_label: "Movies"

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

# VISIBLE

  dimension: collection {
    label: "Franchise"
    type: string
    sql: rtrim(${TABLE}.collection, "Collection") ;;
  }

# INVISIBLE

  dimension: movieid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.movieid ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [movies.title, collection]
  }

}
