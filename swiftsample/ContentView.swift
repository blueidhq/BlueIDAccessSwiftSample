import SwiftUI

struct ContentView: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            NavigationStack() {
                DevicesView()
            }
            .tabItem {
                Text("Devices")
            }
            .tag(0)
            
            NavigationStack() {
                CredentialsView()
            }
            .tabItem {
                Text("Credentials")
            }
            .tag(1)
        }
    }
}

#Preview {
    ContentView()
}
