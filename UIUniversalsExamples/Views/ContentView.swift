//
//  ContentView.swift
//  UIUniversalsExamples
//
//  Created by Brian Masse on 12/29/23.
//

import SwiftUI
import UIUniversals

struct ContentView: View {
    
    init() { ProvidedFont.registerFonts() }
    
    @State var scrollPoint: CGPoint = .zero
    @State var buttonToggled: Bool = false
    
//    MARK: Page
    enum Page: String, CaseIterable, Identifiable {
        case buttons
        case viewModifiers = "views"
        case utilities
        
        var id: String {
            self.rawValue
        }
    }
    
    @State var activePage: Page = .utilities
    
//    MARK: Body
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack {
                UniversalText("UIUniversals Example",
                              size: Constants.UIHeaderTextSize,
                              font: ProvidedFont.syneHeavy,
                              case: .uppercase)
                .padding(.bottom)
                
                Divider()
                
                HStack() {
                    ForEach( Page.allCases ) { page in
                        UnderlinedButton( page.rawValue, scale: true ) { activePage == page } action: {
                            activePage = page
                        }
                    }
                }
            }
            .padding(.horizontal)

            TabView(selection: $activePage) {
                ButtonsPage().tag(Page.buttons)
                ViewModifiersView().tag(Page.viewModifiers)
                UtilitiesPage().tag(Page.utilities)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Spacer()
            
        }
        .universalTextStyle()
        .universalImageBackground( universalImage("test") )
        
        
//        let data = makeRandomData()
//        
//        ScrollReader($scrollPoint) {
//            VStack {
//                HStack {
//                    UniversalText( "Hello World!",
//                                   size: Constants.UISubHeaderTextSize,
//                                   font: ProvidedFont.syneHeavy )
//                    
//                    Image(systemName: "globe.americas")
//                    
//                    Spacer()
//                }
//                .rectangularBackground(style: .transparent, shadow: true)
//                .padding(.bottom)
//                
//                HStack {
//                    Text("manual RectangularBackground")
        //                    Image(systemName: "globe.europe.africa")
//                }
//                .padding()
//                .background(
//                    Colors.secondaryLight
//                        .cornerRadius(50, corners: [ .topRight, .bottomLeft ])
//                )
//                .padding(.bottom)
//                
//                Divider()
//                
////                WrappedHStack(collection: data, spacing: 5) { obj in
////                    UniversalText( obj.data, size: Constants.UIDefaultTextSize, font: ProvidedFont.renoMono )
////                        .rectangularBackground(7, style: .secondary, stroke: true)
////                }
////                Divider()
//                
//                Spacer()
//                
//                UniversalText( "\(scrollPoint.y)", size: Constants.UIDefaultTextSize, font: ProvidedFont.renoMono )
//                
//                
                
//                
//                LargeRoundedButton("hello",
//                                   to: "complete",
//                                   icon: "arrow.forward",
//                                   to: "checkmark",
//                                   wide: true,
//                                   small: false,
//                                   style: .transparent) { buttonToggled } action: {
//                    buttonToggled.toggle()
//                }
//
//                
//                UnderlinedButton( "hello", condition: {true}) {}
//                
//            }
//            .padding()
//        }
//        .universalTextStyle(reversed: false)
//        .universalImageBackground( universalImage("test") )
    }
}

#Preview {
    ContentView()
}
