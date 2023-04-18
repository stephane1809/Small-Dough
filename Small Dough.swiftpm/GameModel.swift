//
//  GameModel.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 14/04/23.
//

import Foundation
import SpriteKit

//enum Operation {
//    case division
//    case multiplication
//}


class GameModel: ObservableObject {
    
    @Published var multiplication: Bool = false
    @Published var division: Bool = false
    @Published var sum: Bool = false
    @Published var subtract: Bool = false
    @Published var buttonPress: Bool = false

    static let shared = GameModel()
}
