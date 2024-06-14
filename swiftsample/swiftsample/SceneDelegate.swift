#if os(iOS) || os(watchOS)
import BlueIDAccessSDK
import SwiftUI

class SceneDelegate: NSObject, UIWindowSceneDelegate {
    func sceneWillResignActive(_ scene: UIScene) {
        BlueAppDelegate.willResignActive()
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        BlueAppDelegate.didBecomeActive()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        BlueAppDelegate.didEnterBackground()
    }
}
#endif
