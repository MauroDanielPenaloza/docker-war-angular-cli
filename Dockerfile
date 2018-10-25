FROM johnpapa/angular-cli as ang_step
COPY ./samm-app /usr/src/static
WORKDIR /usr/src/static
RUN npm run build

FROM maven:3-jdk-8-alpine
WORKDIR /usr/src/front
COPY --from=ang_step  /usr/src/static/dist/samm-app/ /usr/src/webapp/
