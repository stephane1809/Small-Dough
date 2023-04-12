import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("massa")
            Button{
                print("oi")

            } label: {
                Image(systemName: "pause.fill")
                    .foregroundColor(.black)
                    .frame(width: 100, height: 100, alignment: .center)
            }

        }
    }
}
