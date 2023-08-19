# Elk

![](https://img.shields.io/badge/content-elk-yellow)
![](https://img.shields.io/badge/version-0.0.1-black)

```Elasticsearch``` (aka ```elk```) is a real-time distributed and open source full-text search and analytics engine.
Elasticsearch is an open source developed in Java and used by many big organizations around the world.
It is licensed under the Apache license version 2.0.
[Install](./download) elk on your system.

## Why elk?

Elasticsearch allows you to store, search, and analyze huge volumes of data quickly and in near real-time and give back answers in milliseconds. 
It's able to achieve fast search responses because instead of searching the text directly, it searches an index.
Elasticsearch is perfect for storing unstructured data, then retrieving data when needed with blazing speed via its search engine
capabilities built on Apache Lucene. By that means, Elasticsearch is perfect for these types of systems: Business Data Analytics. Security and Fraud Detection.

## Kibana

Kibana is your window into the Elastic Stack. Specifically, it's a browser-based analytics and search dashboard for Elasticsearch.

## Beats

The Beats are lightweight data shippers, written in Go, that you install on your servers to capture all sorts of operational data
(think of logs, metrics, or network packet data). The Beats send the operational data to Elasticsearch, either directly or via Logstash,
so it can be visualized with Kibana.

## Logstash

Logstash is part of the Elastic Stack along with Beats, Elasticsearch and Kibana. Logstash is a server-side data processing pipeline
that ingests data from a multitude of sources simultaneously, transforms it, and then sends it to your favorite "stash."
(Ours is Elasticsearch, naturally.)

## resources

- [www.tutorialspoint.com](https://www.tutorialspoint.com/elasticsearch/index.htm)
- [logz.io/elk](https://logz.io/blog/elasticsearch-tutorial/)
- [elk-docker.io](https://elk-docker.readthedocs.io/)
- [stackoverflow.com/how-to-export-logs](https://stackoverflow.com/questions/59622799/how-to-gather-logs-to-elasticsearch)
