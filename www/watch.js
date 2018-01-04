var exec = require('cordova/exec');

var Watch = function() {

};

Watch.initialize = function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, "Watch", "initialize", []);
};

Watch.sendMessage = function(message, successCallback, errorCallback) {
    exec(successCallback, errorCallback, "Watch", "sendMessage", [message]);
};

Watch.sendObject = function(object, successCallback, errorCallback) {
	var payload = JSON.stringify(object);
	exec(successCallback, errorCallback, "Watch", "sendObject", [payload]);
}

Watch.updateAppContext = function(object, successCallback, errorCallback) {
	var payload = JSON.stringify(object);
	exec(successCallback, errorCallback, "Watch", "updateAppContext", [payload]);
}

Watch.listenForMessage = function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, "Watch", "listenForMessage", []);
};

Watch.checkAppContext = function(successCallback, errorCallback) {
	exec(successCallback, errorCallback, "Watch", "checkAppContext", []);
}

module.exports = Watch;