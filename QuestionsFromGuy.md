## Person page

* What is their full name / short name

* What are their current positions / memberships?
** the title of that position (free text)
** the responsibilities of that position (role - a controlled vocabulary)?
** the organisation, obviously
** dates
* If they have more than one current position, which membership is the most ‘representative’? e.g. Tim Cook is known for his position at Apple and NOT at Nike
** we could do this by identifying most annotated membership (we can annotate this ;-) cos I did)
** we could do this by role (CEO > non-exec director)
* What is their employment history?
* Who do they know?
** assume they would know all members of the board of the same company (when dates overlap)
* Plenty more other queries using other data but this suffices



## Using current import:
* Names
`match (p:Person) where (p.prefLabel="Steven Jobs") return p.prefLabel;`
`match (p:Person) where (p.prefLabel="Steven Jobs") return p.name;`
* Current positions
Timothy Donald Cook's Job
`MATCH (p:Person{uuid:'8138ca3f-b80d-3ef8-ad59-6a9b6ea5f15e'})-[mr:MEMBERSHIP]->(m:Membership)<-[em:EMPLOYEE]-(o:Organisation) WHERE (m.terminationDate="") RETURN p.uuid, mr, m, em, o.prefLabel;
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| p.uuid                                 | mr                     | m                                                                                                                                                                                          | em                   | o.prefLabel   |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| "8138ca3f-b80d-3ef8-ad59-6a9b6ea5f15e" | :MEMBERSHIP[1371918]{} | Node[826201]{inceptionDate:"1998-03-01T00:00:00.000Z",fsIdentifier:"147646",prefLabel:"Chief Executive Officer & Director",terminationDate:"",uuid:"3f1822dc-07e3-3777-84a6-5e155b914980"} | :EMPLOYEE[1371919]{} | "Apple, Inc." |
+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+`
** FreeText
`MATCH (p:Person{uuid:'8138ca3f-b80d-3ef8-ad59-6a9b6ea5f15e'})-[mr:MEMBERSHIP]->(m:Membership)<-[em:EMPLOYEE]-(o:Organisation) WHERE (m.terminationDate="") return m.prefLabel;`
** Controlled vocabulary (surely can be simplified)
`neo4j-sh (?)$ MATCH (p1:Person{uuid:'8138ca3f-b80d-3ef8-ad59-6a9b6ea5f15e'})-[:MEMBERSHIP]->(m1:Membership)<-[:EMPLOYEE]-(o:Organisation{uuid:'2384fa7a-d514-3d6a-a0ea-3a711f66d0d8'})
MATCH (p2:Person{uuid:'8138ca3f-b80d-3ef8-ad59-6a9b6ea5f15e'})-[:MEMBERSHIP]->(m2:Membership)-[rr:ROLE]-(r:Role)
WHERE m1=m2 and rr.terminationDate="0001-01-01T00:00:00Z"
return r.prefLabel;
`
** Organisation

* More than one position
Current positions doesn't show Nike.... In fact I can't find any relationships with NIKE for Tim (Data load issue ?)
** Would probably require relationships between Roles controlled vocabulary (perhaps via RoleGroups node)
