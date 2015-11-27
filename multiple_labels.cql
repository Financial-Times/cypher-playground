// Looks like you cannot link to nodes from properties of relationships
// CREATE
//  (kanzi:Company:Organisation:Thing {name: 'Kanzi Limited'})
//  (dgem:Person:Thing {name: 'Dan Murphy'})
//  (dir:Role:Thing {name: 'Director'})
//  ((dgem)-[:EMPLOYEE_OF {start: 2007, role:(dir) }]->(kanzi))

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
MERGE ((ft)-[:DIVISION_OF]->(pearson))
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
MERGE (sjER1:Employment:Membership:Thing {start: 1976, end: 1986})
MERGE ((steve)-[:EMPLOYMENT {start: 123, end:7778}]->(sjER1))
MERGE ((sjER1)-[:EMPLOYEE_OF]->(apple))
MERGE ((sjER1)-[:AS]->(ceo))

// Steve & Apple (return)
MERGE (sjER2:Employment:Membership:Thing {start: 1997, end: 2011})
MERGE ((steve)-[:EMPLOYMENT]->(sjER2))
MERGE ((sjER2)-[:EMPLOYEE_OF]->(apple))
MERGE ((sjER2)-[:AS]->(ceo))

// Tim & Apple
MERGE (tcER1:Employment:Membership:Thing {start: 1998, title: 'Chief Executive Officer & Director'})
MERGE ((tim)-[:EMPLOYMENT]->(tcER1))
MERGE ((tcER1)-[:EMPLOYEE_OF]->(apple))
MERGE ((tcER1)-[:AS {start: 2011}]->(ceo))
MERGE ((tcER1)-[:AS {start: 1998}]->(coo))

// Marjorie & Pearson
MERGE (msEmpRec1:Employment:Membership:Thing {start: 1997, end:2012, title: 'Chief Executive Officer'})
MERGE ((marjorie)-[:EMPLOYEMENT]->(msEmpRec1))
MERGE ((msEmpRec1)-[:EMPLOYEE_OF]->(pearson))
MERGE ((msEmpRec1)-[:BOARD_MEMBER_OF]->(pearson))
MERGE ((msEmpRec1)-[:AS]->(ceo))
MERGE ((msEmpRec1)-[:AS]->(bm))

// Marjorie & Twitter
MERGE (msBM1:Membership:Thing {start: 2013, title: 'Diversity Executive'})
MERGE ((marjorie)-[:MEMBERSHIP]->(msBM1))
MERGE ((msBM1)-[:BOARD_MEMBER_OF]->(twitter))
MERGE ((msBM1)-[:AS]->(bm))

// Dan & Kanzi
MERGE (dmEmpRec1:Employment:Membership:Thing {start: 2007, title: 'Chief bonobo'})
MERGE ((dgem)-[:EMPLOYMENT]->(dmEmpRec1))
MERGE ((dmEmpRec1)-[:EMPLOYEE_OF]->(kanzi))
MERGE ((dmEmpRec1)-[:AS]->(director))

// Dan & Pearson
MERGE (dmEmpRec2:Employment:Membership:Thing {start: 2010, end: 2012, title: 'API Technical Lead'})
MERGE ((dgem)-[:EMPLOYMENT]->(dmEmpRec2))
MERGE ((dmEmpRec2)-[:SUPPLIER_TO]->(pearson))
MERGE ((dmEmpRec2)-[:AS]->(contrator))

// Dan & FT
MERGE (dmEmpRec3:Employment:Membership:Thing {start: 2015, title: 'Senior Developer'})
MERGE ((dgem)-[:EMPLOYMENT]->(dmEmpRec3))
MERGE ((dmEmpRec3)-[:EMPLOYEE_OF]->(ft))
MERGE ((dmEmpRec3)-[:AS]->(employee))

// Carlos & CSL
MERGE (crEmpRec1:Employment:Membership:Thing {start: 2002, title: 'Chief Wizard'})
MERGE ((carlos)-[:EMPLOYMENT]->(crEmpRec1))
MERGE ((crEmpRec1)-[:EMPLOYEE_OF]->(cliche))
MERGE ((crEmpRec1)-[:AS]->(director))

// Carlos & FT
MERGE (crEmpRec2:Employment:Membership:Thing {start: 2015, title: 'Hacker extraordinaire'})
MERGE ((carlos)-[:EMPLOYMENT]->(crEmpRec2))
MERGE ((crEmpRec2)-[:SUPPLIER_TO]->(ft))
MERGE ((crEmpRec2)-[:AS]->(contractor))
