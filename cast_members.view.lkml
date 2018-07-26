view: cast_members {
  sql_table_name: mak_movies.cast_members ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: characters {
    type: string
    sql: ${TABLE}.characters ;;
  }

  dimension: job {
    type: string
    sql: ${TABLE}.job ;;
  }

  dimension: nconst {
    type: string
    sql: ${TABLE}.nconst ;;
  }

  dimension: ordering {
    type: number
    sql: ${TABLE}.ordering ;;
  }

  dimension: tconst {
    type: string
    sql: ${TABLE}.tconst ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
