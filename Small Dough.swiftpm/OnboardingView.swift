//
//  OnboardingView.swift
//  Small Dough
//
//  Created by Stephane Girão Linhares on 19/04/23.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    var data: OnboardingData
    @Binding var currentTabIndex: Int

    var body: some View {
        VStack(spacing: 20) {
                 Image(data.objectImage)
                     .resizable()
                     .scaledToFit()
                     .offset(x: 0, y: 50)


             Spacer()

             Text(data.primaryText)
                .font(.largeTitle)
                 .bold()
                 .foregroundColor(Color(red: 41 / 255, green: 52 / 255, blue: 73 / 255))

             Text(data.secondaryText)
                .font(.title)
                 .multilineTextAlignment(.center)
                 .frame(maxWidth: 500)
                 .foregroundColor(Color(red: 45 / 255, green: 50 / 255, blue: 73 / 255))
                 .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)

             Spacer()

             Button(action: {
                 // Add action for button
                 if currentTabIndex < OnboardingData.list.count-1 {
                     currentTabIndex += 1
                 } else {
                     // Ir pra tela
                    
                 }
             }, label: {
                 Text("Get Started")
                     .font(.headline)
                     .foregroundColor(.white)
                     .padding(.horizontal, 50)
                     .padding(.vertical, 16)
                     .background(
                         RoundedRectangle(cornerRadius: 20)
                             .foregroundColor(
                                 Color(
                                     red: 255 / 255,
                                     green: 115 / 255,
                                     blue: 115 / 255
                                 )
                             )
                     )
             })
             .buttonStyle(PlainButtonStyle())
             .shadow(radius: 10)

             Spacer()
            Spacer()
         }
    }

}
