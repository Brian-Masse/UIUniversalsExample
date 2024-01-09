//
//  ContentView.swift
//  UIUniversalsExamples
//
//  Created by Brian Masse on 12/29/23.
//

import SwiftUI
import UIUniversals

@available(iOS 15.0, *)
private struct TestView: View {
    
    init() { ProvidedFont.registerFonts() }
    
    struct TestData: Identifiable, Equatable {
        var data: String = ""
        let uuid: UUID = UUID()
        
        var id: UUID {
            self.uuid
        }
        
        init() {
            let random = Int.random(in: 0...6)
            for _ in 0...random {
                data += "0"
            }
        }
    }
    
    private func makeRandomData() -> [TestData] {
        
//        let test = Colors.makeColor
        
        var list: [TestData] = []
        for _ in 0...30 { list.append(TestData()) }
        return list
    }
    
    @State var scrollPoint: CGPoint = .zero
    @State var buttonToggled: Bool = false
    
    var body: some View {
        
        let data = makeRandomData()
        
        ScrollReader($scrollPoint) {
            VStack {
                HStack {
                    UniversalText( "Hello World!",
                                   size: Constants.UISubHeaderTextSize,
                                   font: ProvidedFont.syneHeavy )
                    
                    Image(systemName: "globe.americas")
                    
                    Spacer()
                }
                .rectangularBackground(style: .transparent, shadow: true)
                .padding(.bottom)
                
                HStack {
                    Text("manual RectangularBackground")
                    Image(systemName: "globe.europe.africa")
                }
                .padding()
                .background(
                    Colors.secondaryLight
                        .cornerRadius(50, corners: [ .topRight, .bottomLeft ])
                )
                .padding(.bottom)
                
                Divider()
                
//                WrappedHStack(collection: data, spacing: 5) { obj in
//                    UniversalText( obj.data, size: Constants.UIDefaultTextSize, font: ProvidedFont.renoMono )
//                        .rectangularBackground(7, style: .secondary, stroke: true)
//                }
//                Divider()
                
                Spacer()
                
                UniversalText( "\(scrollPoint.y)", size: Constants.UIDefaultTextSize, font: ProvidedFont.renoMono )
                
                
                LargeTextButton("hel lo", at: 45, 
                                aspectRatio: 1.5,
                                verticalTextAlignment: .bottom,
                                arrowDirection: .up,
                                arrowWidth: 5) { }
                
                LargeRoundedButton("hello",
                                   to: "complete",
                                   icon: "arrow.forward",
                                   to: "checkmark",
                                   wide: true,
                                   small: false,
                                   style: .transparent) { buttonToggled } action: {
                    buttonToggled.toggle()
                }

                
            }
            .padding()
        }
        .universalTextStyle(reversed: false)
        .universalImageBackground( universalImage("test") )
    }
}


struct ContentView: View {
    var body: some View {
        TestView()
    }
}


#Preview {
    ContentView()
}
