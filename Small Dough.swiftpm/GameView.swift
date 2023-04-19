//
//  GameView.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 18/04/23.
//

import SwiftUI
import SpriteKit

struct GameView: View {

    @StateObject var gameModel = GameModel()

    @StateObject var scene = GameScene()

    var body: some View {

        NavigationView {
            VStack{
                HStack{
                    NavigationLink(destination: ContentView(), label: { ZStack {
                        Rectangle()
                            .frame(width: 60, height: 40)
                            .foregroundColor(.green)
                            .cornerRadius(10)
                        Text("Back")
                            .foregroundColor(.black)
                    }
    })

                    Spacer()
                }.padding(.horizontal, 30)
                    .padding(.top, 30)

                if gameModel.win == true {
                    Text(gameModel.textWin)
                        .foregroundColor(.black)
                        .font(.custom("Chalkduster", size: 40))
                } else{
                    Text( "\(gameModel.textNo) \(gameModel.valueCorrect)")
                        .foregroundColor(.black)
                        .font(.custom("Chalkduster", size: 40))
                }

                SpriteView(scene: scene)
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
        .onAppear {
            scene.gameModel = gameModel
        }
    }


}

                    
