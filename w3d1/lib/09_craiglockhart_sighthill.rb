def craiglockhart_to_sighthill
  execute(<<-SQL)
    SELECT
      start.num, start.company, transfer.name, finish.num, finish.company
    FROM
      routes AS start_route -- can also join stops to search with 'name' in WHERE
    JOIN
      routes AS to_transfer ON start.company = to_transfer.company
      AND start.num = to_transfer.num --all routes that we can go from Craiglockhart (same num, same company)

    JOIN
      stops AS transfer_stop ON to_transfer.stop_id = transfer.id --transfer station

    JOIN
      routes AS from_transfer ON transfer.id = from_transfer.stop_id
    JOIN
      routes AS finish_route ON finish.company = from_transfer.compnay
      AND finish.num = from_transfer.num --all routes that is heading to Sighthill

    WHERE
      start_route.stop_id = (
        SELECT id
        FROM stops
        WHERE name = 'Craiglockhart'
      )
      AND
      finish_route.stop_id = (
        SELECT id
        FROM stops
        WHERE name = 'Sighthill'
      )
  SQL
end
