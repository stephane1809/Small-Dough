//
//  GameScene.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 12/04/23.
//

import Foundation
import SpriteKit

class GameScene: SKScene, ObservableObject {

    var gameModel = GameModel.shared
//    var location = self.atPoint(CGPoint(x: frame.midX, y: frame.midY))

    override func didMove(to view: SKView) {
        creatMassa(posicao: CGPoint(x: frame.midX, y: frame.midY))
        creatButtonMultiplie()
        creatButtonDivide()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            var touchedNode = self.atPoint(location)

            if touchedNode.name == "multiply" {
//                if gameModel.buttonPress == true {
////                    touchedNodeDivide.removeFromParent()
//                    creatButtonDivide()
//                }
                gameModel.division = false
                touchedNode.removeFromParent()
                creatMultiplyPress(posicao: CGPoint(x: frame.midX + 200, y: frame.midY - 200))
                gameModel.multiplication.toggle()
                print("apertou multiplicar")
            }

            if touchedNode.name == "divide" {
                print("apertou dividir")
                gameModel.multiplication = false
                touchedNode.removeFromParent()
                creatDividePress(posicao: CGPoint(x: frame.midX - 200, y: frame.midY - 200))
                gameModel.division.toggle()
            }

            if touchedNode.name == "massa" && gameModel.division == true && gameModel.multiplication == false{

                touchedNode.removeFromParent()

                creatDividedMassa(posicao: CGPoint(x: touchedNode.position.x, y: touchedNode.position.y))

                creatDividedMassa(posicao: CGPoint(x: touchedNode.position.x, y: touchedNode.position.y + 200))
                print("dividiu")
            }

            if touchedNode.name == "massa" && gameModel.multiplication == true && gameModel.division == false{

                creatMassa(posicao: CGPoint(
                    x: touchedNode.position.x,
                    y: touchedNode.position.y + 200))

                print("multiplicou")
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

    func creatButtonMultiplie() {
        let multiplie = SKSpriteNode(imageNamed: "multiply")

        multiplie.name = "multiply"
        multiplie.position = CGPoint(x: frame.midX + 200, y: frame.midY - 200)

        self.addChild(multiplie)
    }

    func creatButtonDivide() {
        let multiplie = SKSpriteNode(imageNamed: "divide")

        multiplie.name = "divide"
        multiplie.position = CGPoint(x: frame.midX - 200, y: frame.midY - 200)

        self.addChild(multiplie)
    }

    func creatMultiplyPress(posicao: CGPoint) {
        let multiplie = SKSpriteNode(imageNamed: "multiplyPress")

        multiplie.name = "multiply"
        multiplie.position = posicao
        gameModel.buttonPress.toggle()

        self.addChild(multiplie)
    }

    func creatDividePress(posicao: CGPoint) {
        let multiplie = SKSpriteNode(imageNamed: "dividePress")

        multiplie.name = "divide"
        multiplie.position = posicao
        gameModel.buttonPress.toggle()

        self.addChild(multiplie)
    }
}
