# On premise SSO with Azure, Docker, and Shibboleth

Uses the Unicon Shibboleth SP docker image:

[https://hub.docker.com/r/unicon/shibboleth-sp](https://github.com/Unicon/shibboleth-sp-dockerized).

1. Follow setup instructions under [docs/README.md](./docs/README.md)
2. Call `docker-compose build` and then `docker-compose up` (or `docker-compose up -d` to run as a daemon).
3. Browse to `https://idptestbed/` (after setting up an `etc/hosts` file entry pointing to your Docker Host IP)
4. `ctrl+c` then `docker-compose rm` cleans everything up to try again.
