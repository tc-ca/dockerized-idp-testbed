# On premise SSO with Azure, Docker, and Shibboleth

Uses the Unicon Shibboleth SP docker image:

[https://hub.docker.com/r/unicon/shibboleth-sp](https://github.com/Unicon/shibboleth-sp-dockerized).

## Goal

We needed a way to have our application proxied such that anyone who accessed certain resources would be guaranteed to be authenticated.

Using Shibboleth as a Service Provider, this example repo has the `https://idptestbed/protected` url which will force users to a Microsoft sign in page before allowing them access.

This approach gives many benefits:

- Allow some pages to remain open

- Allow forcing MFA via Azure when accessing restricted content

- Read attributes of users who are accessing content (email address, roles, etc)

- Control access via Azure configuration or via internal logic using released unique identifier for current session user

- Run the entire application on-premise, Azure doesn't need to be able to talk to the service provider

- Configurable to support signons other than Azure AD for your app

## Steps

1. Follow setup instructions under [docs/README.md](./docs/README.md)
2. Call `docker-compose build` and then `docker-compose up` (or `docker-compose up -d` to run as a daemon).
3. Browse to `https://idptestbed/` (after setting up an `etc/hosts` file entry pointing to your Docker Host IP)
4. `ctrl+c` then `docker-compose rm` cleans everything up to try again.
