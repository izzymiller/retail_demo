# - dashboard: tmdb_the_movie_dashboard
#   title: TMDb (The Movie Dashboard)
#   layout: newspaper
#   elements:
#   - title: Rating Distribution
#     name: Rating Distribution
#     model: play_movies
#     explore: movies
#     type: looker_column
#     fields: [movies.count_movies, ratings_tier.curved_rating]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">500"
#       movies.vote_count: ">100"
#     sorts: [ratings_tier.curved_rating]
#     limit: 500
#     column_limit: 50
#     stacking: ''
#     colors: ["#5245ed", "#ed6168", "#1ea8df", "#353b49", "#49cec1", "#b3a0dd", "#db7f2a",
#       "#706080", "#a2dcf3", "#776fdf", "#e9b404", "#635189"]
#     color_application:
#       collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
#       palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
#       options:
#         steps: 5
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: none
#     series_colors:
#       movies.count_movies: "#6A013A"
#     series_types: {}
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     value_labels: legend
#     label_type: labPer
#     listen:
#       Rating: imdb_ratings.rating_selector
#     row: 10
#     col: 16
#     width: 8
#     height: 8
#   - name: Most "Successful" Directors
#     title: Most "Successful" Directors
#     merged_queries:
#     - model: play_movies
#       explore: movies
#       type: table
#       fields: [directors.name, ratings_tier.ratings_tier, movies.count_movies, imdb_ratings.rating]
#       filters:
#         title_type.title_type: movie
#         imdb_ratings.vote_count: ">500"
#         movies.vote_count: ">200"
#         imdb_ratings.rating_selector: average^_rating
#       sorts: [ratings_tier.ratings_tier desc, movies.count_movies desc 0, imdb_ratings.rating
#           desc]
#       limit: 100
#       column_limit: 50
#       show_view_names: false
#       show_row_numbers: true
#       truncate_column_names: false
#       hide_totals: false
#       hide_row_totals: false
#       table_theme: white
#       limit_displayed_rows: false
#       enable_conditional_formatting: true
#       conditional_formatting: [{type: low to high, value: !!null '', background_color: !!null '',
#           font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF",
#               "#4FBC89"]}, bold: false, italic: false, strikethrough: false, fields: [
#             movies.average_revenue]}]
#       conditional_formatting_include_totals: false
#       conditional_formatting_include_nulls: false
#       hidden_fields: [average_rating.ratings_tier, movies.count_movies, ratings_tier.ratings_tier]
#     - model: play_movies
#       explore: movies
#       type: table
#       fields: [directors.name, imdb_ratings.rating, movies.count_movies, movies.average_revenue]
#       filters:
#         title_type.title_type: movie
#         imdb_ratings.vote_count: ">0"
#         movies.vote_count: ">0"
#         imdb_ratings.rating_selector: curved^_rating
#         directors.name: Alfred Hitchcock,Martin Scorsese,Christopher Nolan,Stanley
#           Kubrick,Hayao Miyazaki,Quentin Tarantino,Steven Spielberg,Billy Wilder,Charles
#           Chaplin,Akira Kurosawa,Sergio Leone,David Fincher,Francis Ford Coppola,Ridley
#           Scott,Clint Eastwood,Ethan Coen,Ingmar Bergman,Frank Capra,Joel Coen,Peter
#           Jackson,Terry Jones,Isao Takahata,Andrei Tarkovsky,Kar-Wai Wong,Milos Forman,Damien
#           Chazelle,Chan-wook Park,Pete Docter,Rajkumar Hirani,Robert Zemeckis,Mel
#           Gibson,John Huston,Ron Howard,Woody Allen,Fritz Lang,James Cameron,Thomas
#           Vinterberg,Federico Fellini,Sidney Lumet,Peter Weir,Frank Darabont,Giuseppe
#           Tornatore,David Lean,Roman Polanski,Denis Villeneuve,Danny Boyle,Stanley
#           Donen,Ronnie Del Carmen,Éric Toledano,Joseph L. Mankiewicz,Lilly Wachowski,Aditya
#           Chopra,Kirk Wise,Robert Wiene,David Lynch,François Truffaut,Orson Welles,Lee
#           Unkrich,Steve McQueen,Charles Laughton,Ki-duk Kim,Mamoru Hosoda,Gabriela
#           Cowperthwaite,Richard Marquand,Garth Davis,George Roy Hill,Matt Ross,Morten
#           Tyldum,George Cukor,Luc Besson,Mathieu Kassovitz,Sam Wood,Tom McCarthy,Bob
#           Peterson,John Carney,Makoto Shinkai,Kátia Lund,John Carpenter,Malik Bendjelloul,Adam
#           Elliot,Oriol Paulo,Michael Cimino,"Gavin O'Connor",Lasse Hallström,Michel
#           Gondry,Sam Mendes,Franklin J. Schaffner,John Lasseter,Joon-ho Bong,Carol
#           Reed,Irvin Kershner,Oliver Hirschbiegel,Roberto Benigni,Gérard Oury,Victor
#           Fleming,Tony Kaye,Guillermo del Toro,Andrew Stanton,Charles Ferguson,Ari
#           Folman
#       sorts: [imdb_ratings.rating desc]
#       limit: 500
#       query_timezone: America/Los_Angeles
#       join_fields:
#       - source_field_name: directors.name
#         field_name: directors.name
#     color_application:
#       collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
#       palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
#     show_view_names: false
#     show_row_numbers: true
#     truncate_column_names: false
#     subtotals_at_bottom: false
#     hide_totals: false
#     hide_row_totals: false
#     table_theme: transparent
#     limit_displayed_rows: true
#     limit_displayed_rows_values:
#       show_hide: show
#       first_last: first
#       num_rows: '50'
#     enable_conditional_formatting: true
#     conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
#         font_color: !!null '', palette: {name: White to Green, colors: ["#FFFFFF",
#             "#4FBC89"]}, bold: false, italic: false, strikethrough: false, fields: [
#           movies.average_revenue], color_application: {collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b,
#           palette_id: 0fb6d761-0476-4a6d-987f-15f890984d47, options: {steps: 5, constraints: {
#               min: {type: minimum}, mid: {type: median}}}}}]
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     type: table
#     hidden_fields: [movies.count_movies, ratings_tier.ratings_tier, imdb_ratings.rating]
#     row: 7
#     col: 7
#     width: 9
#     height: 11
#   - title: Ratings by Years Active
#     name: Ratings by Years Active
#     model: play_movies
#     explore: movies
#     type: looker_scatter
#     fields: [directors.years_active, imdb_ratings.rating, movies.count_movies]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">500"
#       movies.vote_count: ">100"
#       imdb_ratings.rating_selector: curved^_rating
#     sorts: [directors.years_active]
#     limit: 500
#     column_limit: 50
#     stacking: ''
#     color_application:
#       collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
#       palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
#       options:
#         steps: 5
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: circle
#     series_colors:
#       imdb_ratings.rating: "#6A013A"
#     series_types: {}
#     limit_displayed_rows: false
#     y_axes: [{label: '', orientation: left, series: [{id: imdb_ratings.rating, name: Curved
#               Rating, axisId: imdb_ratings.rating}], showLabels: true, showValues: true,
#         unpinAxis: true, tickDensity: default, type: linear}]
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     size_by_field: movies.count_movies
#     plot_size_by_field: false
#     trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
#         series_index: 1, show_label: true, label_type: r2}]
#     show_null_points: true
#     listen: {}
#     row: 44
#     col: 0
#     width: 12
#     height: 10
#   - name: <font size="6">$$$</font>
#     type: text
#     title_text: <font size="6">$$$</font>
#     row: 54
#     col: 0
#     width: 24
#     height: 2
#   - name: <font size="6">Years Active</font>
#     type: text
#     title_text: <font size="6">Years Active</font>
#     row: 41
#     col: 0
#     width: 24
#     height: 3
#   - name: <font size="13">Movies</font><br><font size="6">The Big Picture</font>
#     type: text
#     title_text: <font size="13">Movies</font><br><font size="6">The Big Picture</font>
#     row: 0
#     col: 0
#     width: 24
#     height: 4
#   - title: Movies Count
#     name: Movies Count
#     model: play_movies
#     explore: movies
#     type: single_value
#     fields: [movies.average_budget, movies.average_popularity, movies.average_runtime,
#       movies.average_revenue, movies.count_movies, movies.total_revenue, imdb_ratings.rating]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">1"
#       movies.vote_count: ">1"
#     limit: 500
#     column_limit: 50
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     single_value_title: Movies in Dataset
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     series_types: {}
#     hidden_fields: [movies.average_popularity, movies.average_runtime, movies.average_budget,
#       movies.average_revenue]
#     row: 4
#     col: 7
#     width: 5
#     height: 3
#   - title: Average Rating
#     name: Average Rating
#     model: play_movies
#     explore: movies
#     type: single_value
#     fields: [movies.average_budget, movies.average_popularity, movies.average_runtime,
#       movies.average_revenue, movies.count_movies, movies.total_revenue, imdb_ratings.rating]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">0"
#       movies.vote_count: ">0"
#     limit: 500
#     column_limit: 50
#     series_types: {}
#     hidden_fields: [movies.average_popularity, movies.average_runtime, movies.average_budget,
#       movies.average_revenue, movies.count_movies, movies.total_revenue]
#     y_axes: []
#     listen:
#       Rating: imdb_ratings.rating_selector
#     row: 7
#     col: 16
#     width: 8
#     height: 3
#   - title: Average Runtime
#     name: Average Runtime
#     model: play_movies
#     explore: movies
#     type: single_value
#     fields: [movies.average_budget, movies.average_popularity, movies.average_runtime,
#       movies.average_revenue, movies.count_movies, movies.total_revenue, imdb_ratings.rating]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.rating_selector: average^_rating
#       imdb_ratings.vote_count: ">0"
#       movies.vote_count: ">0"
#     limit: 500
#     column_limit: 50
#     series_types: {}
#     hidden_fields: [movies.average_budget, movies.average_popularity]
#     y_axes: []
#     row: 4
#     col: 19
#     width: 5
#     height: 3
#   - title: Ratings and Revenue
#     name: Ratings and Revenue
#     model: play_movies
#     explore: movies
#     type: looker_scatter
#     fields: [imdb_ratings.rating, movies.average_revenue, movies.title]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">5000"
#       movies.vote_count: ">1000"
#     sorts: [movies.average_revenue desc 0, imdb_ratings.rating desc]
#     limit: 500
#     column_limit: 50
#     stacking: ''
#     color_application:
#       collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
#       palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
#       options:
#         steps: 5
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: circle
#     series_colors:
#       imdb_ratings.rating: "#9ED7D7"
#     series_types: {}
#     limit_displayed_rows: false
#     limit_displayed_rows_values:
#       show_hide: hide
#       first_last: first
#       num_rows: 0
#     y_axes: [{label: '', orientation: left, series: [{id: imdb_ratings.rating, name: Average
#               Rating, axisId: imdb_ratings.rating}], showLabels: true, showValues: true,
#         minValue: 3.75, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
#         type: linear}]
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     reference_lines: []
#     trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
#         series_index: 1, show_label: true, label_type: r2}]
#     swap_axes: false
#     show_null_points: false
#     interpolation: linear
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     hidden_fields: [movies.title]
#     listen:
#       Rating: imdb_ratings.rating_selector
#     row: 56
#     col: 0
#     width: 11
#     height: 10
#   - title: Revenue by Month
#     name: Revenue by Month
#     model: play_movies
#     explore: movies
#     type: looker_column
#     fields: [movies.release_month_name, movies.metric, imdb_ratings.rating]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.rating_selector: average^_rating
#       imdb_ratings.vote_count: ">5000"
#       movies.vote_count: ">1000"
#       movies.metric_selector: total^_revenue
#     sorts: [movies.release_month_name]
#     limit: 500
#     column_limit: 50
#     stacking: ''
#     colors: ["#62bad4", "#a9c574", "#929292", "#9fdee0", "#1f3e5a", "#90c8ae", "#92818d",
#       "#c5c6a6", "#82c2ca", "#cee0a0", "#928fb4", "#9fc190"]
#     color_application:
#       collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
#       palette_id: 0cc9e709-0004-4166-adc2-c979c6a55ca0
#       options:
#         steps: 5
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: circle_outline
#     series_colors: {}
#     series_types:
#       imdb_ratings.rating: line
#     series_point_styles: {}
#     limit_displayed_rows: false
#     hidden_series: []
#     y_axes: [{label: !!null '', orientation: left, series: [{id: movies.metric, name: Total
#               Revenue, axisId: movies.metric}], showLabels: false, showValues: true,
#         valueFormat: '$0,,," Billion"', unpinAxis: false, tickDensity: default, type: linear},
#       {label: !!null '', orientation: left, series: [{id: imdb_ratings.rating, name: Average
#               Rating, axisId: imdb_ratings.rating}], showLabels: false, showValues: false,
#         unpinAxis: false, tickDensity: default, type: linear}]
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     show_null_points: true
#     interpolation: monotone
#     row: 75
#     col: 14
#     width: 10
#     height: 10
#   - title: Ratings Over Time
#     name: Ratings Over Time
#     model: play_movies
#     explore: movies
#     type: looker_column
#     fields: [movies.count_movies, ratings_tier.ratings_tier, movies.5_years]
#     pivots: [ratings_tier.ratings_tier]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">0"
#       movies.vote_count: ">0"
#       movies.5_years: "-Undefined,-Below 1910"
#     sorts: [ratings_tier.ratings_tier, movies.5_years]
#     limit: 500
#     column_limit: 50
#     stacking: percent
#     color_application:
#       collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
#       palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
#       options:
#         steps: 5
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     hide_legend: false
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: none
#     series_colors: {}
#     series_types: {}
#     limit_displayed_rows: false
#     hidden_series: ['T00 (-inf,1.0) - movies.count', 'T10 [10.0,inf) - movies.count']
#     y_axes: [{label: '', orientation: left, series: [{id: 1.0 - movies.count_movies,
#             name: '1', axisId: movies.count_movies}, {id: 2.0 - movies.count_movies,
#             name: '2', axisId: movies.count_movies}, {id: 3.0 - movies.count_movies,
#             name: '3', axisId: movies.count_movies}, {id: 4.0 - movies.count_movies,
#             name: '4', axisId: movies.count_movies}, {id: 5.0 - movies.count_movies,
#             name: '5', axisId: movies.count_movies}, {id: 6.0 - movies.count_movies,
#             name: '6', axisId: movies.count_movies}, {id: 7.0 - movies.count_movies,
#             name: '7', axisId: movies.count_movies}, {id: 8.0 - movies.count_movies,
#             name: '8', axisId: movies.count_movies}, {id: 9.0 - movies.count_movies,
#             name: '9', axisId: movies.count_movies}], showLabels: true, showValues: true,
#         unpinAxis: false, tickDensity: default, tickDensityCustom: 0, type: linear}]
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: false
#     x_axis_label: Year
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     show_null_points: true
#     interpolation: linear
#     row: 18
#     col: 7
#     width: 17
#     height: 12
#   - title: Total Revenue
#     name: Total Revenue
#     model: play_movies
#     explore: movies
#     type: single_value
#     fields: [movies.average_budget, movies.average_popularity, movies.average_runtime,
#       movies.average_revenue, movies.count_movies, movies.total_revenue, imdb_ratings.rating]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.rating_selector: average^_rating
#       imdb_ratings.vote_count: ">0"
#       movies.vote_count: ">0"
#     limit: 500
#     column_limit: 50
#     custom_color_enabled: false
#     custom_color: forestgreen
#     show_single_value_title: true
#     value_format: "$###,###"
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     series_types: {}
#     hidden_fields: [movies.average_popularity, movies.average_runtime, movies.average_budget,
#       movies.average_revenue, movies.count_movies]
#     y_axes: []
#     row: 4
#     col: 12
#     width: 7
#     height: 3
#   - title: Top Movies by Rating
#     name: Top Movies by Rating
#     model: play_movies
#     explore: movies
#     type: table
#     fields: [movies.poster, directors.name, imdb_ratings.rating, imdb_ratings.total_votes]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">5000"
#       movies.vote_count: ">1000"
#     sorts: [imdb_ratings.rating desc]
#     limit: 25
#     query_timezone: America/Los_Angeles
#     show_view_names: false
#     show_row_numbers: true
#     truncate_column_names: false
#     hide_totals: false
#     hide_row_totals: false
#     series_labels:
#       directors.name: Director
#       movies.poster: Movie
#       movies.title_dropdown: Title
#     table_theme: unstyled
#     limit_displayed_rows: false
#     limit_displayed_rows_values:
#       show_hide: show
#       first_last: first
#       num_rows: '10'
#     enable_conditional_formatting: true
#     conditional_formatting: []
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     hidden_fields: [imdb_ratings.total_votes]
#     series_types: {}
#     listen:
#       Rating: imdb_ratings.rating_selector
#     row: 4
#     col: 0
#     width: 7
#     height: 26
#   - title: Collection
#     name: Collection
#     model: play_movies
#     explore: movies
#     type: looker_bar
#     fields: [collections.collection, movies.metric]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">0"
#       movies.vote_count: ">0"
#       collections.collection: "-NULL"
#       movies.count_movies: ">1"
#     sorts: [movies.metric desc]
#     limit: 15
#     column_limit: 50
#     stacking: ''
#     colors: ["#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99", "#e31a1c", "#fdbf6f",
#       "#ff7f00", "#cab2d6", "#6a3d9a", "#edbc0e", "#b15928", "#000000"]
#     color_application:
#       collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
#       palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
#       options:
#         steps: 5
#     show_value_labels: true
#     label_density: 25
#     label_color: ["#000000"]
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: none
#     series_colors:
#       movies.metric: "#7363A9"
#     series_types: {}
#     limit_displayed_rows: false
#     y_axes: [{label: '', orientation: bottom, series: [{id: movies.metric, name: Average
#               Revenue, axisId: movies.metric}], showLabels: true, showValues: false,
#         valueFormat: '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
#         type: linear}]
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: false
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     label_value_format: $0.0,,," Billion"
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     listen:
#       Money Metric: movies.metric_selector
#     row: 66
#     col: 0
#     width: 12
#     height: 9
#   - title: Genre
#     name: Genre
#     model: play_movies
#     explore: movies
#     type: looker_bar
#     fields: [genres.genre, movies.metric]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">5000"
#       movies.vote_count: ">1000"
#     sorts: [movies.metric desc]
#     limit: 500
#     column_limit: 50
#     stacking: ''
#     colors: ["#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99", "#e31a1c", "#fdbf6f",
#       "#ff7f00", "#cab2d6", "#6a3d9a", "#edbc0e", "#b15928", "#b15928"]
#     show_value_labels: true
#     label_density: 25
#     label_color: ["#"]
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: none
#     series_colors:
#       movies.metric: "#fdbf6f"
#     series_types: {}
#     limit_displayed_rows: false
#     y_axes: [{label: '', orientation: bottom, series: [{id: movies.metric, name: Total
#               Revenue, axisId: movies.metric}], showLabels: true, showValues: false,
#         valueFormat: '', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
#         type: linear}]
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: false
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     label_value_format: $0.0,,," Billion"
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     reference_lines: []
#     trend_lines: []
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     listen:
#       Money Metric: movies.metric_selector
#     row: 66
#     col: 12
#     width: 12
#     height: 9
#   - title: Production Company
#     name: Production Company
#     model: play_movies
#     explore: movies
#     type: looker_line
#     fields: [production_companies.production_company, imdb_ratings.rating, movies.metric]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">5000"
#       movies.vote_count: ">1000"
#       imdb_ratings.rating_selector: average^_rating
#     sorts: [movies.metric desc]
#     limit: 6
#     column_limit: 50
#     stacking: ''
#     colors: ["#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99", "#e31a1c", "#fdbf6f",
#       "#ff7f00", "#cab2d6", "#6a3d9a", "#edbc0e", "#b15928"]
#     color_application:
#       collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
#       palette_id: ac6ae05d-f9a3-4ac3-b7b8-1be843c74609
#       options:
#         steps: 5
#     show_value_labels: true
#     label_density: 25
#     label_color: [transparent, "#000000"]
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: circle_outline
#     series_colors: {}
#     series_types:
#       movies.metric: column
#     series_point_styles:
#       imdb_ratings.rating: diamond
#     limit_displayed_rows: false
#     y_axes: [{label: '', orientation: left, series: [{id: movies.metric, name: Total
#               Revenue, axisId: movies.metric}], showLabels: false, showValues: false,
#         unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
#       {label: !!null '', orientation: left, series: [{id: imdb_ratings.rating, name: Ratings
#               Rating, axisId: imdb_ratings.rating}], showLabels: false, showValues: false,
#         unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: false
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     label_value_format: $0.0,,," Billion"
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     show_null_points: true
#     interpolation: monotone
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     listen:
#       Money Metric: movies.metric_selector
#     row: 75
#     col: 0
#     width: 14
#     height: 10
#   - title: 100 Years of Genre
#     name: 100 Years of Genre
#     model: play_movies
#     explore: movies
#     type: looker_column
#     fields: [genres.genre, movies.count_movies, movies.decade]
#     pivots: [genres.genre]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">0"
#       movies.vote_count: ">0"
#       genres.genre: "-NULL"
#       movies.decade: "-Below 1900,-1900 to 1909,-Undefined"
#     sorts: [genres.genre 0, movies.decade]
#     limit: 500
#     query_timezone: America/Los_Angeles
#     stacking: percent
#     colors: ["#42A5F5", "#EF5350", "#FFCA28", "#66BB6A", "#AB47BC", "#EC407A", "#7E57C2",
#       "#5C6BC0", "#29B6F6", "#26C6DA", "#26A69A", "#9CCC65", "#D4E157", "#FFEE58",
#       "#FFA726", "#FF7043", "#8D6E63", "#BDBDBD", "#78909C"]
#     color_application:
#       collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
#       palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
#       options:
#         steps: 5
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: none
#     series_colors: {}
#     series_types: {}
#     limit_displayed_rows: false
#     y_axes: [{label: '', orientation: left, series: [{id: Action - movies.count_movies,
#             name: Action, axisId: movies.count_movies}, {id: Adventure - movies.count_movies,
#             name: Adventure, axisId: movies.count_movies}, {id: Animation - movies.count_movies,
#             name: Animation, axisId: movies.count_movies}, {id: Comedy - movies.count_movies,
#             name: Comedy, axisId: movies.count_movies}, {id: Crime - movies.count_movies,
#             name: Crime, axisId: movies.count_movies}, {id: Documentary - movies.count_movies,
#             name: Documentary, axisId: movies.count_movies}, {id: Drama - movies.count_movies,
#             name: Drama, axisId: movies.count_movies}, {id: Family - movies.count_movies,
#             name: Family, axisId: movies.count_movies}, {id: Fantasy - movies.count_movies,
#             name: Fantasy, axisId: movies.count_movies}, {id: Foreign - movies.count_movies,
#             name: Foreign, axisId: movies.count_movies}, {id: History - movies.count_movies,
#             name: History, axisId: movies.count_movies}, {id: Horror - movies.count_movies,
#             name: Horror, axisId: movies.count_movies}, {id: Music - movies.count_movies,
#             name: Music, axisId: movies.count_movies}, {id: Mystery - movies.count_movies,
#             name: Mystery, axisId: movies.count_movies}, {id: Romance - movies.count_movies,
#             name: Romance, axisId: movies.count_movies}, {id: Science Fiction - movies.count_movies,
#             name: Science Fiction, axisId: movies.count_movies}, {id: Thriller - movies.count_movies,
#             name: Thriller, axisId: movies.count_movies}, {id: TV Movie - movies.count_movies,
#             name: TV Movie, axisId: movies.count_movies}, {id: War - movies.count_movies,
#             name: War, axisId: movies.count_movies}, {id: Western - movies.count_movies,
#             name: Western, axisId: movies.count_movies}], showLabels: true, showValues: false,
#         unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     row: 30
#     col: 0
#     width: 24
#     height: 11
#   - title: Budget, Ratings & Revenue
#     name: Budget, Ratings & Revenue
#     model: play_movies
#     explore: movies
#     type: looker_line
#     fields: [movies.average_revenue, imdb_ratings.rating, movies.budget_category]
#     fill_fields: [movies.budget_category]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">5000"
#       movies.vote_count: ">1000"
#     sorts: [movies.budget_category]
#     limit: 500
#     column_limit: 50
#     stacking: ''
#     colors: ["#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99", "#e31a1c", "#fdbf6f",
#       "#ff7f00", "#cab2d6", "#6a3d9a", "#edbc0e", "#b15928"]
#     color_application:
#       collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
#       palette_id: 807a22b0-53c0-40e2-8b3b-28c8e266b0ea
#       options:
#         steps: 5
#     show_value_labels: true
#     label_density: 25
#     label_color: ["#0000", "#"]
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: circle_outline
#     series_colors: {}
#     series_types:
#       imdb_ratings.rating: column
#     series_point_styles:
#       movies.average_revenue: diamond
#     limit_displayed_rows: false
#     y_axes: [{label: '', orientation: left, series: [{id: imdb_ratings.rating, name: Average
#               Rating, axisId: imdb_ratings.rating}], showLabels: false, showValues: false,
#         unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
#       {label: !!null '', orientation: left, series: [{id: movies.average_revenue,
#             name: Movies Average Revenue, axisId: movies.average_revenue}], showLabels: false,
#         showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
#         type: linear}]
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     show_null_points: true
#     interpolation: linear
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: true
#     show_silhouette: false
#     totals_color: "#808080"
#     listen:
#       Rating: imdb_ratings.rating_selector
#     row: 56
#     col: 11
#     width: 13
#     height: 10
#   - title: Director Years Active
#     name: Director Years Active
#     model: play_movies
#     explore: movies
#     type: looker_funnel
#     fields: [directors.count, directors.years_active_tier]
#     fill_fields: [directors.years_active_tier]
#     filters:
#       title_type.title_type: movie
#       imdb_ratings.vote_count: ">500"
#       movies.vote_count: ">100"
#     sorts: [directors.years_active_tier]
#     limit: 500
#     query_timezone: America/Los_Angeles
#     leftAxisLabelVisible: false
#     leftAxisLabel: ''
#     rightAxisLabelVisible: false
#     rightAxisLabel: ''
#     barColors: ["#7FCDAE", "#7ED09C", "#7DD389", "#85D67C", "#9AD97B", "#B1DB7A",
#       "#CADF79", "#E2DF78", "#E5C877", "#E7AF75", "#EB9474", "#EE7772"]
#     color_application:
#       collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
#       palette_id: 0cc9e709-0004-4166-adc2-c979c6a55ca0
#       options:
#         steps: 5
#     smoothedBars: false
#     orientation: automatic
#     labelPosition: inline
#     percentType: total
#     percentPosition: left
#     valuePosition: right
#     labelColorEnabled: false
#     labelColor: "#FFF"
#     stacking: ''
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: none
#     series_types: {}
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     listen: {}
#     row: 44
#     col: 12
#     width: 12
#     height: 10
#   filters:
#   - name: Money Metric
#     title: Money Metric
#     type: field_filter
#     default_value: total^_revenue
#     allow_multiple_values: true
#     required: false
#     model: play_movies
#     explore: movies
#     listens_to_filters: []
#     field: movies.metric_selector
#   - name: Rating
#     title: Rating
#     type: field_filter
#     default_value: curved^_rating
#     allow_multiple_values: true
#     required: false
#     model: play_movies
#     explore: movies
#     listens_to_filters: []
#     field: imdb_ratings.rating_selector
