# Incremental-Data-Ingestion
A customer approaches you and wants to have this public dataset (https://data.medicare.gov/Home-Health-Compare/Home-Health-Care-Agencies/6jpm-sxkc) periodically uploaded into Hive and indexed into Elasticsearch, so he can run further analytics on top of it.


What you need to do:
 - Use http://hortonworks.com/products/sandbox/
 - Use https://www.elastic.co/products/elasticsearch or whole ELK stack
 - Set up some way of scheduling ingest
 - Provide automation for the ingest itself (using yarn queue)
 - As result the customer wants to
 
    1) see simple query on Hive showing date histogram(e.g. daily) with number of new entries 
    2) query elastic index on analyzed as well as non analyzed fields

 - Add new user with the admin permissions and ban connecting to server as root, only admins can use sudo
 - Allow access to ingested data only for “hive-ingest-users” group
 - Show us cluster performance stats
 
 #### OPTIONAL
 - Provide way for doing transformation after the ingest into Hive
 - Provide way for data retention – i.e. how to move older data to lower redundancy(cheaper) storage and eventually delete them


 #### Solution Screenshots
 
 ##### Data Ingestion - Azkaban - Scheduling Jobs
 
![Azkaban Project / Flows](https://github.com/shahrukhkhan489/Incremental-Data-Ingestion/tree/master/Pics/Azkaban-Project.png) 

![Executing Ingestion Process](https://github.com/shahrukhkhan489/Incremental-Data-Ingestion/tree/master/Pics/parallel-execution.png) 
 
![Time Stastics - Ingestion Process](https://github.com/shahrukhkhan489/Incremental-Data-Ingestion/tree/master/Pics/parallel-execution-time-taken.png) 

 ##### Elasticsearch - Kibana
 
![ElasticSearch Table](https://github.com/shahrukhkhan489/Incremental-Data-Ingestion/tree/master/Pics/Kibana-ElasticSearch.png) 

 ##### Splunk - Records Logs

![Splunk](https://github.com/shahrukhkhan489/Incremental-Data-Ingestion/tree/master/Pics/Splunk-Records-Count.png) 

 ##### Cluster Performance Metrics
 
 ![Ambari - Cluster Performance](https://github.com/shahrukhkhan489/Incremental-Data-Ingestion/tree/master/Pics/Cluster-Performance-Ambari.png) 
 
 ![Ambari - HDFS Performance](https://github.com/shahrukhkhan489/Incremental-Data-Ingestion/tree/master/Pics/Cluster-Performance-HDFS.png) 
 
 ![Ambari - YARN Performance](https://github.com/shahrukhkhan489/Incremental-Data-Ingestion/tree/master/Pics/Cluster-Performance-Yarn.png) 