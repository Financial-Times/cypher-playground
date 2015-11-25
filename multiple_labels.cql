// Looks like you cannot link to nodes from properties of relationships
// CREATE
//  (kanzi:Company:Organisation:Thing {name: 'Kanzi Limited'}),
//  (dgem:Person:Thing {name: 'Dan Murphy'}),
//  (dir:Role:Thing {name: 'Director'}),
//  ((dgem)-[:EMPLOYEE_OF {start: 2007, role:(dir) }]->(kanzi))

// Some Roles
CREATE
  (coo:Role:Concept:Thing {name: 'COO'}),
  (ceo:Role:Concept:Thing {name: 'CEO'}),
  (cto:Role:Concept:Thing {name: 'CTO'}),
  (cio:Role:Concept:Thing {name: 'CIO'}),
  (cfo:Role:Concept:Thing {name: 'CFO'}),
  (director:Concept:Role:Thing {name: 'Director'}),
  (employee:Concept:Role:Thing {name: 'Employee'}),
  (contrator:Concept:Role:Thing {name: 'Contractor'}),
  (bm:Role:Concept:Thing {name: 'Board Member'}),
  (student:Role:Concept:Thing {name: 'Student'}),
  (member:Role:Concept:Thing {name: 'Member'}),

// Some Companies
  (apple:PublicCompany:Company:Organisation:Thing {name: 'Apple'}),
  (pearson:PublicCompany:Company:Organisation:Thing {name: 'Pearson PLC'}),
  (ft:Company:Organisation:Thing {name: 'Financial Times'}),
  (twitter:PublicCompany:Company:Organisation:Thing {name: 'Twitter Inc'}),
  ((ft)-[:DIVISION_OF]->(pearson)),
  (kanzi:PrivateCompany:Company:Organisation:Thing {name: 'Kanzi Limited'}),
  (cliche:PrivateCompany:Company:Organisation:Thing {name: 'Cliche Solutions Ltd'}),

// Some People
  (dgem:Person:Thing {name: 'Dan Murphy'}),
  (carlos:Person:Thing {name: 'Carlos Roman'}),
  (tim:Person:Thing {name: 'Tim Cook'}),
  (john:Person:Thing {name: 'John Fallon'}),
  (marjorie:Person:Thing {name: 'Marjorie Scardino'}),

// Memberships

// Marjorie & Pearson
  (msEmpRec1:Employment:Membership:Thing {start: 1997, end:2012, title: 'Chief Executive Officer'}),
  ((marjorie)-[:EMPLOYEMENT]->(msEmpRec1)),
  ((msEmpRec1)-[:EMPLOYEE_OF]->(pearson)),
  ((msEmpRec1)-[:BOARD_MEMBER_OF]->(pearson)),
  ((msEmpRec1)-[:AS]->(ceo)),
  ((msEmpRec1)-[:AS]->(bm)),

// Marjorie & Twitter
  (msBM1:Membership:Thing {start: 2013, title: 'Diversity Executive'}),
  ((marjorie)-[:MEMBERSHIP]->(msBM1)),
  ((msBM1)-[:BOARD_MEMBER_OF]->(twitter)),
  ((msBM1)-[:AS]->(bm)),

// Dan & Kanzi
  (dmEmpRec1:Employment:Membership:Thing {start: 2007, title: 'Chief bonobo'}),
  ((dgem)-[:EMPLOYMENT]->(dmEmpRec1)),
  ((dmEmpRec1)-[:EMPLOYEE_OF]->(kanzi)),
  ((dmEmpRec1)-[:AS]->(director)),

// Dan & Pearson
  (dmEmpRec2:Employment:Membership:Thing {start: 2010, end: 2012, title: 'API Technical Lead'}),
  ((dgem)-[:EMPLOYMENT]->(dmEmpRec2)),
  ((dmEmpRec2)-[:SUPPLIER_TO]->(pearson)),
  ((dmEmpRec2)-[:AS]->(contrator)),

// Dan & FT
  (dmEmpRec3:Employment:Membership:Thing {start: 2015, title: 'Senior Developer'}),
  ((dgem)-[:EMPLOYMENT]->(dmEmpRec3)),
  ((dmEmpRec3)-[:SUPPLIER_TO]->(ft)),
  ((dmEmpRec3)-[:AS]->(employee)),

// Carlos & CSL
  (crEmpRec1:Employment:Membership:Thing {start: 2002, title: 'Chief Wizard'}),
  ((carlos)-[:EMPLOYMENT]->(crEmpRec1)),
  ((crEmpRec1)-[:EMPLOYEE_OF]->(cliche)),
  ((crEmpRec1)-[:AS]->(director)),

// Carlos & FT
  (crEmpRec2:Employment:Membership:Thing {start: 2015, title: 'Hacker extraordinaire'}),
  ((carlos)-[:EMPLOYMENT]->(crEmpRec2)),
  ((crEmpRec2)-[:SUPPLIER_TO](ft)),
  ((crEmpRec2)-[:AS]->(contractor));
