// Looks like you cannot link to nodes from properties of relationships
// CREATE
//  (kanzi:Company:Organisation:Thing {name: 'Kanzi Limited'})
//  (dgem:Person:Thing {name: 'Dan Murphy'})
//  (dir:Role:Thing {name: 'Director'})
//  ((dgem)-[:MEMBER_OF {start: 2007, role:(dir) }]->(kanzi))

// Some Roles
MERGE (coo:Role:Thing {name: 'COO'})
MERGE (ceo:Role:Thing {name: 'CEO'})
MERGE (cto:Role:Thing {name: 'CTO'})
MERGE (cio:Role:Thing {name: 'CIO'})
MERGE (cfo:Role:Thing {name: 'CFO'})
MERGE (director:Role:Thing {name: 'Director'})
MERGE (employee:Role:Thing {name: 'Employee'})
MERGE (contrator:Role:Thing {name: 'Contractor'})
MERGE (bm:Role:Thing {name: 'Board Member'})
MERGE (student:Role:Thing {name: 'Student'})
MERGE (member:Role:Thing {name: 'Member'})

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
MERGE (sjER1:Membership:Thing {start: 1976, end: 1986})
MERGE ((steve)-[:MEMBERSHIP {start: 123, end:7778}]->(sjER1))
MERGE ((sjER1)-[:MEMBER_OF]->(apple))
MERGE ((sjER1)-[:AS]->(ceo))

// Steve & Apple (return)
MERGE (sjER2:Membership:Thing {start: 1997, end: 2011})
MERGE ((steve)-[:MEMBERSHIP]->(sjER2))
MERGE ((sjER2)-[:MEMBER_OF]->(apple))
MERGE ((sjER2)-[:AS]->(ceo))

// Tim & Apple
MERGE (tcER1:Membership:Thing {start: 1998, title: 'Chief Executive Officer & Director'})
MERGE ((tim)-[:MEMBERSHIP]->(tcER1))
MERGE ((tcER1)-[:MEMBER_OF]->(apple))
MERGE ((tcER1)-[:AS {start: 2011}]->(ceo))
MERGE ((tcER1)-[:AS {start: 1998}]->(coo))

// Marjorie & Pearson
MERGE (msEmpRec1:Membership:Thing {start: 1997, end:2012, title: 'Chief Executive Officer'})
MERGE ((marjorie)-[:MEMBERSHIP]->(msEmpRec1))
MERGE ((msEmpRec1)-[:MEMBER_OF]->(pearson))
MERGE ((msEmpRec1)-[:BOARD_MEMBER_OF]->(pearson))
MERGE ((msEmpRec1)-[:AS]->(ceo))
MERGE ((msEmpRec1)-[:AS]->(bm))

// Marjorie & Twitter
MERGE (msBM1:Membership:Thing {start: 2013, title: 'Diversity Executive'})
MERGE ((marjorie)-[:MEMBERSHIP]->(msBM1))
MERGE ((msBM1)-[:BOARD_MEMBER_OF]->(twitter))
MERGE ((msBM1)-[:AS]->(bm))

// Dan & Kanzi
MERGE (dmEmpRec1:Membership:Thing {start: 2007, title: 'Chief bonobo'})
MERGE ((dgem)-[:MEMBERSHIP]->(dmEmpRec1))
MERGE ((dmEmpRec1)-[:MEMBER_OF]->(kanzi))
MERGE ((dmEmpRec1)-[:AS]->(director))

// Dan & Pearson
MERGE (dmEmpRec2:Membership:Thing {start: 2010, end: 2012, title: 'API Technical Lead'})
MERGE ((dgem)-[:MEMBERSHIP]->(dmEmpRec2))
MERGE ((dmEmpRec2)-[:MEMBER_OF]->(pearson))
MERGE ((dmEmpRec2)-[:AS]->(contrator))

// Dan & FT
MERGE (dmEmpRec3:Membership:Thing {start: 2015, title: 'Senior Developer'})
MERGE ((dgem)-[:MEMBERSHIP]->(dmEmpRec3))
MERGE ((dmEmpRec3)-[:MEMBER_OF]->(ft))
MERGE ((dmEmpRec3)-[:AS]->(employee))

// Carlos & CSL
MERGE (crEmpRec1:Membership:Thing {start: 2002, title: 'Chief Wizard'})
MERGE ((carlos)-[:MEMBERSHIP]->(crEmpRec1))
MERGE ((crEmpRec1)-[:MEMBER_OF]->(cliche))
MERGE ((crEmpRec1)-[:AS]->(director))

// Carlos & FT
MERGE (crEmpRec2:Membership:Thing {start: 2015, title: 'Hacker extraordinaire'})
MERGE ((carlos)-[:MEMBERSHIP]->(crEmpRec2))
MERGE ((crEmpRec2)-[:MEMBER_OF]->(ft))
MERGE ((crEmpRec2)-[:AS]->(contractor))

// Questions
// Who has or had the role of COO with Apple
MATCH (o1:Organisation{name:'Apple'})-[:MEMBER_OF]-(m1:Membership)-[:AS]-(r1:Role{name:'COO'})
MATCH (r2:Role{name:'COO'})-[:AS]-(m2:Membership)-[:MEMBERSHIP]-(p2:Person)
WHERE m1 = m2
RETURN o1, m1, r2, p2;
