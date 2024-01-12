//
//  ContentView.swift
//  UIUniversalsExamples
//
//  Created by Brian Masse on 12/29/23.
//

import SwiftUI
import UIUniversals

struct ContentView: View {
    
    init() { FontProvider.registerFonts() }
    
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
    
    @State var activePage: Page = .viewModifiers
    
//    MARK: Body
    var body: some View {
        
        VStack(alignment: .leading) {
            
            VStack {
                UniversalText("UIUniversals Example",
                              size: Constants.UIHeaderTextSize,
                              font: FontProvider[.syneHeavy],
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
    }
}

#Preview {
    ContentView()
}


struct Verona: UniversalFont {
    public static var shared: UniversalFont = Verona()
    
    var postScriptName: String = "VeronaSerial"
    var fontExtension: String = "otf"
}
