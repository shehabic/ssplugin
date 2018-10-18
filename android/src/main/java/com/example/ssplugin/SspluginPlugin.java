package com.example.ssplugin;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** SspluginPlugin */
public class SspluginPlugin implements MethodCallHandler {

  public interface Listener {
      public void onData(String data, Result result);
  }

  private static Listener listener;

  public static void addListener(Listener newListener) {
    listener = newListener;
  }

  public static void removeListener() {
    listener = null;
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "ssplugin");
    channel.setMethodCallHandler(new SspluginPlugin());
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (listener != null) {
      listener.onData(call.method, result);
    } else {
      result.notImplemented();
    }
  }
}
