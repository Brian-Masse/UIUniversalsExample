//
//  ViewModifiersPageView.swift
//  UIUniversalsExamples
//
//  Created by Brian Masse on 1/9/24.
//

import Foundation
import SwiftUI
import UIUniversals


//MARK: ViewModifiersView
struct ViewModifiersView: View {
    
    let wrappedHStackData: [String] = [
        "Brian", "joe", "TJ", "Sam", "Richard", "aanika", "Alex", "Finn", "Rowan", "Ben", "Owen", "Lora", "Chey"
    ]
    
    @ViewBuilder
    private func makeDisplay<C: View>(_ title: String, view: () -> C) -> some View {
        VStack {
            view()
            UniversalText( title, size: Constants.UIDefaultTextSize, font: ProvidedFont.renoMono, textAlignment: .center )
        }
    }
    
//    MARK: Body
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                
//                MARK: UniversalText
                UniversalText( "UniversalText",
                               size: Constants.UISubHeaderTextSize,
                               font: ProvidedFont.madeTommyRegular)
                .padding(.bottom, 7)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        makeDisplay("default") {
                            UniversalText( "Hello world!", size: Constants.UISubHeaderTextSize )
                        }
                        
                        makeDisplay("custom styling") {
                            UniversalText("Howdy \nworld!",
                                          size: Constants.UIDefaultTextSize,
                                          font: ProvidedFont.syneHeavy,
                                          case: .uppercase)
                        }
                        
                        makeDisplay("custom wrapping + scaling") {
                            UniversalText("hola world!",
                                          size: Constants.UIHeaderTextSize,
                                          font: ProvidedFont.renoMono,
                                          wrap: false,
                                          fixed: true,
                                          scale: true)
                        }
                        
                        makeDisplay("custom line spacing") {
                            UniversalText("Bonjour \nworld",
                                          size: Constants.UISubHeaderTextSize,
                                          font: ProvidedFont.madeTommyRegular,
                                          case: .uppercase,
                                          wrap: true,
                                          textAlignment: .center,
                                          lineSpacing: -15)
                        }
                    }
                    .padding(.bottom)
                }
                Divider()
                
//                MARK: ResizeableIcon
                UniversalText("ResizeableIcon",
                              size: Constants.UISubHeaderTextSize,
                              font: ProvidedFont.madeTommyRegular)
                
                HStack {
                    Spacer()
                    ResizeableIcon( "arrow.up.right.bottomleft.rectangle", size: Constants.UIDefaultTextSize )
                    Spacer()
                    ResizeableIcon( "arrow.up.right.bottomleft.rectangle", size: Constants.UISubHeaderTextSize )
                    Spacer()
                    ResizeableIcon( "arrow.up.right.bottomleft.rectangle", size: Constants.UIHeaderTextSize )
                    Spacer()
                    ResizeableIcon( "arrow.up.right.bottomleft.rectangle", size: Constants.UITitleTextSize )
                    Spacer()
                }
                
                Divider()
                
//                MARK: WrappedHStack
                UniversalText( "WrappedHStack",
                               size: Constants.UISubHeaderTextSize,
                               font: ProvidedFont.madeTommyRegular)
                
                
                
                WrappedHStack(collection: wrappedHStackData, spacing: 10) { name in
                    UniversalText(name,
                                  size: Constants.UIDefaultTextSize,
                                  font: ProvidedFont.syneHeavy)
                    .padding(.horizontal)
                    .rectangularBackground(10, style: .accent)
                }
                
                Divider()
                
            }
        }
        .padding(.horizontal)
        
    }
}
