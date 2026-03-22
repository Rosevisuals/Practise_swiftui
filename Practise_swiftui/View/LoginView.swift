import Foundation
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var auth: LoginViewModel
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                
                Button("Login") {
                    auth.login(email: email, password: password)
                }
                
                Button("Register") {
                    auth.register(email: email, password: password)
                }
            }
            .padding()
        }
        }
        
}
#Preview {
    LoginView()
        .environmentObject(LoginViewModel())
}
