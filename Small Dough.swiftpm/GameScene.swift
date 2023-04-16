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
    @Published var multiply = SKSpriteNode()
    @Published var divide = SKSpriteNode()

    override func didMove(to view: SKView) {
        creatMassa(posicao: CGPoint(x: frame.midX, y: frame.midY))
        creatButtonMultiplie(imageNamed: "multiply")
        creatButtonDivide(imageNamed: "divide")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)

            var touchedNode = self.atPoint(location)

            if touchedNode.name == "multiply" {
                if gameModel.division == true {
                    gameModel.division = false
                    creatButtonDivide(imageNamed: "divide")
                }



                if gameModel.multiplication == true {
                    touchedNode.removeFromParent()
                    creatButtonMultiplie(imageNamed: "multiply")
                    gameModel.multiplication.toggle()
                    print("o multiplicar tava ativado")
                } else if gameModel.multiplication == false {
                    touchedNode.removeFromParent()
                    creatMultiplyPress(posicao: CGPoint(x: frame.midX + 200, y: frame.midY - 200))
                    gameModel.multiplication.toggle()
                    print("o multiplicar NÃO tava ativado")
                }
            }

            if touchedNode.name == "divide" {
                if gameModel.multiplication == true {
                    gameModel.multiplication = false
                    creatButtonMultiplie(imageNamed: "multiply")
                }

                if gameModel.division == true {
                    touchedNode.removeFromParent()
                    creatButtonDivide(imageNamed: "divide")
                    gameModel.division.toggle()
                    print("o divisor tava ativado")
                } else if gameModel.division == false {
                    touchedNode.removeFromParent()
                    creatDividePress(posicao: CGPoint(x: frame.midX - 200, y: frame.midY - 200))
                    gameModel.division.toggle()
                    print("o divisor NÃO tava ativado")
                }

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

    func creatButtonMultiplie(imageNamed: String) {
         multiply = SKSpriteNode(imageNamed: imageNamed)

        multiply.name = "multiply"
        multiply.position = CGPoint(x: frame.midX + 200, y: frame.midY - 200)

        self.addChild(multiply)
    }

    func creatButtonDivide(imageNamed: String) {
        divide = SKSpriteNode(imageNamed: imageNamed)

        divide.name = "divide"
        divide.position = CGPoint(x: frame.midX - 200, y: frame.midY - 200)

        self.addChild(divide)
    }

    func creatMultiplyPress(posicao: CGPoint) {
        multiply = SKSpriteNode(imageNamed: "multiplyPress")

        multiply.name = "multiply"
        multiply.position = posicao
        gameModel.buttonPress.toggle()

        self.addChild(multiply)
        print("entrou no creat")
    }

    func creatDividePress(posicao: CGPoint) {
        divide = SKSpriteNode(imageNamed: "dividePress")

        divide.name = "divide"
        divide.position = posicao
        gameModel.buttonPress.toggle()

        self.addChild(divide)
    }
}
