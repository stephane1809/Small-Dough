//
//  SKSpriteNodeExtension.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 19/04/23.
//

import SpriteKit

extension SKScene {
    func getTextures(with name: String, textureAtlasName: String) -> [SKTexture] {
        let textureAtlas = SKTextureAtlas(named: textureAtlasName)
        var textures: [SKTexture] = []
        let names = textureAtlas.textureNames.sorted()
        for i in 0..<names.count{
            if names[i].contains(name) {
                let texture = textureAtlas.textureNamed(names[i])
                texture.filteringMode = .nearest
                textures.append(texture)
            }
        }
        return textures
    }
}
