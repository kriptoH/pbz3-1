CREATE(rus:Country {name: 'Russia', union: 'CIS'});

MATCH(p:Country)
  WHERE p.name = 'Russia'
CREATE(p)-[:LIKE {rating: 10}]->(ak47:GUN {name: 'AK-47', caliber: '7.62'});


MATCH(rus:Country)
  WHERE rus.name = 'Russia'
CREATE(rus)-[:LIKE {rating: 9}]->(dragunov:GUN {name: 'SVD', caliber: '7.62'});


MATCH(rus:Country)
  WHERE rus.name = 'Russia'
CREATE(rus)-[:LIKE {rating: -8}]->(glock:GUN {name: 'glock-18', caliber: '9'});

MATCH(rus:Country)
  WHERE rus.name = 'Russia'
CREATE(rus)-[:LIKE {rating: -7}]->(m4a1:GUN {name: 'M4A1', caliber: '5.56'});

MATCH(rus:Country)
  WHERE rus.name = 'Russia'
CREATE(rus)-[:LIKE {rating: 8}]->(makarov:GUN {name: 'PM', caliber: '9'});

MATCH (ak47:GUN)
  WHERE ak47.name = 'AK-47'
CREATE(ger:Country {name: 'Germany', union: 'NATO'})-[:LIKE {rating: -9}]->(ak47);

MATCH(ger:Country), (dragunov:GUN)
  WHERE ger.name = 'Germany' AND dragunov.name = 'SVD'
CREATE(ger)-[:LIKE {rating: -4}]->(dragunov);

MATCH(ger:Country)
  WHERE ger.name = 'Germany'
CREATE(ger)-[:LIKE {rating: 9}]->(barret:GUN {name: 'M82', caliber: '.50 BMG'});

MATCH(ger:Country), (makarov:GUN)
  WHERE ger.name = 'Germany' AND makarov.name = 'PM'
CREATE(ger)-[:LIKE {rating: -6}]->(makarov);

CREATE(somali:Country {name: 'Somali', union: 'LAS'});

MATCH(somali:Country), (dragunov:GUN)
  WHERE somali.name = 'Somali' AND dragunov.name = 'SVD'
CREATE(somali)-[:LIKE {rating: 5}]->(dragunov);

MATCH(somali:Country), (ak47:GUN)
  WHERE somali.name = 'Somali' AND ak47.name = 'AK-47'
CREATE(somali)-[:LIKE {rating: 10}]->(ak47);

CREATE(somali)-[:LIKE {rating: -9}]->(mp5:GUN {name: 'HK MP5', caliber: '9'});

MATCH(rus:Country), (ger:Country)
  WHERE rus.name = 'Russia' AND ger.name = 'Germany'
CREATE(rus)-[:BE_NEUTRAL]->(ger);

MATCH(rus:Country), (ger:Country)
  WHERE rus.name = 'Russia' AND ger.name = 'Germany'
CREATE(rus)<-[:BE_NEUTRAL]-(ger);

MATCH(somali:Country), (ger:Country)
  WHERE somali.name = 'Somali' AND ger.name = 'Germany'
CREATE(somali)<-[:BE_NEUTRAL]-(ger);

MATCH(somali:Country), (ger:Country)
  WHERE somali.name = 'Somali' AND ger.name = 'Germany'
CREATE(somali)-[:BE_NEUTRAL]->(ger);

MATCH(n)
DETACH
DELETE n;



