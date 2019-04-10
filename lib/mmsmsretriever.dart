import 'dart:async';

import 'package:flutter/services.dart';

class Mmsmsretriever {


  static const MethodChannel _channel =const MethodChannel('mmsmsretriever');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get Otpcode async{
    final String otp=await _channel.invokeMethod("otp");
    return otp;
  }

  static Future<String> get startListen async{
    final String otp=await _channel.invokeMethod("startListen");
    return otp;
  }
  static void setMethodCallHandler(Future<dynamic> handler(MethodCall call)){
    _channel.setMethodCallHandler(handler);
  }

}
