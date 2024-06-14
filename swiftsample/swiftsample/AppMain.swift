import SwiftUI

@main
struct AppMain: App {
#if os(iOS) || os(watchOS)
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
#else
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
#endif
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
