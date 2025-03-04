FROM nodejs:latest

ADD ./package.json package.json
RUN npm install

EXPOSE 7000 7000

# ADD ./node_modules node_modules
ADD ./lib lib
ADD ./views views
ADD ./app.js app.js
ADD ./config.js config.js
ADD ./idp-public-cert.pem idp-public-cert.pem
ADD ./idp-private-key.pem idp-private-key.pem
ADD ./public public

ENTRYPOINT [ "node",  "app.js", "--acs", "https://sso-user1-keycloak.apps.cluster-wb44z.wb44z.sandbox2370.opentlc.com/auth/realms/main/broker/saml/endpoint", "--aud", "https://sso-user1-keycloak.apps.cluster-wb44z.wb44z.sandbox2370.opentlc.com/auth/realms/main", "--host", "0.0.0.0"]
