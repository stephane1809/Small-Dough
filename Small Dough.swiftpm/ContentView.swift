import SwiftUI
import SpriteKit

struct ContentView: View {

    @State var scene: GameScene = .makeFullscreenScene()

    var body: some View {
        VStack {
            SpriteView(scene: scene)
        }
    }
}
