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
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                
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
        }
        .padding(.horizontal)
    }
}

//MARK: ViewModifiersView
struct ViewModifiersView: View {
    
    @ViewBuilder
    private func makeDisplay<C: View>(_ title: String, view: () -> C) -> some View {
        VStack {
            view()
            UniversalText( title, size: Constants.UIDefaultTextSize, font: ProvidedFont.renoMono, textAlignment: .center )
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
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
            
            Spacer()
            
            HStack {
                Spacer()
            }
            
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    ContentView()
}
