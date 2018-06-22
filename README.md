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
1. Open browser and access `http://localhost:8000` to access the frontend.
1. Use cURL in a new Terminal tab to test the backend Django API via DRF token authentication:
    ```bash
    $ curl -X POST -d "username=SUPERUSER_USERNAME&password=SUPERUSER_PASSWORD" http://localhost:8000/api/v1/auth/`
    {"token":"a66bfc378fc443f33953c99c3d852bace48094c2"}%
    ```
1. Write your fancy new Django + React app!

### Troubleshooting

* Mac users may need to **increase the max open files limit** in macOS by executing the following commands:

```bash
sudo launchctl limit maxfiles unlimited unlimited
sudo launchctl limit maxfiles
ulimit -n 1024
```

For additonal information regarding `ulimit`, please visit this [Gist](https://gist.github.com/vgoma/4d33c2937447afd2fb9ae2ef781761f9).

# Debugging Django via VSCode Remote Debugger

Add the following `launch.json` entry:

```json
  {
      "name": "BlogForYourDog Django App",
      "type": "python",
      "request": "attach",
      "localRoot": "${workspaceRoot}",
      "remoteRoot": "/code/backend",
      "port": 8010,
      "secret": "debugger-local-secret",
      "host": "localhost"
  }
```
