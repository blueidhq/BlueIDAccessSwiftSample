import BlueIDAccessSDK
import SwiftUI

#if os(iOS) || os(watchOS)
class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        BlueAppDelegate.didFinishLaunchingWithOptions(launchOptions: launchOptions)
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let sceneConfig: UISceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        BlueAppDelegate.willTerminate()
    }
}
#else
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        BlueAppDelegate.didFinishLaunching()
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        BlueAppDelegate.willTerminate()
    }
}
#endif
