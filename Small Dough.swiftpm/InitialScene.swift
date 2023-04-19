//
//  InitialScene.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 19/04/23.
//

import SpriteKit
import GameplayKit

class InitialScene: SKScene {

    override func didMove(to view: SKView) {
//        self.backgroundColor = SKColor(red: 158/255, green: 176/255, blue: 71/255, alpha: 1)
        setupScene()
    }

    func setupScene( ){
        removeAllActions()
        removeAllChildren()

        let textures: [SKTexture] = getTextures(with: "talk", textureAtlasName: "ET")

        let node = SKSpriteNode(texture: textures[0])
        node.position.x = self.size.width/2
        node.position.y = self.size.height/3
        node.scale(to: CGSize(width: 500, height: 500))

        let node2 = SKSpriteNode(imageNamed: "chapeu")
        node2.position.x = self.size.width/400
        node2.position.y = self.size.height/5.15
        node2.scale(to: CGSize(width: 350, height: 350))

        self.addChild(node)
        node.addChild(node2)

        let action = SKAction.animate(with: textures, timePerFrame: 1/TimeInterval(textures.count), resize: true, restore: true)

        node.run(SKAction.repeatForever(action))

    }


    

    static func makeFullscreenScene() -> InitialScene {
        let scene = InitialScene()
        scene.size = CGSize(
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height
        )
        scene.scaleMode = .fill
        scene.backgroundColor = .white
        return scene
    }

}

