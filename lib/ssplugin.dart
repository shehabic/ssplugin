import 'dart:async';

import 'package:flutter/services.dart';

class Ssplugin {
  static const MethodChannel _channel =
      const MethodChannel('ssplugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> getData(String data) async {
    final String version = await _channel.invokeMethod(data);
    return version;
  }
}
