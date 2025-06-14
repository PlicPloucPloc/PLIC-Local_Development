 How to run PLIC locally
==============
* Use `./deploy.sh` to start the local environment. -> You will be prompted to enter the API key for resend.
* Use `./stop.sh` to stop the local environment.

## Endpoints

* golang-POC: localhost:8080
* bun-POC: localhost:3000
* user-service: localhost:3001
* like-service: localhost:3002
* apt-service: localhost:3003
* jaeger: localhost:16686
* supabase: localhost:8000
* neo4j: localhost:7474, localhost:7687
> To see the logs from bun you need to use the `docker logs` command to get the url
> To access Swagger for bun apps just go to <url>/swagger. Acknowledge that some endpoints may need header Authorization: Bearer <token> to work properly.

## Credentials

**Credentials supabase:**
* Username: `supabase`
* Password : `this_password_is_insecure_and_should_be_updated`

**Credentials neo4j:**
* Username: `neo4j`
* Password : `neo4j` (When asked to change the password, use `password`. If you used another one change it in the .env file but don't commit it)
