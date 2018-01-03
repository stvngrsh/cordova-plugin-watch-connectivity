var exec = require('cordova/exec');

var Watch = function() {

};

Watch.initialize = function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, "Watch", "initialize", []);
};

Watch.sendMessage = function(message, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "Watch", "sendMessage", [message]);
};

Watch.listen = function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, "Watch", "listenForMessage", []);
};

module.exports = Watch;