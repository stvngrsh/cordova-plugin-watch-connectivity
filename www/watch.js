var exec = require('cordova/exec');

var Watch = function() {

};

Watch.test = function(param1, param2) {
	exec(successCallback, errorCallback, "Watch", "test", [param1, param2]);
};

module.exports = Watch;