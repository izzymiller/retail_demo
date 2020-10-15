view: movies {
  sql_table_name: mak_movies.movies ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  measure: count_movies {
    label: "Number of Movies"
    type: count_distinct
    sql: ${title} ;;
    drill_fields: [title, release_year, genres.genre, overview]
  }

# VISIBLE

  dimension: budget {
    group_label: "Budget Information"
    type: number
    sql: ${TABLE}.budget ;;
    value_format_name: usd
  }

  dimension: budget_tier {
    group_label: "Budget Information"
    type: tier
    tiers: [10000000,40000000,100000000]
    style: integer
    sql: ${budget} ;;
    value_format_name: usd
  }

  dimension: budget_category {
    group_label: "Budget Information"
    description: "Ultra Low budget < $10,000,000, High Budget < $100,000,000"
    case: {
      when: {
        sql: ${budget} < 10000000;;
        label: "Ultra Low Budget"
      }
      when: {
        sql: ${budget} < 40000000;;
        label: "Low Budget"
      }
      when: {
        sql: ${budget} < 100000000;;
        label: "Medium Budget"
      }
      else: "High Budget"
    }
  }

  dimension: overview {
    group_label: "Movie Details"
    label: "Brief Summary"
    type: string
    sql: ${TABLE}.overview ;;
  }

  dimension_group: release {
    type: time
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      year,
      month_name,
    ]
    convert_tz: no
    sql: cast(${TABLE}.release_date as timestamp) ;;
  }

  dimension: decade {
    label: "Release Decade"
    type: tier
    tiers: [1900,1910,1920,1930,1940,1950,1960,1970,1980,1990,2000,2010]
    style: integer
    sql: ${release_year} ;;
  }

  dimension: runtime {
    group_label: "Runtime"
    label: "Movie Runtime"
    description: "Runtime In Minutes"
    type: number
    sql: ${TABLE}.runtime ;;
  }

  dimension: runtime_tier {
    group_label: "Runtime"
    label: "Movie Runtime Tier"
    description: "Runtime buckets of <60, 60-90, 90-120, 120-150, and 150+ minutes"
    type: tier
    tiers: [60, 90, 120, 150]
    style: integer
    sql: ${runtime} ;;
  }

  dimension: tagline {
    group_label: "Movie Details"
    type: string
    sql: ${TABLE}.tagline ;;
  }

  dimension: title {
    label: "Movie Title"
    type: string
    sql: ${TABLE}.title ;;
    link: {
      label: "IMDb"
      url:"https://www.imdb.com/title/{{ ['movies.imdbid'] }}"
      icon_url: "https://imdb.com/favicon.ico"
    }
    link: {
      label: "{{ ['movies.homepage_link'] }}"
      url: "{{ ['movies.homepage'] }}"
    }
  }

  dimension: poster {
    group_label: "Movie Details"
    sql:${poster_path};;
    html:
    <a href="https://www.imdb.com/title/{{ ['movies.imdbid'] }}">
          <img src="http://image.tmdb.org/t/p/w185/{{ value }}" />
          </a>;;
  }

  measure: average_budget {
    type: average
    sql: ${budget} ;;
    value_format_name: usd
    drill_fields: [title, average_budget]
  }

  dimension: popularity {
    hidden: yes
    type: number
    sql: ${TABLE}.popularity ;;
    value_format_name: decimal_2
  }

  measure: average_popularity {
    description: "TMDb Average Popularity Score, which uses an open-ended scale and is based on number of votes, number of views, number of users who marked it as a favourite, number of users who added it to their watchlist, and release date"
    type: average
    sql: ${popularity} ;;
    value_format_name: decimal_2
    drill_fields: [title, release_year, genres.genre, average_popularity]
  }

  measure: average_revenue {
    type: average
    sql: ${revenue} ;;
    value_format_name: usd
    drill_fields: [title, release_year, genres.genre, average_revenue]
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue};;
    value_format_name: usd
    drill_fields: [title, release_year, genres.genre, total_revenue]
  }

  measure: average_runtime {
    type: average
    sql: ${runtime} ;;
    value_format_name: decimal_2
    drill_fields: [title, release_year, genres.genre, average_runtime]
  }


