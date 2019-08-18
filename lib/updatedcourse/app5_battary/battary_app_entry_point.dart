import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BattaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battary App',
      home: BattaryHomePage(),
    );
  }
}

class BattaryHomePage extends StatefulWidget {
  @override
  _BattaryHomePageState createState() => _BattaryHomePageState();
}

class _BattaryHomePageState extends State<BattaryHomePage> {
  int _battaryLevel;

  /// NOTES:
  /// we use async and await because all of these are managed by future ..
  /// Also the communication may take a time so to be careful we neet them
  Future<void> _getBattaryLevel() async {

    /// MethodChannel is to create a channel between the platform and flutter
    /// MethodChannel needs a unique identifier ber application for communication like below ..
    const platform = MethodChannel('course.flutter.dev/battary');

    try {
      /// with the platform object that we have just created
      /// we will invoke a method through that channel .. and we pass the
      /// name of the method and arguments if we want to pass argument ...
      final battaryLevel = await platform.invokeMethod('getBattaryLevel');
      setState(() {
        _battaryLevel = battaryLevel;
      });
    } on PlatformException catch (error) {
      setState(() {
        _battaryLevel = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getBattaryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Native Code'),
      ),
      body: Center(
        child: Text('Battary Status ... $_battaryLevel'),
      ),
    );
  }
}
