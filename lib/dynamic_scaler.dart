import 'package:flutter/material.dart';

class Scaler {
  static double deviceScreenWidth;
  static double deviceScreenHeight;
  static double scalableBlockWidth;
  static double scalableBlockHeight;

  //Multipliers are the variables that hold the value for the factors by which
  //a said widget will be scaled.
  static double textScaleFactor;
  static double imageScaleFactor;
  static double heightScaleFactor;
  static double widthScaleFactor;

  void initScaler(BoxConstraints constraints, Orientation orientation, bool printDebugFlag) {
    if (orientation == Orientation.portrait) {
      ///User screen is in Portrait mode
      deviceScreenWidth = constraints.maxWidth;
      deviceScreenHeight = constraints.maxHeight;
    } else {
      ///User screen is in Landscape mode
      deviceScreenWidth = constraints.maxHeight;
      deviceScreenHeight = constraints.maxWidth;
    }

    ///Divide the screen space into blocks of heights and widths scaled down to 10%
    ///Hence, screen is converted to a grid of said blocks
    scalableBlockWidth = deviceScreenWidth * 0.01;
    scalableBlockHeight = deviceScreenHeight * 0.01;

    ///The multiplier values are assigned after processing the screen constraints
    heightScaleFactor = scalableBlockHeight;
    widthScaleFactor = scalableBlockWidth;

    if(printDebugFlag) printDeviceSizeInformation();

  }

  static void printDeviceSizeInformation() {
    ///Printing the block sizes to get an idea for multiplier values
    print('Device Specific Scaling Factors:');
    print('Device Specific Scaling Factors:');
    print('Height: ' + scalableBlockHeight.toStringAsFixed(2));
    print('Width: ' + scalableBlockWidth.toStringAsFixed(2));
  }

  static double scaleWidgetHeight(double actualHeight, double heightFactor) {
    return (actualHeight / heightFactor) * heightScaleFactor;
  }

  static double scaleWidgetWidth(double actualHeight, double widthFactor) {
    return (actualHeight / widthFactor) * widthScaleFactor;
  }

  static double scaleVerticalPadding(double actualHeight, double heightFactor) {
    return (actualHeight / heightFactor) * heightScaleFactor;
  }

  static double scaleHorizontalPadding(
      double actualHeight, double widthFactor) {
    return (actualHeight / widthFactor) * widthScaleFactor;
  }

  static double scaleImageHeight(double actualHeight, double heightFactor) {
    return (actualHeight / heightFactor) * heightScaleFactor;
  }

  static double scaleImageWidth(double actualHeight, double widthFactor) {
    return (actualHeight / widthFactor) * widthScaleFactor;
  }
}

class Scalable extends StatelessWidget {
  Scalable({@required this.context, @required this.rootWidget, @required this.printDebugFlag});
  final BuildContext context;
  final Widget rootWidget;
  final bool printDebugFlag;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        Scaler().initScaler(constraints, orientation, printDebugFlag);
        return rootWidget;
      });
    });
  }
}