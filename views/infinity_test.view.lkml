view: infinity_test {
  derived_table: {
    sql: WITH sample AS (SELECT * FROM VALUES
    ('blue', '2023-10-02', infinity()),
    ('red', '2023-10-01', 0),
    ('yellow', '2023-10-03', 1)) AS colors (name, day, value)
    SELECT  name, day, value FROM sample;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: value_total {
    type: sum
    sql: ${value} ;;
  }

  measure: divided_zero {
    type: number
    sql: ${value_total}/${value} ;;
  }
}
