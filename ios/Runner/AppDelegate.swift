import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // Register Calculator API
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
    let calculatorApi = CalculatorApiImpl()
    CalculatorApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: calculatorApi)
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
