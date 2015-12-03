# Cypher modeling spike
Different approaches to modeling using cypher.

## Models
Most complexity seems to be around how we model the relationships between the people we know of, the organisations they are associated with and  and their Currently three approaches identified, in order of perceived complexity.
1. `:MEMBER` relationship using a `type` property to convey the role, e.g. `type:'CIO'`
1. Named relationships, e.g. `:CIO`, `:CFO` representing roles and more generic `:MEMBER`
1. Memberships as Nodes, following the "Model facts as node" principle

## Questions to ask the model

### Current Public APIs
To achieve to get parity, extracted from the [API Endpoints](https://docs.google.com/document/d/13RuSTXt1kMR8EAXaf94E9MRQPfvjAgrJlbpvItED7Cg/) document
* Organisation Read
* People Read
* Enriched Content Read
* Concordances
* Content-by-Concept
* Semantic Read
  * Retrieve Content
  * Retrieve Things
  * Retrieve list of publish events
* Things

## Sample Queries

### Organisations
```
MATCH (po:Organisation)<-[:SUB_ORG_OF]-(o:Organisation{prefLabel:'Documentum, Inc.'})<-[:SUB_ORG_OF]-(so:Organisation) return po,o, collect (so) as subsidaries;
```
