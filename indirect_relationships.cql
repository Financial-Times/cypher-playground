CREATE (apple:Organisation {name: 'Apple'})
CREATE (nike:Organisation {name: 'Nike'})
CREATE (sj:Person {name: 'Steve Jobs'})
CREATE (tc:Person {name: 'Tim Cook'})

CREATE (sje1:Employment {since: 1972, until: 2012})
CREATE (tce1:Employment {since: 1984})
CREATE (tce2:Employment {since: 2012})
CREATE (tce3:BoardMember {since: 2011})

CREATE (cio:Role {name:'CIO'})
CREATE (cto:Role {name:'CTO'})
CREATE (bm:Role {name: 'Blabla'})

CREATE ((sj)-[:EMPLOYMENT]->(sje1))

CREATE ((tc)-[:EMPLOYMENT]->(tce1))
CREATE ((tc)-[:EMPLOYMENT]->(tce2))
CREATE ((tc)-[:MEMBER_OF]->(tce3))

CREATE ((sje1)-[:EMPLOYER]->(apple))
CREATE ((tce1)-[:EMPLOYER]->(apple))
CREATE ((tce2)-[:EMPLOYER]->(apple))
CREATE ((tce3)-[:BOARD]->(nike))

CREATE ((sje1)-[:ROLE]->(cio))
CREATE ((tce1)-[:ROLE]->(cto))
CREATE ((tce2)-[:ROLE]->(cio))
CREATE ((tce3)-[:ROLE]->(bm))
