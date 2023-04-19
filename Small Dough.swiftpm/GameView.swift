//
//  GameView.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 18/04/23.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    var gameModel = GameModel.shared
    @State var scene: GameScene = .makeFullscreenScene()

    var body: some View {
        VStack {
            Text("""
            Hello earthling, we need a dough of value \(String(gameModel.valueCorrect))
            """ )
//                .font(.largeTitle)
//                .fontWeight(.heavy)
                .foregroundColor(.black)
                .font(.system(size: 60, weight: .light, design: .default))
            SpriteView(scene: scene)
            
        }
    }
}
