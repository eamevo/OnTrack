import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    @State private var userName: String = ""
    
    @State var onboardingViewVisible: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Image("OnTrack")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.22)
                    
                
                Text("Ready to get started?")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Enter your name", text: $userName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                
                Button(action: {
                    viewModel.setName(name: userName)
                    viewModel.isOnboarded = true
                    print(viewModel.name)
                    dismiss()
                }) {
                    Text("Get Started!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
        }
        .interactiveDismissDisabled(!viewModel.isOnboarded)
    }
}

#Preview {
    OnboardingView().environmentObject(ViewModel())
}
