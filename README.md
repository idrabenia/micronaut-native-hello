## Micronaut Hello Project

### Build application

*There are required Java 11 to be installed!*

Windows:
```bash
gradlew clean build
```

Linux / MacOS:
```bash
./gradlew clean build
```

### Run the application

```bash
# Docker routine
docker build . -t micronaut-hello --no-cache -m 16g
docker run -p 8080:8080  micronaut-hello:latest
```

_Ensure you run graalvm native build against relevant Java version_