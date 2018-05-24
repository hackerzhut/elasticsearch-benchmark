# elasticsearch-benchmark

Benchmarking Elastic Search Aggregation Query with [rally](https://github.com/elastic/rally)


## Build Docker Image

```bash
docker build -t image_name .
```

## Run Rally

```bash
docker run --ulimit nofile=1000000:1000000 -it -e --target-hosts='https://10.39.34.185/' image_name:latest
```
