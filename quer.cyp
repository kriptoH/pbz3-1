// 1
MATCH (p:Country)
  WHERE p.name = 'Russia'
RETURN p;

// 2
MATCH (Country)-[:LIKE]->(GUN)
  WHERE Country.name = 'Germany'
RETURN GUN;

// 3
MATCH (Country)-[l:LIKE]->(GUN)
  WHERE GUN.name = 'AK-47' AND l.rating > 0
RETURN Country.name;

// 4
MATCH (Country2)-[:BE_NEUTRAL]->(Country)-[l:LIKE]->(dragunov:GUN)
  WHERE dragunov.name = 'dragunov' AND l.rating > 8
RETURN Country2.name;

// 5
MATCH (Country2)-[:BE_NEUTRAL]->(Country)-[l:LIKE]->(gun:GUN)
  WHERE Country2.name = 'Russia' AND l.rating > 6
  AND NOT (Country2)-[:LIKE]->(gun:GUN)
RETURN gun;


// 6
MATCH (rus:Country)-[:BE_NEUTRAL]->(relation:Country)
RETURN relation;

// 7
MATCH ()-[l:LIKE]->(gun:GUN)
  WHERE l.rating = 8
RETURN gun;

// 8
MATCH (Country)-[l:LIKE]->(GUN)
  WHERE Country.name = 'Germany' AND l.rating > 0
RETURN GUN;

// 9
MATCH (Country)-[l:LIKE]->(GUN)
  WHERE GUN.name = 'AK-47' AND l.rating > 0
RETURN Country;

// 10
MATCH ()-[l:LIKE]->(gun:GUN)
  WHERE l.rating < 0
RETURN gun.name, l.rating;