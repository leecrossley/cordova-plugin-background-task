
var exec = require("cordova/exec");

var BackgroundTask = function () {
    this.name = "BackgroundTask";
};

BackgroundTask.prototype.start = function (task) {
    exec(task, null, "BackgroundTask", "start", []);
};

BackgroundTask.prototype.stop = function (taskId) {
    exec(null, null, "BackgroundTask", "stop", [taskId]);
};

module.exports = new BackgroundTask();
