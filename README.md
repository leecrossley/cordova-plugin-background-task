## Background Task Plugin for Apache Cordova

Allows you to run JavaScript when the app is active and for 3 minutes after the app is suspended.

## Install

```
cordova plugin add https://github.com/leecrossley/cordova-plugin-background-task.git
```

You **do not** need to reference any JavaScript, the Cordova plugin architecture will add a backgroundtask object to your root automatically when you build.

## Usage

### Start

```js
backgroundtask.start(functionToRun);
```

## Platform support

iOS only.

## License

[MIT License](http://ilee.mit-license.org)
