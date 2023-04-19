//
//  OnboardingData.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 19/04/23.
//

import Foundation
import SwiftUI

struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let objectImage: String
    let primaryText: String
    let secondaryText: String

    static let list: [OnboardingData] = [
            OnboardingData(id: 0, objectImage: "et_talk_0000", primaryText: "Hi, my name is Doo!", secondaryText: "Vamos fazer pãezinhos para minha padaria Alien Dough usando operações matemáticas básicas?"),
            OnboardingData(id: 1, objectImage: "select_operation", primaryText: "Escolha a operação matemática", secondaryText: "Clique na massa para realizar a operação e não esqueça de desativá-la depois"),
            OnboardingData(id: 2, objectImage: "arrastar", primaryText: "Arraste as massas para somar", secondaryText: "Coloque as massas em contado para somar. Você só pode arrastar as massas se nenhuma operação matemática tiver ativada"),
            OnboardingData(id: 3, objectImage: "conseguiu", primaryText: "Arraste as massas para somar", secondaryText: "Coloque as massas em contado para somar. Você só pode arrastar as massas se nenhuma operação matemática tiver ativada")
        ]


}
