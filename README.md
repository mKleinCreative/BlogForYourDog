# BlogForYourDog

## Prerequisites

### Docker

1. [Docker](https://docker.com)
1. [docker-compose](https://docs.docker.com/compose/install/#prerequisites)
1. watchman
    ```bash
    brew update
    brew install watchman
    ```

## Installation

### Docker

1. Clone the repo: `git clone git@github.com:mKleinCreative/BlogForYourDog`
1. Navigate to the repo directory created in the last step: `cd BlogForYourDog`
1. Create a `.env` file by using `.env.sample` as a boilerplate: `cp .env.sample .env`
1. Edit the new `.env` file and augment the variables to match your local environment.
1. Create a `backend/core/local_settings.py` file by using `backend/core/local_settings.py.sample` as a boilerplate: `cp backend/core/local_settings.py.sample backend/core/local_settings.py` Edit the new `backend/core/local_settings.py` file and augment the variables to match your local environment.
1. Execute `docker-compose up`.
1. Wait until the build finishes. You'll see this message: `dogblog_frontend | Compiled successfully!`
1. Open a new terminal tab and run `docker exec -it dogblog_backend /bin/bash`.
1. Once logged into the `dogblog_backend` Docker container, execute `python manage.py createsuperuser` and follow the prompts to create an Admin user for the Django Admin interface.
1. Exit the Docker `bash` shell by typing `exit`.
1. Finally...
    * **Open your browser and enter**:
        * [http://localhost:8000](http://localhost:8000) to access the **frontend**.
        * [http://localhost:8000/admin](http://localhost:8000/admin) to access the **Django Admin interface**.
        * [http://localhost:8000/api](http://localhost:8000/api) to access the **graphical, interactive Django REST Framework API interface** describing available API endpoints.
    * **Use cURL** in a new Terminal tab to test the backend Django API via DRF token authentication:
        ```bash
        $ curl -X POST -d "username=SUPERUSER_USERNAME&password=SUPERUSER_PASSWORD" http://localhost:8000/api/v1/auth/`
        {"token":"a66bfc378fc443f33953c99c3d852bace48094c2"}%
        ```
1. Write your fancy new Django + React app!
1. Run `docker-compose down` to safely shut down all containers for this project.

## Troubleshooting

* Mac users may need to **increase the max open files limit** in macOS by executing the following commands:

```bash
sudo launchctl limit maxfiles unlimited unlimited
sudo launchctl limit maxfiles
ulimit -n 1024
```

* Create a clean Docker build with verbose debugging output:

```bash
docker-compose --verbose up --build --abort-on-container-exit --force-recreate
```

For additonal information regarding `ulimit`, please visit this [Gist](https://gist.github.com/vgoma/4d33c2937447afd2fb9ae2ef781761f9).

# Debugging the Django Backend via VSCode Remote Debugger

Add the following `launch.json` entry:

```json
  {
      "name": "BlogForYourDog Django App",
      "type": "python",
      "request": "attach",
      "localRoot": "${workspaceRoot}",
      "remoteRoot": "/code/backend",
      "port": 8000,
      "secret": "debugger-local-secret",
      "host": "localhost"
  }
```
