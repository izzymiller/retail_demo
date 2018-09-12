view: directors {
  derived_table: {
    sql:
    SELECT
      row_number() over (order by name) as id,
      director_id,
      names.name as name,
      case when birth_year like '%N' then null else birth_year end as birth_year,
      case when death_year like '%N' then null else death_year end as death_year,
      min(movies.release_date) as first_movie
      from `lookerdata.mak_movies.movies` as movies
      join `lookerdata.mak_movies.directors` as directors
      on directors.movie_id = movies.imdbid
      join `lookerdata.mak_movies.names` as names
      on directors.director_id = names.nconst
      group by 2,3,4,5
       ;;
      datagroup_trigger: mak_datagroup
  }

  dimension: prim_key {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

# VISIBLE

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "IMDb"
      url: "https://www.imdb.com/name/{{ ['director_id'] }}"
      icon_url: "https://imdb.com/favicon.ico"
    }
  }

  dimension_group: first_movie {
    type: time
    timeframes: [
      raw,
      date,
      year,
      month
    ]
    sql: cast(${TABLE}.first_movie as timestamp) ;;
  }

  dimension: is_first_movie {
    type: yesno
    sql: ${movies.release_year} = ${first_movie_year};;
  }

  dimension: years_active {
    type: number
    sql: case when
    ${death_year} is null then
    extract (year from current_date()) - extract(year from ${first_movie_date})
    else cast(${death_year} as int64) - ${first_movie_year} end;;
  }

  dimension: birth_year {
    type: number
    sql: ${TABLE}.birth_year;;
    }

  dimension: death_year {
    type: number
    sql: ${TABLE}.death_year;;
  }

  dimension: age {
    type: number
    sql: ${movies.release_year} - cast(${birth_year} as int64) ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [20,30,40,50,60,70,80,90,100]
    style: interval
    sql: ${age} ;;
  }


  measure: count {
    type: count
    drill_fields: [directors.name, movies.title]
  }

# INVISIBLE

  dimension: director_id {
    hidden: yes
    type: string
    sql: ${TABLE}.director_id ;;
  }

  dimension: movie_id {
    hidden: yes
    type: string
    sql: ${TABLE}.movie_id ;;
  }

}
