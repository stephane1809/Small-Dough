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
    var informationNode: InformationNode?
    var gameModel = GameModel.shared

    override func didMove(to view: SKView) {
        creatMassa(posicao: CGPoint(x: frame.midX, y: frame.midY), imageNamed: "massa", num: 8)
        creatButtonMultiplie(imageNamed: "multiply")
        creatButtonDivide(imageNamed: "divide")
        creatButtonSoma(imageNamed: "sum")
        creatButtonSubtract(imageNamed: "subtract")
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
                    if gameModel.division == true || gameModel.sum == true || gameModel.subtract == true{
                        gameModel.division = false
                        gameModel.sum = false
                        gameModel.subtract = false
                        creatButtonDivide(imageNamed: "divide")
                        creatButtonSoma(imageNamed: "sum")
                        creatButtonSubtract(imageNamed: "subtract")
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
                    if gameModel.multiplication == true || gameModel.sum == true || gameModel.subtract == true{
                        gameModel.multiplication = false
                        gameModel.sum = false
                        gameModel.subtract = false
                        creatButtonMultiplie(imageNamed: "multiply")
                        creatButtonSoma(imageNamed: "sum")
                        creatButtonSubtract(imageNamed: "subtract")
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

                if touchedNode.name == "sum" {
                    if gameModel.multiplication == true || gameModel.division == true || gameModel.subtract == true{
                        gameModel.division = false
                        gameModel.multiplication = false
                        gameModel.subtract = false
                        creatButtonMultiplie(imageNamed: "multiply")
                        creatButtonSubtract(imageNamed: "subtract")
                        creatButtonDivide(imageNamed: "divide")
                    }

                    if gameModel.sum == true {
                        touchedNode.removeFromParent()
                        creatButtonSoma(imageNamed: "sum")
                        gameModel.sum.toggle()

                    } else if gameModel.sum == false {
                        touchedNode.removeFromParent()
                        creatButtonSoma(imageNamed: "sumPress")
                        gameModel.sum.toggle()

                    }

                }

                if touchedNode.name == "subtract" {
                    if gameModel.multiplication == true || gameModel.sum == true || gameModel.division == true{
                        gameModel.division = false
                        gameModel.multiplication = false
                        gameModel.sum = false
                        creatButtonMultiplie(imageNamed: "multiply")
                        creatButtonSoma(imageNamed: "sum")
                        creatButtonDivide(imageNamed: "divide")
                    }

                    if gameModel.subtract == true {
                        touchedNode.removeFromParent()
                        creatButtonSubtract(imageNamed: "subtract")
                        gameModel.subtract.toggle()

                    } else if gameModel.subtract == false {
                        touchedNode.removeFromParent()
                        creatButtonSubtract(imageNamed: "subtractPress")
                        gameModel.subtract.toggle()

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

            if touchedNode.name == "massa" && gameModel.sum == true{
                node.num = node.num + 1
                node.removeFromParent()

                creatMassa(posicao: CGPoint(
                    x: touchedNode.position.x,
                    y: touchedNode.position.y), imageNamed: "massa", num: node.num)
            }

            if touchedNode.name == "massa" && gameModel.subtract == true{
                node.num = node.num - 1
                node.removeFromParent()

                creatMassa(posicao: CGPoint(
                    x: touchedNode.position.x,
                    y: touchedNode.position.y), imageNamed: "massa", num: node.num)
            }

            if node.num == gameModel.valueCorrect {
                creatPao(posicao: touchedNode.position, imageNamed: "pao")
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


        if let piece = pieceMoved as? InformationNode{

            let otherChildren = children.filter({ $0 != piece})
            let massList = otherChildren.compactMap{ $0 as? InformationNode }

            if gameModel.division == true || gameModel.sum == true || gameModel.subtract == true || gameModel.multiplication == true{

            } else if let massa = massList.first(where: { $0.contactFrame.intersects(piece.contactFrame) }) {
                massa.removeFromParent()
                piece.removeFromParent()
                var value = massa.num + piece.num
                var massa1 = creatMassa(posicao: massa.position, imageNamed: "massa", num: value)

                if value == gameModel.valueCorrect {
                    creatPao(posicao: massa.position, imageNamed: "pao")
                } else {
                    return (massa1)
                }
            }
        }
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

    func creatPao(posicao: CGPoint, imageNamed: String) {

        let pao = SKSpriteNode(imageNamed: imageNamed)

        pao.position = posicao
        pao.name = "pao"

        self.addChild(pao)

    }



    func creatButtonMultiplie(imageNamed: String) {
        let multiply = SKSpriteNode(imageNamed: imageNamed)

        multiply.name = "multiply"
        multiply.size = CGSize(width: 160, height: 160)
        multiply.position = CGPoint(x: frame.maxX * 0.2, y: frame.maxY * 0.15)

        self.addChild(multiply)
    }

    func creatButtonDivide(imageNamed: String) {
        let divide = SKSpriteNode(imageNamed: imageNamed)

        divide.name = "divide"
        divide.size = CGSize(width: 160, height: 160)
        divide.position = CGPoint(x: frame.maxX * 0.4, y: frame.maxY * 0.15)

        self.addChild(divide)
    }

    func creatButtonSoma(imageNamed: String) {
        let sum = SKSpriteNode(imageNamed: imageNamed)

        sum.name = "sum"
        sum.size = CGSize(width: 160, height: 160)
        sum.position = CGPoint(x: frame.maxX * 0.6, y: frame.maxY * 0.15)

        self.addChild(sum)
    }

    func creatButtonSubtract(imageNamed: String) {
        let subtract = SKSpriteNode(imageNamed: imageNamed)

        subtract.name = "subtract"
        subtract.size = CGSize(width: 160, height: 160)
        subtract.position = CGPoint(x: frame.maxX * 0.8, y: frame.maxY * 0.15)

        self.addChild(subtract)
    }
}
