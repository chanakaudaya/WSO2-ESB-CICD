import ballerina/http;
@http:ServiceConfig {
basePath: "/hello"
}
service<http:Service> hello bind {port:9090} {
@http:ResourceConfig {
path: "/hi",
methods: ["GET"]
}
  orders (endpoint caller, http:Request request) {
      http:Response res;
      //res.setTextPayload("Hello from WSO2 ESB CI/CD Example\n");
json js = {
    "message":"Hello from WSO2 ESB CI/CD Example"
    };
res.setJsonPayload(js);
res.addHeader("Content-Type", "application/json");
      _ = caller->respond(res);
  }
}
