view: directors {
  derived_table: {
    sql:
    SELECT
      row_number() over (order by names.name) as id,
      director_id,
      names.name as director,
      case when names.birth_year like '%N' then null else names.birth_year end as birth_year,
      case when names.death_year like '%N' then null else names.death_year end as death_year,
      min(movies.release_date) as first_movie
      from `lookerdata.mak_movies.movies` as movies
      join `lookerdata.mak_movies.directors` as directors
      on directors.movie_id = movies.imdbid
      join `lookerdata.mak_movies.names` as names
      on directors.director_id = names.nconst
      group by 2,3,4,5
       ;;
      datagroup_trigger: movies_datagroup
  }

  dimension: prim_key {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

# VISIBLE

  dimension: name {
    label: "Director Name"
    type: string
    sql: ${TABLE}.director ;;
    link: {
      label: "IMDb"
      url: "https://www.imdb.com/name/{{ ['director_id'] }}"
      icon_url: "https://imdb.com/favicon.ico"
    }
    drill_fields: [movies.title, movies.release_year]
  }

  dimension_group: first_movie {
    hidden: yes
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
    description: "Is the director's first movie released"
    type: yesno
    sql: ${movies.release_year} = ${first_movie_year};;
  }

  dimension: current_years_active {
    label: "Years Active"
    description: "Number of years that a director has been active"
    type: number
    sql: case when
    ${death_year} is null then
    extract (year from current_date()) - extract(year from ${first_movie_date})
    else cast(${death_year} as int64) - ${first_movie_year} end;;
  }

  measure: count {
    label: "Number of Directors"
    type: count
    drill_fields: [directors.name, movies.title]
  }

# INVISIBLE

  dimension: years_active {
    hidden: yes
    type: number
    sql: ${movies.release_year} - extract(year from ${first_movie_date});;
  }

  dimension: current_years_active_tier {
    hidden: yes
    type: tier
    tiers: [10,20,30,40,50,60,70,80]
    style: integer
    sql: case when
    ${death_year} is null then
    ${current_years_active}
    else null end;;
  }

  dimension: years_active_tier {
    hidden: yes
    type: tier
    tiers: [5,10,15,20,25,30,35,40,45]
    style: integer
    sql: ${years_active} ;;
  }

  dimension: birth_year {
    hidden: yes
    type: number
    sql: ${TABLE}.birth_year;;
    }

  dimension: death_year {
    hidden: yes
    type: number
    sql: ${TABLE}.death_year;;
  }

  dimension: age {
    hidden: yes
    type: number
    sql: ${movies.release_year} - cast(${birth_year} as int64) ;;
  }

  dimension: current_age {
    hidden: yes
    type: number
    sql: case when
    ${death_year} is null then
    extract (year from current_date()) - cast(${birth_year} as int64)
    else null end;;
  }

  dimension: current_age_tier {
    hidden: yes
    type: tier
    tiers: [20,30,40,50,60,70,80,90,100]
    style: integer
    sql: ${current_age} ;;
  }

  dimension: age_tier {
    hidden: yes
    type: tier
    tiers: [20,30,40,50,60,70,80,90,100]
    style: integer
    sql: ${age} ;;
  }

  measure: average_age {
    hidden: yes
    type: average
    sql: ${age} ;;
  }

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
