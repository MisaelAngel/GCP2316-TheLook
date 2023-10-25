
view: union_test {
  derived_table: {
    sql: SELECT
          users.first_name  AS `users.name`,
          COUNT(*) AS `users.count`
      FROM demo_db.users  AS users
      GROUP BY
          1
      UNION
      SELECT
          users.first_name  AS "users.name",
          COUNT(*) AS "users.count"
      FROM demo_db2.users  AS users
      GROUP BY
          1
      ORDER BY
          1
      LIMIT 5 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_name {
    type: string
    sql: ${TABLE}.`users.name` ;;
  }

  dimension: users_count {
    type: number
    sql: ${TABLE}.`users.count` ;;
  }

  set: detail {
    fields: [
        users_name,
	users_count
    ]
  }
}
