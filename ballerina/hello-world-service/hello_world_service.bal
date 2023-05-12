import ballerina/http;

listener http:Listener httpListener = new (9090);

// Implement a general http service listener on port 9090 with the root path "/"
service / on httpListener {
    // add a GET resource called "greeting" that returns the "Hello, World!" message
    resource function get greeting() returns string {
        return "Hello, World!";
    }
}
