# Incremental-Data-Ingestion

A customer approaches you and wants to have this public dataset (https://data.medicare.gov/Home-Health-Compare/Home-Health-Care-Agencies/6jpm-sxkc) periodically uploaded into Hive and indexed into Elasticsearch, so he can run further analytics on top of it.


What you need to do:

1.       Use http://hortonworks.com/products/sandbox/
2.       Use https://www.elastic.co/products/elasticsearch or whole ELK stack

3.       Set up some way of scheduling ingest

4.       Provide automation for the ingest itself (using yarn queue)

5.       As result the customer wants to

	a) see simple query on Hive showing date histogram(e.g. daily) with number of new entries
	
	b) query elastic index on analyzed as well as non analyzed fields
	
6.       Add new user with the admin permissions and ban connecting to server as root, only admins can use sudo

7.       Allow access to ingested data only for “hive-ingest-users” group

8.       Show us cluster performance stats

9.       (OPTIONAL) Provide way for doing transformation after the ingest into Hive

10.      (OPTIONAL) Provide way for data retention – i.e. how to move older data to lower redundancy(cheaper) storage and eventually delete them
