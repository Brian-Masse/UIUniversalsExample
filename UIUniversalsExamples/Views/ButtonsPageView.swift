//
//  ButtonsPageView.swift
//  UIUniversalsExamples
//
//  Created by Brian Masse on 1/9/24.
//

import Foundation
import SwiftUI
import UIUniversals

//MARK: ButtonsPage
struct ButtonsPage: View {
    
    @State var tapped: Bool = false
    @State var option1: Bool = true
    
    @ViewBuilder
    private func makeLargeTextButtonDisplay<C: View>( text: String, button: () -> C ) -> some View {
        VStack {
            button()
            UniversalText(text, size: Constants.UIDefaultTextSize, font: ProvidedFont.renoMono, textAlignment: .center)
        }
    }
    
//    MARK: Body
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                
//                MARK: LargeTextButton
                UniversalText("LargeTextButton",
                              size: Constants.UISubHeaderTextSize,
                              font: ProvidedFont.madeTommyRegular)
                
                ScrollView(.horizontal) {
                    HStack(spacing: -15) {
                        makeLargeTextButtonDisplay(text: "Default") {
                            LargeTextButton("hel lo", at: 30) { print("hello world") }
                        }
                        
                        makeLargeTextButtonDisplay(text: "customized \narrow") {
                            LargeTextButton("ho wdy", at: 30,
                                            verticalTextAlignment: .top,
                                            arrowDirection: .up,
                                            arrowWidth: 8,
                                            color: Colors.yellow) { print("howdy world") }
                        }
                        
                        makeLargeTextButtonDisplay(text: "customized \nshape") {
                            LargeTextButton( "ho la", at: 60,
                                             aspectRatio: 1.5,
                                             verticalTextAlignment: .bottom,
                                             arrowDirection: .up,
                                             style: .secondary) { print("hola world") }
                        }
                        
                        makeLargeTextButtonDisplay(text: "customized \nstyle") {
                            LargeTextButton("bon jour", at: 0,
                                            aspectRatio: 1.9, verticalTextAlignment: .center,
                                            arrow: false,
                                            style: .transparent) { print("bonjour world") }
                        }
                    }
                    .padding(.bottom)
                }
                
                Divider()
                
//                MARK: RoundedButton
                UniversalText("RoundedButton",
                              size: Constants.UISubHeaderTextSize,
                              font: ProvidedFont.madeTommyRegular)
                
                ScrollView(.horizontal) {
                    HStack() {
                        makeLargeTextButtonDisplay(text: "default") {
                            LargeRoundedButton("hello", icon: "globe.americas") { print("hello world") }
                        }
                        
                        makeLargeTextButtonDisplay(text: "animated") {
                            LargeRoundedButton("howdy", to: "tapped!",
                                               icon: "lasso", to: "checkmark",
                                               style: .secondary) { tapped } action: {
                                tapped.toggle()
                            }
                        }
                        
                        makeLargeTextButtonDisplay(text: "custom shape") {
                            LargeRoundedButton("hola", icon: "", small: true, style: .transparent) {
                                print("hola world!")
                            }
                        }
                        
                        makeLargeTextButtonDisplay(text: "custom style") {
                            LargeRoundedButton("", icon: "arrow.up.right", color: Colors.yellow) {
                                print("Bonjour World")
                            }
                        }
                    }
                }
                
                Divider()
                
//                MARK: UnderlinedButton
                UniversalText( "UnderlinedButton",
                               size: Constants.UISubHeaderTextSize,
                               font: ProvidedFont.madeTommyRegular)
                    .padding(.bottom, 5)
                
                HStack {

                    UnderlinedButton("Option 1",
                                     icon: "person.and.background.striped.horizontal",
                                     scale: false) { option1 } action: { option1 = true }

                    UnderlinedButton( "option 2",
                                      icon: "",
                                      scale: false) { !option1 } action: { option1 = false }
                }
            }
            .padding(.bottom, 30)
        }
        .padding(.horizontal)
    }
}
