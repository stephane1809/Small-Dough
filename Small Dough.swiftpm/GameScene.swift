//
//  GameScene.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 12/04/23.
//

import Foundation
import SpriteKit

class GameScene: SKScene, ObservableObject {
    var pieceMoved: SKSpriteNode?
    var informationNode = InformationNode()


    var gameModel = GameModel.shared
    @Published var multiply = SKSpriteNode()
    @Published var divide = SKSpriteNode()

    override func didMove(to view: SKView) {
        creatMassa(posicao: CGPoint(x: frame.midX, y: frame.midY), imageNamed: "massa", num: informationNode.num)
        creatButtonMultiplie(imageNamed: "multiply")
        creatButtonDivide(imageNamed: "divide")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        let location = touches.first!.location(in: self)
        let nodes = nodes(at: location).first

        if let piece = nodes as? SKSpriteNode {
                    pieceMoved = piece
                }

        for touch in touches {
            let location = touch.location(in: self)

            let touchedNode = self.atPoint(location)

            guard let node = touchedNode as? InformationNode else {

                if touchedNode.name == "multiply" {
                    if gameModel.division == true {
                        gameModel.division = false
                        creatButtonDivide(imageNamed: "divide")
                    }

                    if gameModel.multiplication == true {
                        touchedNode.removeFromParent()
                        creatButtonMultiplie(imageNamed: "multiply")
                        gameModel.multiplication.toggle()

                    } else if gameModel.multiplication == false {
                        touchedNode.removeFromParent()
                        creatButtonMultiplie(imageNamed: "multiplyPress")
                        gameModel.multiplication.toggle()

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

                    } else if gameModel.division == false {
                        touchedNode.removeFromParent()
                        creatButtonDivide(imageNamed: "dividePress")
                        gameModel.division.toggle()

                    }

                }
                return
            }


            if touchedNode.name == "massa" && gameModel.division == true {
                node.num = node.num/2

                touchedNode.removeFromParent()

                creatMassa(posicao: CGPoint(x: touchedNode.position.x, y: touchedNode.position.y), imageNamed: "massa2", num: node.num)

                creatMassa(posicao: CGPoint(x: touchedNode.position.x, y: touchedNode.position.y + 200), imageNamed: "massa2", num: node.num)

            }

            if touchedNode.name == "massa" && gameModel.multiplication == true{

                creatMassa(posicao: CGPoint(
                    x: touchedNode.position.x,
                    y: touchedNode.position.y + 200), imageNamed: "massa", num: node.num)
            }

        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        if let piece = pieceMoved {
                    let touch = touches.first!
                    let location = touch.location(in: self)
                    piece.position = location
                }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?){
        pieceMoved = nil
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

    func creatMassa(posicao: CGPoint, imageNamed: String, num: Int) {
        let massa = InformationNode(imageNamed: imageNamed)
        massa.num = num

        massa.position = posicao
        massa.name = "massa"

        let scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.text = String(massa.num)
        scoreLabel.horizontalAlignmentMode = .right
        scoreLabel.position = CGPoint(x: 0, y: 0)
        scoreLabel.fontColor = UIColor.black

        massa.addChild(scoreLabel)

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
}
