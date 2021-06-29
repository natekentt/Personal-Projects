//
//  Generate.swift
//  Subway-Generator
//
//  Created by Matt Frohman on 3/9/21.
//

import SwiftUI
import Foundation

struct GenerateView: View {
    @EnvironmentObject var ingredients : Generator
    var list : [String]
    var max = ""
    @State var calories: String = ""
    @State var legit = true
    @State var poo: [String] = ["p"]
    
    init(list : () -> [String], _ calories : String) {
        self.list = list()
        self.max = calories
    }
    
    var body: some View {
        ScrollView(.vertical) {
            ZStack {
                
                VStack {
                    
                  if legit {
                    Text("Enjoy your sub!").font(.headline).fontWeight(.bold).underline()
                    ForEach((0..<poo.count), id: \.self) { i in
                        Text(poo[i]).font(.caption).fontWeight(.bold).padding(5)
                    }
                    Text("Total calories: \(self.calories)").font(.headline).fontWeight(.bold)
                    //Text("\(ingredients.$finalCals)").font(.headline).fontWeight(.bold)
                  } else {
                    Text("There are no subs that meet this criteria. Please consider increasing your calorie limit or picking different preffered ingredients!").font(.caption2).fontWeight(.bold).frame(width: 150).padding(3)
                  }
                }.frame(width: 400, height: (legit) ? 900 : UIScreen.main.bounds.height - 200, alignment: .center).background(Color.green).overlay(RoundedRectangle(cornerRadius: 15)
                                                                                                        .stroke(Color.yellow, lineWidth: 75))
              //if legit {
                Group {
                      Image("sub1").resizable().frame(width: 80, height: 80, alignment: .center).padding(.leading, -150).padding(.top, -75)
                      Image("sub1").resizable().frame(width: 80, height: 80, alignment: .center).padding(.leading, 200)
                      Image("sub1").resizable().frame(width: 80, height: 80, alignment: .center).padding(.leading, 250).padding(.top, -250)
                      Image("sub1").resizable().frame(width: 80, height: 80, alignment: .center).padding(.leading, 250).padding(.top, 350)
                      Image("sub1").resizable().frame(width: 80, height: 80, alignment: .center).padding(.leading, -175).padding(.top, 350)
                      Image("sub1").resizable().frame(width: 80, height: 80, alignment: .center).padding(.leading, -175).padding(.top, -250)
                      Image("subwaylogo2").resizable().frame(width: 300, height: 200, alignment: .center).padding(.top, -460)
                  }
              //}
            }
        }.frame(width: 300).onAppear {
          print(self.calories, "poopy!")
          
          if Int(self.max) != nil && Int(self.max)! > 0 {
              poo = ingredients.randomize(cals: Double(Int(self.max)!), recur: 20, chosen: [ingredients.tempListPicker, ingredients.breadListPicker, ingredients.proteinListPicker, ingredients.cheeseListPicker, ingredients.veggieListPicker, ingredients.sauceListPicker, ingredients.seasoningListPicker, ingredients.extraListPicker]) ?? ["There are no subs that meet this criteria. Please consider increasing your calorie limit or picking different preffered ingredients!"]
          } else {
              poo = ingredients.randomize(cals: 5000, recur: 20, chosen: [ingredients.tempListPicker, ingredients.breadListPicker, ingredients.proteinListPicker, ingredients.cheeseListPicker, ingredients.veggieListPicker, ingredients.sauceListPicker, ingredients.seasoningListPicker, ingredients.extraListPicker]) ?? ["There are no subs that meet this criteria. Please consider increasing your calorie limit or picking different preffered ingredients!"]
            
            var total = 0
            for ingredient in poo {
              for ingr in ingredients.breadList + ingredients.cheeseList + ingredients.extraList + ingredients.sauceList + ingredients.veggieList + ingredients.proteinList + ingredients.seasoningList + ingredients.tempList {
                if ingredient == ingr.name {
                  total += Int(ingr.cals)
                }
              }
            }
            self.calories = String(total)
          }
        
          legit = (poo[0].contains("There")) ? false : true
        
          
      }
    }
}