# INVISIBLE

  dimension: original_language {
    hidden: yes
    type: string
    sql: ${TABLE}.original_language ;;
  }

  dimension: original_title {
    hidden: yes
    type: string
    sql: ${TABLE}.original_title ;;
  }

  dimension: 5_years {
    hidden: yes
    type: tier
    tiers: [1910,1915,1920,1925,1930,1935,1940,1945,1950,1955,1960,1965,1970,1975,1980,1985,1990,1995,2000,2005,2010,2015]
    style: integer
    sql: ${release_year} ;;
  }

  dimension: revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.revenue ;;
    value_format_name: usd
  }

  dimension: has_homepage{
    hidden: yes
    type: yesno
    sql: ${homepage} is not null ;;
  }

  dimension: homepage_link {
    hidden: yes
    sql: CASE WHEN ${has_homepage} THEN "Homepage" ELSE "∅" END ;;
  }

  dimension: vote_avg {
    hidden: yes
    type: number
    sql: ${TABLE}.vote_average ;;
  }

  measure: tmdb_rating {
    hidden: yes
    type: average
    sql: ${vote_avg} ;;
  }

#   measure: average_rating {
#     hidden: yes
#     type: number
#     sql: (${imdb_ratings.imdb_rating}+${movies.tmdb_rating})/2 ;;
#   }

  dimension: status {
    hidden: yes
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: homepage {
    hidden: yes
    type: string
    sql: ${TABLE}.homepage ;;
  }

  dimension: imdbid {
    hidden: yes
    type: string
    sql: ${TABLE}.imdbid ;;
  }

  dimension: poster_path {
    hidden: yes
    type: string
    sql: ${TABLE}.poster_path ;;
  }
}

view: movies_full {
  extends: [movies]

  dimension: genres {
    type: string
    sql: ${TABLE}.genres ;;
  }

  dimension: spoken_languages {
    type: string
    sql: ${TABLE}.spoken_languages ;;
  }

  dimension: production_companies {
    type: string
    sql: ${TABLE}.production_companies ;;
  }

  dimension: production_countries {
    type: string
    sql: ${TABLE}.production_countries ;;
  }

  dimension: belongs_to_collection {
    type: string
    sql: ${TABLE}.belongs_to_collection ;;
  }

  dimension: title_dropdown {
    hidden: yes
    type: string
    sql: ${title} ;;
    link: {
      label: "IMDb"
      url:"https://www.imdb.com/title/{{ ['movies.imdbid'] }}"
      icon_url: "https://imdb.com/favicon.ico"
    }
    link: {
      label: "{{ ['movies.homepage_link'] }}"
      url: "{{ ['movies.homepage'] }}"
    }
    html:
          <div style="width:100%; text-align: centre;"> <details>
          <summary style="outline:none">{{ title._linked_value }}</summary>
          <b>Year:<b> {{ movies.release_year._linked_value }}
          <br>
          <b>Type:<b> {{ title_type.title_type._linked_value }}
          <br>
          <b>Age:<b> {{ directors.age._linked_value }}

          </details>
          </div>
          ;;
  }

  dimension: popularity_tier {
    hidden: yes
    type: tier
    tiers: [0,5,10,15,20,25,30,35,40,45,50,100,150,200,250,300,350,400,450,500,550]
    style: interval
    sql: ${popularity} ;;
  }

  dimension: vote_count {
    hidden: yes
    label: "TMDb Vote Count"
    type: number
    sql: ${TABLE}.vote_count ;;
  }

 #   parameter: metric_selector {
#     description: "Use with Metric measure"
#     type: string
#     allowed_value: {
#       value: "total_revenue"
#       label: "Total Revenue"
#     }
#     allowed_value: {
#       value: "average_revenue"
#       label: "Average Revenue"
#     }
#     allowed_value: {
#       value: "Average Budget"
#     }
#   }

#   measure: metric {
#     description: "Use with Metric Selector"
#     label_from_parameter: metric_selector
#     type: number
#     value_format_name: usd
#     sql:
#       CASE
#       WHEN {% parameter metric_selector %} = 'average_budget' THEN
#           ${movies.average_budget}
#         WHEN {% parameter metric_selector %} = 'average_revenue' THEN
#           ${average_revenue}
#           WHEN {% parameter metric_selector %} = 'total_revenue' THEN
#           ${movies.total_revenue}
#         ELSE
#           NULL
#       END ;;
#     drill_fields: [title, metric]
#   }

}
