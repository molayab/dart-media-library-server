# What is this project about?
This is the fisrt approach to a modular server arch using Dart as language and Jaguar Framework as the main HTTP server engine. It will be used on a futher multimedia-related project.

![Server Overview](docs/diagrams/res/server_overview.mmd.png?raw=true "Server Overview")

## API Definition

#### Library
The library namespace encapsulates all multimedia provided features.

`/library` returns a multimedia library quick overview.

##### Songs
The songs namespace defines songs CRUD.

`/library/songs/all` 
returns all the songs.

`/library/songs/:id` 
returns the song with a given id.

## How to run 

In order to run the server, we are using Docker to execute the dart application on a separate container. By default we are exposing the port 8080 for the application, check `run.sh` for configuration. 

#### Usage 

```bash
[sudo] ./run.sh
```
Use `sudo` as needed, however, we do not recommend use Docker in this way, instead add a Docker group.
