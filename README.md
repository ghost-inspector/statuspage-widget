# StatusPage.io Widget (Unofficial)

This is an unofficial widget for use with the  [StatusPage.io](https://www.statuspage.io/) service. It queries StatusPage.io for the status of your service and displays a configurable widget on your website.

![Screenshot](/examples/statuspage-widget.gif?raw=true)

## Usage

This package is available on both [NPM](https://www.npmjs.com/) and [Bower](http://bower.io/) under the name "statuspage-widget".

To place the widget on your website you must include StatusPage.io's official JavaScript file along with this widget's JavaScript file, then instantiate a new `StatusPageWidget` object with your StatusPage.io ID.

```
<script src="https://statuspage-production.s3.amazonaws.com/se-v2.js"></script>
<script src="dist/widget.js"></script>
<script> var widget = new StatusPageWidget('ghostinspector'); </script>
```

A default stylesheet for the widget is included and can be used:

```
<link href="dist/style.css" rel="stylesheet">
```

### Options

This widget includes the following options:

`alwaysShow` - Always show the widget, even when status is operational. (Default: `false`)

`linkNewWindow` - Clicking the widget should launch your StatusPage.io page in a new tab. (Default: `true`)

`updateInterval` - Check StatusPage.io for latest status and update the widget. This is specified in seconds. A value of `0` will turn off checking and the status will only be updated on new page loads. (Default: `0`)

Options can be passed to the widget using an object as the second parameter of the `StatusPageWidget` constructor:

```
var widget = new StatusPageWidget('ghostinspector', { alwaysShow: true, updateInterval: 300 });
```
