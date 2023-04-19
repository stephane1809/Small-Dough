import SwiftUI
import SpriteKit

struct ContentView: View {

    @State var scene: InitialScene = .makeFullscreenScene()

    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 20) {
                Text("""
My name is Doo,
Welcome to my bakery Alien Dough!

""")
                    .font(.custom("Chalkduster", size: 40))
                SpriteView(scene: scene)
                Text("""
Let's make delicious breads human?
""")
                .font(.custom("Chalkduster", size: 40))

                NavigationLink(destination: GameView(), label: {
                    ZStack {
                                     Rectangle()
                                         .frame(width: 200, height: 50)
                                         .foregroundColor(.blue)
                                         .cornerRadius(10)
                                     Text("Get Started")
                            .font(.custom("Chalkduster", size: 20))
                            .font(.body)
                                 }
                })


            }
        }.navigationViewStyle(.stack)
    }
}
