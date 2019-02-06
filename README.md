# cordova-plugin-watch-connectivity

[![npm version](https://badge.fury.io/js/cordova-plugin-watch-connectivity.svg)](https://badge.fury.io/js/cordova-plugin-watch-connectivity)

Plugin to allow communication between Apple Watch devices and iOS devices running a Cordova application. Requires WatchOS 2+ Watch Connectivity Framework.

## Basic Usage

Import the plugin.

```JavaScript
const Watch = require('cordova-plugin-watch-connectivity');
```

### Initialize

Before calling any other functions, you must initialize the communication.

```JavaScript
Watch.initialize(
  () => console.log("Success!"),
  error => console.log("Failed to init: ", error)
);
```

### Communicating in the foreground

While the Watch app is running in the foreground, you can send strings and objects to the Watch App and receive string messages from the Watch App. This would be useful for something like live displaying heart rate information on the phone screen.

Objects can also be sent to the Watch. These are sent as a JSON string and parsed as a dictionary object in Swift/ObjC.

```JavaScript
// Send a string
Watch.sendMessage(
  "Hello World!",
  () => console.log("Message sent"),
  error => console.log("Messaged failed: ", error)
);

// Send an object
Watch.sendObject(
  {text: "Hello World!"},
  () => console.log("Object sent"),
  error => console.log("Object failed: ", error)
);

// Listen for messages
Watch.listenForMessage(
  // Will fire multiple times as messages are sent
  message => console.log("Message received: ": message),
  error => console.log("Failed to listen: ", error)
);
```

### Communicating in the background

Communicating between the iOS app and the Watch app while either app is running in the background is limited to setting and retreiving the "Application Context", which is a shared object between the iOS app and the companion Watch app.

See the [Apple Developer Docs](https://developer.apple.com/documentation/watchconnectivity/wcsession/1615643-applicationcontext) for more information on App Context.

```JavaScript
// Set the app context with an object
Watch.updateAppContext(
  {text: "Hello World!"},
  () => console.log("Set app context"),
  error => console.log("Failed to set context: ", error)
)

// Check the app context once
Watch.checkAppContext(
  // This fires only once unlike listenForMessages
  context => console.log("Context retreived: ": context),
  error => console.log("Failed to retreive context: ", error)
```
