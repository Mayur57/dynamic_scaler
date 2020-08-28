# Dynamic Scaler

A Flutter package that enables dynamic scaling of widgets, images and padding

### How to use
You can fork the full example project that uses this package [here](https://github.com/Mayur57/dynamic_scaler_example)

- Depend on the package:
    ```
    dependencies:
        dynamic_scaler: ^0.0.1
    ```
- Replace the root widget of your app to ```Scalable()```:
    ```
    class MyApp extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return Scalable(
                context: context,
                rootWidget: App(),
                printDebugFlag: true,
            );
        }
    }

    class App extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
            return MaterialApp(
                title: 'Dynamic Scaler Demo',
                theme: ThemeData(primarySwatch: Colors.blue),
                home: MyHomePage(title: 'Dynamic Scaler'),
            );
        }
    }
    ```
- Declare the device scale factors according to a particular test device:
    ```
  //Values for Nexus 5X
  double heightFactor = 6.83;
  double widthFactor = 4.11;
    ```
    
- Use the methods by calling them using Scaler() object. For example for a container of hardcoded size 50px x 100px, this would be the code:
    ```
    Container(
        color: Colors.blue,
        height: Scaler.scaleWidgetHeight(50, heightFactor),
        width: Scaler.scaleWidgetHeight(100, widthFactor),
    )
    ```
- Note: There are seperate methods for Images, Widgets and Padding types
    

### Known Issues

  - Doesn't preserve aspect ratios of the widgets (fix in works for a planned future update)

### Want to help?
Awesome! Fork the project and post a pull request and I'll take a look at it.