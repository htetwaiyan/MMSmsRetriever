import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mmsmsretriever/mmsmsretriever.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _hashKey = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initCallBackHandler();
  }

  void initCallBackHandler(){
    Mmsmsretriever.setMethodCallHandler((MethodCall call){
      print(call.method);
      if(call.method=="otpcode"){
        setState(() {
          otp=call.arguments.toString();
        });
      }
    });
  }

  Future<void> initPlatformState() async {
    String hashKey;


    try {
      await Mmsmsretriever.startListen.then((str){
        print(str);
        hashKey =str;
      });
    } on PlatformException {
      hashKey = 'Failed to get hash key.';
    }


    if (!mounted) return;

    setState(() {
      _hashKey = hashKey;
    });
  }
  String otp="";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hash code'),
        ),
        body: Column(
          children: <Widget>[
            Text('Hash code is: $_hashKey\n'),
            Text(otp),
          ],
        ),
      ),
    );
  }
}
