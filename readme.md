# NGINX QUICKWIT POC

I just wanted to test the ease of moving my nginx log to a quickwit instance that is hooked up to grafana.

To get start we need to make sure that Docker :whale: is installed...
Once we have docker installed we should be able to spin up all the containers with docker compose:
```
docker-compose up --build
```


After the containers are spun up, we need to create the quickwit index. Here is a basic `curl` command for that:
```
curl --location --request POST 'http://localhost:7280/api/v1/indexes' \
--header 'Content-Type: application/yaml' \
--data-raw 'version: 0.7
index_id: test-schemaless
doc_mapping:
  mode: dynamic
  field_mappings:
    - name: timestamp
      type: datetime
      input_formats:
        - unix_timestamp
      output_format: unix_timestamp_nanos
      fast_precision: milliseconds
      fast: true
  timestamp_field: timestamp
indexing_settings:
  commit_timeout_secs: 30
retention:
  period: 5 days
  schedule: daily'
  ```


Now that the index is create run the `random.sh` script to start send `http` requests to nginx at a random interval



Data should be flowing into your quickwit instance. All that is left is creating the data-source in the grafana.

Please follow quickwit's official [instructions](https://quickwit.io/docs/get-started/tutorials/trace-analytics-with-grafana) for that step

Enjoy!

