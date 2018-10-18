import Flutter
import UIKit

public protocol SelfServiceListener {
    func onDataReceived(data: String, result: @escaping FlutterResult)
}

public class SwiftSspluginPlugin: NSObject, FlutterPlugin {

  private static var listener: SelfServiceListener? = nil

  public static func addListener(listener: SelfServiceListener) {
    SwiftSspluginPlugin.listener = listener
  }

  public static func removeListener() {
      SwiftSspluginPlugin.listener = nil
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ssplugin", binaryMessenger: registrar.messenger())
    let instance = SwiftSspluginPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
