//
//  OnboardingContent.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 19/04/23.
//

import Foundation
import SwiftUI

struct OnboardingContent: View {

@State private var currentTab = 0

    var body: some View {
        NavigationView{
            TabView(selection: $currentTab,
                    content: {
                ForEach(OnboardingData.list) {
                    viewData in OnboardingView(data: viewData, currentTabIndex: $currentTab)
                        .tag(viewData.id)
                }
            })
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }.navigationViewStyle(.stack)
        }

}
