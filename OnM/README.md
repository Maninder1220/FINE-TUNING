# Observability and Monitoring Stack

# SHIPPER - Collect | Trasnform | Transport   [ DATA COLLECTION ]
- Shipper plays a very important role in logstash, it collect, transform and transport data
- It act as intermediaries that collect, process, and transport data from various sources to centralized systems for analysis.

# LOGSTASH - Ingest | Process | Output        [ DATA PROCESSING ]
Home Dir of LogStash : /usr/share/logstash
Config files in      : /etc/logstash

LogStash is a free Open Server Side data processing pipeline, which ingest data from a multitude of sources.

- LogStash pipeline has two required element INPUT and OUTPUT and optional FILTER
- LogStash Dynamically ingest, transforms and ships your data
- It is Data Processing Pipeline
- IT has 3 Important Component INPUT, FILTER and OUTPUT

# Input
  - Input component defines where Logstash should look for the data it needs to process.
  - Log stash Pulls data from any data sources using Input Plugins
  # Common Inputs Plugins
    - file: Reads from files on the filesystem.
    - beats: Receives events from Beats data shippers.
    - http: Receives HTTP requests.
    - jdbc: Fetches data from databases using JDBC.
    - kafka: Reads from a Kafka topic.
    - tcp/udp: Receives events over TCP or UDP.
 
# Filter
  - 

# Output


#