import SwiftUI
import SpriteKit

struct ContentView: View {

    @State var scene: InitialScene = .makeFullscreenScene()

    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 20) {

                Text("""
Welcome to my bakery Alien Dough!

My name is Doo,
Let's make delicious breads human?
""")
                    .font(.custom("Chalkduster", size: 40))
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))


                SpriteView(scene: scene)
                    .frame(height: 500)

                .font(.custom("Chalkduster", size: 40))

                NavigationLink(destination: GameView(), label: {
                    ZStack {
                                     Rectangle()
                                         .frame(width: 200, height: 50)
                                         .foregroundColor(.green)
                                         .cornerRadius(10)
                                     Text("Get Started")
                            .foregroundColor(.black)
                            .font(.custom("Chalkduster", size: 20))
                            .font(.body)
                                 }
                })


            }
        }.navigationViewStyle(.stack)
    }
}
