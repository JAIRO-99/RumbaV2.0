import SwiftUI
import GoogleSignInSwift

struct GoogleSignInButtonView: View {
    @StateObject private var viewModel = GoogleSignInViewModel()

    var body: some View {
        VStack {
            if viewModel.isAuthenticated {
                Text(viewModel.signInStatus)
                    .foregroundColor(.green)
                    .font(.headline)
            } else {
                GoogleSignInButton {
                    viewModel.signInWithGoogle()
                }
                .frame(width: 200, height: 50)
                .padding()

                if viewModel.isLoading {
                    ProgressView()
                }

                Text(viewModel.signInStatus)
                    .foregroundColor(.red)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    GoogleSignInButtonView()
}
