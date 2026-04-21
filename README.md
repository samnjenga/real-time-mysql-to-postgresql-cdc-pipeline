# Real-Time MySQL to PostgreSQL CDC Pipeline

This project implements a real-time Change Data Capture (CDC) pipeline that streams inserts, updates, and deletes from MySQL to PostgreSQL.

It uses Debezium and Kafka Connect to capture changes from MySQL binlogs and reliably propagate them to PostgreSQL, enabling low-latency data replication for analytics, reporting, and downstream systems.

Supports initial snapshot, incremental updates, and delete propagation.


This repository provides a locally runnable CDC stack for replicating data from MySQL to PostgreSQL.

In production, the same architecture is typically deployed across multiple hosts or Kubernetes, with clustered Kafka, distributed Kafka Connect workers, highly available PostgreSQL, and monitoring.

## What This Solves

Many systems rely on operational databases like MySQL for day-to-day transactions, but using the same database for analytics, reporting, or downstream applications creates performance bottlenecks and scalability issues.

This pipeline solves that by enabling near real-time replication of data from MySQL to PostgreSQL.

### Key problems addressed:

- **Offloading analytics from production databases**  
  Prevents heavy reporting queries from impacting transactional workloads.

- **Near real-time data availability**  
  Keeps downstream systems (dashboards, APIs, AI models) updated within seconds.

- **Reliable data synchronization**  
  Captures inserts, updates, and deletes directly from MySQL binlogs, ensuring data consistency.

- **Separation of concerns**  
  Allows MySQL to remain optimized for transactions while PostgreSQL serves analytics and reporting needs.

- **Foundation for real-time data architectures**  
  Enables event-driven systems, streaming pipelines, and low-latency applications.

### Typical use cases:

- Real-time dashboards and monitoring systems  
- Replicating data to analytics or reporting databases  
- Feeding machine learning or AI pipelines  
- Decoupling microservices from core transactional databases  
