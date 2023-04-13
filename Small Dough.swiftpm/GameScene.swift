//
//  GameScene.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 12/04/23.
//

import Foundation
import SpriteKit

class GameScene: SKScene {

    override func didMove(to view: SKView) {
        creatMassa(posicao: CGPoint(x: frame.midX, y: frame.midY))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            var touchedNode = self.atPoint(location)

            if touchedNode.name == "massa"{
                touchedNode.removeFromParent()
//                creatMassa(posicao: CGPoint(
//                    x: touchedNode.position.x,
//                    y: touchedNode.position.y + 200))

                creatDividedMassa(posicao: CGPoint(x: touchedNode.position.x, y: touchedNode.position.y))

                creatDividedMassa(posicao: CGPoint(x: touchedNode.position.x, y: touchedNode.position.y + 200))
                print("criou")
            }

        }
    }

    static func makeFullscreenScene() -> GameScene {
        let scene = GameScene()
        scene.size = CGSize(
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height
        )
        scene.scaleMode = .fill
        scene.backgroundColor = .white
        return scene
    }

    func creatMassa(posicao: CGPoint) {
        let massa = SKSpriteNode(imageNamed: "massa")

        massa.position = posicao

        massa.name = "massa"

        self.addChild(massa)
    }

    func creatDividedMassa(posicao: CGPoint) {
        let massa = SKSpriteNode(imageNamed: "massa2")

        massa.position = posicao

        massa.name = "massa"

        self.addChild(massa)
    }
}
