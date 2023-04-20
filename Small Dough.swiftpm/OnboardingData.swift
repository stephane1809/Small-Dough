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
            OnboardingData(id: 0, objectImage: "et_talk_0000", primaryText: "Hi, my name is Doo!", secondaryText: "Let's make buns for my Alien Dough bakery using basic math operations?"),
            OnboardingData(id: 1, objectImage: "select_operation", primaryText: "Choose the math operation", secondaryText: "Click on the mass to carry out the operation and don't forget to deactivate it afterwards"),
            OnboardingData(id: 2, objectImage: "arrastar", primaryText: "Drag the masses to add", secondaryText: "Put the masses in count to add. You can only drag masses if no math operation is enabled"),
            OnboardingData(id: 3, objectImage: "conseguiu", primaryText: "Arrive at the requested amount", secondaryText: "Put the masses in count to add. You can only drag masses if no math operation is enabled")
        ]

}
