//
//  InformationNode.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 17/04/23.
//

import Foundation
import SpriteKit

class InformationNode: SKSpriteNode {

    lazy var contactFrame: SKShapeNode = {
        let contact = SKShapeNode(rectOf: CGSize(width: frame.width*0.9, height: frame.height*0.43))
        contact.fillColor = .clear
        contact.strokeColor = .clear
        contact.zPosition = -1
        return contact
    }()

    var num: Int = 8

    init(imageNamed: String) {
        super.init(texture: SKTexture(imageNamed: imageNamed), color: .clear, size: .zero)
        size = (texture?.size())!
        addChild(contactFrame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

