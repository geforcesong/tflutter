import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class BatteryChecker extends StatefulWidget{
  BatteryChecker({Key key}) : super(key: key);

  @override
  _BatteryChecker createState() => _BatteryChecker();
}

class _BatteryChecker  extends State<BatteryChecker> {
  static const platform = const MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Widget build(BuildContext context) {
    return Material(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton(
            child: Text('Get Battery Level'),
            onPressed: _getBatteryLevel,
          ),
          Text(_batteryLevel),
        ],
      ),
    ),
  );
  }
}