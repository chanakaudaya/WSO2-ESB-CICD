// A system module containing protocol access constructs
// Module objects referenced with 'http:' in code
import ballerina/http;
import ballerina/log;

@http:ServiceConfig {
   basePath: "/hello"
}
service hello on new http:Listener(9092) {

@http:ResourceConfig {
   methods: ["GET"],
   path: "/hi"
}
    resource function addMemo(http:Caller caller, http:Request request) {

        // Create object to carry data back to caller
        http:Response response = new;

		json js = {
		    "message":"Hello from WSO2 ESB CI/CD Example"
		    };
		response.setJsonPayload(js);
		response.addHeader("Content-Type", "application/json");
		

        // Send a response back to caller
        // Errors are ignored with '_'
        // -> indicates a synchronous network-bound call
        var result = caller->respond(response);

        if (result is error) {
            log:printError("Error sending response", result);
        }
    }

}

