import SwiftUI
import SpriteKit

struct ContentView: View {

    @State var scene: InitialScene = .makeFullscreenScene()

    var body: some View {

        NavigationView{
            VStack(alignment: .center, spacing: 10) {
                Text("""
My name is Doo,
Welcome to my bakery Alien Dough!

Let's make delicious breads human?
""")
                    .font(.custom("Chalkduster", size: 35))


                SpriteView(scene: scene)
                    .body.frame(width: 600, height: 600)

                .font(.custom("Chalkduster", size: 40))

                NavigationLink(destination: GameView(), label: {
                    ZStack {
                                     Rectangle()
                                         .frame(width: 400, height: 100)
                                         .foregroundColor(.green)
                                         .cornerRadius(10)
                                     Text("Get Started")
                            .foregroundColor(.black)
                            .font(.custom("Chalkduster", size: 40))
                            .font(.body)
                                 }
                })


            }
        }.navigationViewStyle(.stack)
            .navigationBarBackButtonHidden()
    }
}
