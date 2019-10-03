To run the project it will require to execute next commands 

```bash
docker build . -t micronaut-hello --no-cache -m 16g
docker run -p 8080:8080  micronaut-hello:latest
```
