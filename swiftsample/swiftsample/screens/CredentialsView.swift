import SwiftUI
import BlueIDAccessSDK

struct CredentialsView: View {
    @State private var activationToken: String = ""
    @State private var credentials: [Credential] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Add credential")
                .font(.headline)
            
            HStack {
                TextField("Activation token", text: $activationToken)
                Button("Claim") {
                    claimCredential()
                }
            }
            VStack(alignment: .leading) {
                Text("Credentials")
                    .font(.headline)
                
                List(credentials) { item in
                    VStack(alignment: .leading) {
                        Text("ID: \(item.id)")
                            .font(.headline)
                        Text("Name: \(item.name)")
                            .font(.subheadline)
                        Text("Site Name: \(item.siteName)")
                            .font(.subheadline)
                        Text("Valid from: \(item.validFrom)")
                            .font(.subheadline)
                        Text("Valid to: \(item.validTo)")
                            .font(.subheadline)
                        Text("Validity: \(item.validity)")
                            .font(.subheadline)
                    }
                }
            }
            .padding(.top, 10)
        }
        .padding()
        .onAppear() {
            loadCredentials()
        }
    }
    
    func loadCredentials() {
        do {
            let result = try blueCommands.getAccessCredentials.run()
            
            self.credentials = result.credentials.map{ Credential($0) }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func claimCredential() {
        Task {
            do {
                try await blueCommands.claimAccessCredential.runAsync(activationToken: activationToken)
                
                DispatchQueue.main.async {
                    loadCredentials()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    CredentialsView()
}
