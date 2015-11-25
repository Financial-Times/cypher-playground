// Delete Everything
MATCH (n) DETACH DELETE n;


// Create Tim
CREATE (p:Person {uuid:'8138ca3f-b80d-3ef8-ad59-6a9b6ea5f15e', name: 'Timothy Donald Cook'})
CREATE (o:Organisation {
  uuid : '2384fa7a-d514-3d6a-a0ea-3a711f66d0d8',
  legalName : 'Apple Inc.',
  subTypes: ['Company', 'PublicCompany'],
  properName : 'Apple, Inc.',
  shortName : 'Apple'
})
CREATE (m:Membership {uuid:'3f1822dc-07e3-3777-84a6-5e155b914980'})
CREATE (r:Role {uuid:'b4d96423-d877-3e54-91bd-22f7a74ac388', title: 'CIO'})
CREATE ((p)-[:Employment]->(m))
CREATE ((o)-[:Employees]->(m))
CREATE ((m)-[:Role]->(r));


CREATE (pc:PublicCompany {
    uuid : '2384fa7a-d514-3d6a-a0ea-3a711f66d0d8',
    legalName : 'Apple Inc.',
    properName : 'Apple, Inc.',
    shortName : 'Apple'
})

CREATE (())
