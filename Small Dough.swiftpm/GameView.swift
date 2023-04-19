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
        NavigationView {
            VStack {
                Text("""
                Hello earthling! We need a dough of value \(String(gameModel.valueCorrect))
                """ )
    //                .font(.largeTitle)
    //                .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .font(.custom("Chalkduster", size: 40))
                SpriteView(scene: scene)

            }
        }.navigationViewStyle(.stack)

    }
}
