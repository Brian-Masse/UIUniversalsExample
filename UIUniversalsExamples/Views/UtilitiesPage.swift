//
//  UtilitiesPage.swift
//  UIUniversalsExamples
//
//  Created by Brian Masse on 1/9/24.
//

import Foundation
import SwiftUI
import UIUniversals

//MARK: UtilitiesPage
struct UtilitiesPage: View {
    
    @State var scrollViewPosition: CGPoint = .zero
    
    @ViewBuilder
    private func functionDemonstrator(label: String, input: String, output: String) -> some View {
        VStack(alignment: .leading) {
            if !label.isEmpty {
                UniversalText(label, size: Constants.UIDefaultTextSize, font: ProvidedFont.syneHeavy)
            }
            
            HStack {
                
                Spacer()
                UniversalText(input, size: Constants.UISmallTextSize, font: ProvidedFont.renoMono)
                Spacer()
                ResizeableIcon("arrow.right", size: Constants.UIDefaultTextSize)
                Spacer()
                UniversalText(output, size: Constants.UISmallTextSize, font: ProvidedFont.renoMono)
                Spacer()
            }
        }
        .padding(.bottom, 7)
    }
    
//    MARK: Body
    var body: some View {
        
        ScrollReader($scrollViewPosition) {
            VStack(alignment: .leading) {
                
//                MARK: Rotated Layout
                UniversalText("Rotated Layout",
                              size: Constants.UISubHeaderTextSize,
                              font: ProvidedFont.madeTommyRegular)
                
                HStack {
                    Spacer()
                    VStack {
                        
                        UniversalText( "Rotated \nText",
                                       size: Constants.UIHeaderTextSize,
                                       font: ProvidedFont.syneHeavy,
                                       case: .uppercase,
                                       textAlignment: .center,
                                       lineSpacing: -20)
                        .rotationEffect(.degrees(-90))
                        .border(.blue)
                        
                        UniversalText("Plain \nrotation effect",
                                      size: Constants.UIDefaultTextSize,
                                      font: ProvidedFont.renoMono,
                                      textAlignment: .center)
                        .offset(y: 80)
                    }
                    
                    Spacer()
                    
                    VStack {
                        RotatedLayout(at: Double.pi / 2) {
                            UniversalText( "Rotated \nText",
                                           size: Constants.UIHeaderTextSize,
                                           font: ProvidedFont.syneHeavy,
                                           case: .uppercase,
                                           textAlignment: .center,
                                           lineSpacing: -20)
                            .rotationEffect(.degrees(-90))
                        }
                        .border(.blue)
                        
                        UniversalText("Rotated Layout \nView",
                                      size: Constants.UIDefaultTextSize,
                                      font: ProvidedFont.renoMono,
                                      textAlignment: .center)
                    }
                }
                
                Divider()
                
//                MARK: ScrollReader
                UniversalText("ScrollReader",
                              size: Constants.UISubHeaderTextSize,
                              font: ProvidedFont.madeTommyRegular)
                .padding(.bottom, 5)
                
                HStack {
                    VStack(alignment: .leading) {
                        UniversalText("Current Scroll Postion:",
                                      size: Constants.UIDefaultTextSize,
                                      font: ProvidedFont.syneHeavy)
                        
                        UniversalText( "Scroll screen to upate",
                                       size: Constants.UISmallTextSize,
                                       font: ProvidedFont.renoMono)
                    }
                    Spacer()
                    
                    UniversalText("\(scrollViewPosition.y.rounded(.down))",
                                  size: Constants.UIDefaultTextSize,
                                  font: ProvidedFont.syneHeavy)
                    .rectangularBackground(style: .accent)
                }
                
                Divider()
                
//                MARK: Extensions
                UniversalText( "Extensions",
                               size: Constants.UISubHeaderTextSize,
                               font: ProvidedFont.madeTommyRegular)
    
                
                let number = 17813153811
                let phoneNumber = number.formatIntoPhoneNumber()
                functionDemonstrator(label: "Int: .formatIntoPhoneNumber", input: "\(number)", output: phoneNumber)
                
                functionDemonstrator(label: "double, float: .round(to:)", input: "5.56789", output: "5.568")
                functionDemonstrator(label: "", input: "5.56789", output: "5.0")
                
                functionDemonstrator(label: "string: .removeFirst(of:)", input: "hello, h", output: "ello")
                functionDemonstrator(label: "", input: "hello, l", output: "helo")
            }
            .padding(.horizontal)
        }
    }
}
