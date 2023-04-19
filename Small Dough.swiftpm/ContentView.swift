import SwiftUI
import SpriteKit

struct ContentView: View {

    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 20) {
                Text("oi")
                NavigationLink(destination: GameView(), label: {
                    ZStack {
                                     Rectangle()
                                         .frame(width: 200, height: 50)
                                         .foregroundColor(.blue)
                                         .cornerRadius(10)
                                     Text("Get Started")
                                         .font(.title)

                                 }
                })
            }
        }
    }

}
