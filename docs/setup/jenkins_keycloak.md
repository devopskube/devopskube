# Jenkins SSO

To provide SSO Services in our environemnt, we do use [Keycloak](http://www.keycloak.org/) as the central service. To use this in [Jenkins](http://www.jenkins.io/), we do use a slightly adopted version of the [OpenId Connect Plugin](https://github.com/jenkinsci/oic-auth-plugin) (Note the Pull-Request, which is basically just for Testing purposes to the original version of the plugin).

For this to work, a new client has to be created in the Keycloak System, and a couple of endpoints have to be configured in the Jenkins Security Settings.

## Hints

To retrieve the Keycloak Endpoints, you can use the Url https://KEYCLOAK_SERVER/auth/realms/<REALMNAME>/.well-known/openid-configuration.
