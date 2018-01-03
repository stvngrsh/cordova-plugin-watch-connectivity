var exec = require('cordova/exec');

var Watch = function() {

};

Watch.initialize = function(groupIdentifier, directory, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "Watch", "initialize", []);
};

Watch.sendMessage = function(message, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "Watch", "passMessage", [message]);
};

Watch.listen = function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, "Watch", "listenForMessage", []);
};

module.exports = Watch;