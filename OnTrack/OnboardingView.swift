import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("OnTrackLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 100)
            
            Text("Ready to get started?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            NavigationLink(destination: ContentView()) {
                Text("Yes!")
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
}

#Preview {
    OnboardingView().environmentObject(ViewModel())
}
