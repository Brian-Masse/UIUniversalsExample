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
        "Brian", "joe", "Gio", "Sam", "Richard", "Aanika :)", "Alex", "Finn", "Rowan", "Ben", "Owen", "Lora", "Chey"
    ]
    
    @ViewBuilder
    private func makeDisplay<C: View>(_ title: String, view: () -> C) -> some View {
        VStack {
            view()
            UniversalText( title, size: Constants.UIDefaultTextSize, font: ProvidedFont.renoMono, textAlignment: .center )
        }
    }
    
    @ViewBuilder
    private func makeRectangularBackgroundContent(label: String) -> some View {
        HStack {
            Spacer()
            Image(systemName: "globe.americas")
            
            UniversalText( label, size: Constants.UIDefaultTextSize, font: ProvidedFont.syneHeavy )
            
            Image(systemName: "globe.europe.africa")
            Spacer()
        }
    }
    
    @ViewBuilder
    private func makeRectangularBackgroundDemonstration<C: View>( title: String, contentBuilder: () -> C ) -> some View {
        VStack {
            
            contentBuilder()
                .padding(.bottom, 5)
            
            UniversalText( title, size: Constants.UISmallTextSize, font: ProvidedFont.renoMono )
                .padding(.leading)
        }
        .padding(.bottom, 7)
    }
    
    @ViewBuilder
    
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

//                MARK: ViewModifiers
                UniversalText( "ViewModifiers",
                               size: Constants.UISubHeaderTextSize,
                               font: ProvidedFont.madeTommyRegular)
                .padding(.bottom, 7)
                
                UniversalText( ".rectangularBackground",
                               size: Constants.UIDefaultTextSize,
                               font: ProvidedFont.syneHeavy)
                
                makeRectangularBackgroundDemonstration(title: "default") {
                    makeRectangularBackgroundContent(label: "Hello world!")
                        .rectangularBackground()
                }
                
                makeRectangularBackgroundDemonstration(title: "custom shape") {
                    makeRectangularBackgroundContent(label: "Howdy world!")
                        .rectangularBackground(7, style: .secondary,
                                               cornerRadius: 40,
                                               corners: [.topRight, .bottomLeft])
                }
                
                makeRectangularBackgroundDemonstration(title: "custom style") {
                    makeRectangularBackgroundContent(label: "hola world!")
                        .rectangularBackground(20,
                                               style: .accent,
                                               shadow: true)
                }
                
                makeRectangularBackgroundDemonstration(title: "custom stroke") {
                    makeRectangularBackgroundContent(label: "bonjour world!")
                        .rectangularBackground(style: .transparent,
                                               stroke: true,
                                               strokeWidth: 5,
                                               cornerRadius: 20,
                                               corners: [.topRight, .topLeft],
                                               texture: true,
                                               shadow: true)
                }
                
                Divider()
                
//                MARK: UniversalTextStyle
                UniversalText( ".universalTextStyle",
                               size: Constants.UIDefaultTextSize,
                               font: ProvidedFont.syneHeavy)
                
                HStack {
                    UniversalText( "standard universalTextStyle keeps text black on light mode and white in dark mode",
                                   size: Constants.UISmallTextSize,
                                   font: ProvidedFont.renoMono)
                    .universalTextStyle()
                    .padding(.trailing)
                    
                    UniversalText( "reversed universalTextStyle keeps text white on light mode and black in dark mode",
                                   size: Constants.UISmallTextSize,
                                   font: ProvidedFont.renoMono)
                    .universalTextStyle(reversed: true)
                    .padding(.leading)
                }
                
                Divider()
                
                UniversalText( ".universalStyledBackground",
                               size: Constants.UIDefaultTextSize,
                               font: ProvidedFont.syneHeavy)
                
                VStack {
                    UniversalText( "universal Background switches switches between the light and dark variants of the specified color pallet.",
                                   size: Constants.UISmallTextSize,
                                   font: ProvidedFont.renoMono)
                    .universalStyledBackgrond(.secondary)
                    
                    UniversalText("custom colors",
                                  size: Constants.UISmallTextSize,
                                  font: ProvidedFont.renoMono)
                    .universalStyledBackgrond(.accent, color: Colors.yellow)
                    
                    UniversalText("custom foreground",
                                  size: Constants.UISmallTextSize,
                                  font: ProvidedFont.renoMono)
                    .universalStyledBackgrond(.accent)
                    .universalStyledBackgrond(.accent, color: Colors.yellow, onForeground: true)
                }.padding(.horizontal)

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
