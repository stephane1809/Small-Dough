//
//  GameView.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 18/04/23.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    
    @State var scene: GameScene = .makeFullscreenScene()

    var body: some View {
        VStack {
            Text("oii")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            SpriteView(scene: scene)
        }
    }
}
