//
//  ContentView.swift
//  Subway-Generator
//
//  Created by Nathan Kent on 3/2/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var ingredients : Generator
    var body: some View {
        NavigationView {
            VStack() {
                VStack {
                    ZStack {
                        Image("sub1")
                        Image("subwaylogo2").resizable().frame(width: 300, height: 200, alignment: .center).padding(.top, -260)
                        Text("Have it (kinda) your way!").font(.caption).fontWeight(.black).padding(.top, -120)
                    }.padding(.top, -75)
                    VStack {
                        Text("Click below to create your completely random sub!").font(.subheadline).fontWeight(.semibold).multilineTextAlignment(.center).padding().frame(width: /*@START_MENU_TOKEN@*/250.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/).padding(.bottom, -30)
                        NavigationLink(destination: GenerateView(list: {
                            return ingredients.randomize(cals: 5000, recur: 20, chosen: [ingredients.tempListPicker, ingredients.breadListPicker, ingredients.proteinListPicker, ingredients.cheeseListPicker, ingredients.veggieListPicker, ingredients.sauceListPicker, ingredients.seasoningListPicker, ingredients.extraListPicker])!
                        }, "").environmentObject(ingredients)) {
                            //Button(action: {  }) {
                            Text("Generate a sub!").foregroundColor(.yellow).fontWeight(.bold)//.background(Image("arrows2").resizable().frame(width: 155, height: 48, alignment: .center))
                            //}
                        }.padding().overlay(RoundedRectangle(cornerRadius: 15)
                                                                            .stroke(Color.yellow, lineWidth: 5)).environmentObject(ingredients)
                        Text("Have dietary restrictions or need to narrow it down? Click below.").font(.subheadline).fontWeight(.semibold).multilineTextAlignment(.center).padding().frame(width: 250.0).padding(-10)
                        NavigationLink(destination: preferenceView()) {
                            Text("Preferences?").foregroundColor(.yellow).fontWeight(.bold)
                        }.padding().overlay(RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color.yellow, lineWidth: 5)).environmentObject(ingredients)
                        Image("sublogo2").resizable().frame(width: 60, height: 60, alignment: .center).padding(.top, 20)
                    }.padding(.top, -110)//.border(Color.yellow, width: 10)
                }.frame(width: 450, height: 850, alignment: .center).overlay(RoundedRectangle(cornerRadius: 75)
                                                                                .stroke(Color.yellow, lineWidth: 100)).padding(.top, -150).padding(.bottom, -50)
            }.frame(width: 400, height: 1200, alignment: .center).background(Color.green).environmentObject(ingredients)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
