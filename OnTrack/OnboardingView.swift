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
            
            Button(action: {
                // Action when "Yes!" button tapped
            }) {
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
            
            HStack(spacing: 20) {
                BottomButton(imageName: "calendar")
                BottomButton(imageName: "home")
                BottomButton(imageName: "target")
            }
            .padding()
        }
    }
}

struct BottomButton: View {
    var imageName: String
    
    var body: some View {
        Button(action: {
            // Action when bottom button tapped
        }) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
        }
    }
}

