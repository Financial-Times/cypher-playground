CREATE (apple:Organisation {name: 'Apple'})
CREATE (nike:Organisation {name: 'Nike'})
CREATE (sj:Person {name: 'Steve Jobs'})
CREATE (tc:Person {name: 'Tim Cook'})
CREATE ((sj)-[:MEMBER_OF {since: 1972, until: 2012, type: 'CEO'}]->(apple))
CREATE ((tc)-[:MEMBER_OF {since: 1984, type: 'Employee'}]->(apple))
CREATE ((tc)-[:MEMBER_OF {since: 2012, type: 'Board Member'}]->(nike))

// Questions
// Who is or has ever been CEO of Apple
MATCH (p:Person)-[:MEMBER_OF {type: 'CEO'}]->(o:Organisation{name:'Apple'}) return p
