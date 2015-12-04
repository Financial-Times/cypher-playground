
# Experiments in Neo4J modeling


# How to run on Linux
Execute a series of commands via:
`neo4j-shell -c <  path-to-cypher-query-file.cql`

Use the UI to get swinging balls:
`neo4j start` (installed via Homebrew)
[Browse Local Neo4j]{http://localhost:7474/browser/}


## Links
[Neo4J modeling guide]{http://neo4j.com/developer/guide-data-modeling/}
[Neo4J Cypher Syntax]{http://neo4j.com/docs/stable/cypher-query-lang.html}
[neo4j GraphGists Project]{http://gist.neo4j.org/}
[Graph Gist Wiki]{https://github.com/neo4j-contrib/graphgist/wiki}


## Stuff about types and
[List of value types](http://neo4j.com/docs/stable/property-values-detailed.html)
[Dates are not supported - use long or strings](http://stackoverflow.com/questions/21643896/neo4j-date-data-types)
[You can have multiple relationships of the same name](http://stackoverflow.com/questions/7601346/multiple-relationships-of-the-same-type-but-with-different-properties-between-th)
Do we need Thing? (all nodes are things)
Concepts - Roles work, but what about organisations

## Sample Data UUIDs
### People
* Steve Job - `cb36028e-7a87-3648-b8e4-399e331bbe98`
* Tim Cook - `8138ca3f-b80d-3ef8-ad59-6a9b6ea5f15e`
* Alan Sugar - `3fb511e2-d116-3eca-88aa-9196ec84d93d`
* Richard Branson - `65e6575d-6a5d-34b9-b0a9-1d87e4c23f8c`
* Martha Lane Fox - `ad60f5b2-4306-349d-92d8-cf9d9572a6f6`
* Ronald Willis - `143ba45c-2fb3-35bc-b227-a6ed80b5c517`

### Companies and organisations
* EMC Corp - `2e9579f5-37c6-3b2f-859b-0865ab5d6867`
* Documentum Inc _(sub of EMC)_ - `cedbfa34-b8ec-3bee-8304-e074b53021e8`
* Amstrad Ltd - `3fb511e2-d116-3eca-88aa-9196ec84d93d`
* Apple Inc. - `2384fa7a-d514-3d6a-a0ea-3a711f66d0d8`

### Transformers
* Memberships: http://ftaps50665-law1a-eu-t.osb.ft.com/transformers/memberships/
* Roles: http://ftaps50665-law1a-eu-t.osb.ft.com/transformers/memberships/
* People: http://ftaps35629-law1a-eu-t.osb.ft.com/transformers/people/
* Organisations: http://ftaps39403-law1a-eu-t/transformers/organisations/

### Read APIs
* Membership:
* People: http://ftaps30270-law1a-eu-t/people/
* Organisation: http://ftaps30276-law1a-eu-t/organisations/
