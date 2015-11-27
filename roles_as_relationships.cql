// Roles are the relationships so won't find any of these here !
//MERGE (coo:Role:Thing {name: 'COO'})
//MERGE (cto:Role:Thing {name: 'CTO'})
//MERGE (cio:Role:Thing {name: 'CIO'})
//MERGE (cfo:Role:Thing {name: 'CFO'})

// Some Companies
MERGE (apple:PublicCompany:Company:Organisation:Thing {name: 'Apple'})
MERGE (pearson:PublicCompany:Company:Organisation:Thing {name: 'Pearson PLC'})
MERGE (ft:Company:Organisation:Thing {name: 'Financial Times'})
MERGE (twitter:PublicCompany:Company:Organisation:Thing {name: 'Twitter Inc'})
MERGE ((ft)-[:SUBORGANISATION_OF]->(pearson))
MERGE (kanzi:PrivateCompany:Company:Organisation:Thing {name: 'Kanzi Limited'})
MERGE (cliche:PrivateCompany:Company:Organisation:Thing {name: 'Cliche Solutions Ltd'})

// Some People
MERGE (dgem:Person:Thing {name: 'Dan Murphy'})
MERGE (carlos:Person:Thing {name: 'Carlos Roman'})
MERGE (tim:Person:Thing {name: 'Tim Cook'})
MERGE (steve:Person:Thing {name: 'Steve Jobs'})
MERGE (john:Person:Thing {name: 'John Fallon'})
MERGE (marjorie:Person:Thing {name: 'Marjorie Scardino'})

// Memberships

// Steve & Apple (early years)
MERGE ((steve)-[:PRESEDENT_OF {start: 1976, end: 1986}]->(apple))
MERGE ((steve)-[:MEMBER_OF {start:1976, end: 1986}]->(apple))

// Steve & Apple (return)
MERGE ((steve)-[:CEO_OF {start: 1997, end: 2011}]->(apple))
MERGE ((steve)-[:MEMBER_OF {start:1997, end: 2011}]->(apple))

// Tim & Apple
MERGE ((tim)-[:CEO_OF {start:2011, title:'Chief Executive Officer & Director'}]->(apple))
MERGE ((tim)-[:COO_OF {start:2010}]->(apple))
MERGE ((tim)-[:MEMBER_OF {start:1998}]->(apple))

// Questions
// Who is or was the CEO of Apple
MATCH (p:Person)-[:CEO_OF]->(:Organisation{name:'Apple'}) return p
// Who is the current CEO of Apple
MATCH (p:Person)-[r:CEO_OF]->(:Organisation{name:'Apple'}) WHERE (r.end IS NULL) return p
// Who was the original CEO of Apple
