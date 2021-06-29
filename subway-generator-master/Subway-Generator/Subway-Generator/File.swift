//
//  File.swift
//  Subway-Generator
//
//  Created by Matt Frohman on 3/8/21.
//

import SwiftUI

struct preferenceView: View {
    @EnvironmentObject var ingredients : Generator
  private var dietList = ["pesc", "keto", "vegan", "vegetarian", "lactose", "gluten", "paleo", "medi", "kosher", "halal"]
    @State private var tempSelection: Set<IdentifiableString> = Set([].map { IdentifiableString(string: $0) })
    @State private var breadSelection: Set<IdentifiableString> = Set([].map { IdentifiableString(string: $0) })
    //@State private var meatSelection = 0
    @State private var proteinSelected: Set<IdentifiableString> = Set([].map { IdentifiableString(string: $0) })
    @State private var cheeseSelected: Set<IdentifiableString> = Set([].map { IdentifiableString(string: $0) })
    @State private var veggieSelected: Set<IdentifiableString> = Set([].map { IdentifiableString(string: $0) })
    @State private var sauceSelected: Set<IdentifiableString> = Set([].map { IdentifiableString(string: $0) })
    @State private var seasoningSelected: Set<IdentifiableString> = Set([].map { IdentifiableString(string: $0) })
    @State private var extraSelected: Set<IdentifiableString> = Set([].map { IdentifiableString(string: $0) })
    @State private var dietSelection: Set<IdentifiableString> = Set([].map { IdentifiableString(string: $0) })
  @State private var calroies: String = ""
  
    @State private var diets: [String] = []

    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                // https://dev.to/jeehut/multi-selector-in-swiftui-5heg
                // ^ multi selector for meats
                
                // multi selector here
                Image("subwaylogo2").resizable().frame(width: 300, height: 200, alignment: .center).padding(.top, 20)
                Text("Want something to be randomly generated?").font(.headline).multilineTextAlignment(.center).padding([.leading, .trailing], 10).padding(.top, -50)
                Text("Leave that section blank!").font(.headline).multilineTextAlignment(.center).padding(.top, -25)
                Group {
                    HStack {
                        Image("diet2").resizable().frame(width: 50, height: 50).padding(.leading, 50)
                        MultiSelector(label: Text("Select a diet"), options: dietList.map({ IdentifiableString(string: $0)}), optionToString: { $0.string }, numChoices: 3, selected: $dietSelection, currList: $diets).padding(-50).padding(.leading, 80).padding(.top, 60).environmentObject(ingredients).tag(1)
                    }.overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.yellow, lineWidth: 5))
                  
                    HStack {
                        Image("coloredTemp").resizable().frame(width: 50, height: 50).padding(.leading, 50)
                        MultiSelector(label: Text("Select hot or cold sub"), options: (ingredients.tempList).map { IdentifiableString(string: $0.name) }, optionToString: { $0.string }, numChoices: 1, selected: $tempSelection, currList: $ingredients.tempListPicker).padding(-50).padding(.leading, 50).padding(.top, 60)
                    }.overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.yellow, lineWidth: 5))
                    
                    HStack {
                        Image("coloredBread").resizable().frame(width: 50, height: 50).padding(.leading, 50)
                        MultiSelector(label: Text("Select a bread"), options: (ingredients.breadList).map { IdentifiableString(string: $0.name) }, optionToString: { $0.string }, numChoices: 1, selected: $breadSelection, currList: $ingredients.breadListPicker).padding(-50).padding(.leading, 75).padding(.top, 60)
                    }.overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.yellow, lineWidth: 5))
                    
                    HStack {
                        Image("coloredMeat").resizable().frame(width: 50, height: 50).padding(.leading, 50)
                        MultiSelector(label: Text("Choose Proteins"), options: (ingredients.proteinList).map { IdentifiableString(string: $0.name) }, optionToString: { $0.string }, numChoices: 2,selected: $proteinSelected, currList: $ingredients.proteinListPicker).padding(-50).padding(.leading, 70).padding(.top, 60)
                    }.overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.yellow, lineWidth: 5))
                    
                    HStack {
                        Image("coloredCheese").resizable().frame(width: 50, height: 50).padding(.leading, 50)
                        MultiSelector(label: Text("Choose Cheese"), options: (ingredients.cheeseList).map { IdentifiableString(string: $0.name) }, optionToString: { $0.string }, numChoices: 3,selected: $cheeseSelected, currList: $ingredients.cheeseListPicker).padding(-50).padding(.leading, 75).padding(.top, 60)
                    }.overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.yellow, lineWidth: 5))
                    
                    HStack {
                        Image("coloredVeggie").resizable().frame(width: 50, height: 50).padding(.leading, 50)
                        MultiSelector(label: Text("Choose Veggies"), options: (ingredients.veggieList).map { IdentifiableString(string: $0.name) }, optionToString: { $0.string }, numChoices: 5,selected: $veggieSelected, currList: $ingredients.veggieListPicker).padding(-50).padding(.leading, 75).padding(.top, 60)
                    }.overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.yellow, lineWidth: 5))
                    
                    HStack {
                        Image("coloredSauce").resizable().frame(width: 50, height: 50).padding(.leading, 50)
                        MultiSelector(label: Text("Choose Sauces"), options: (ingredients.sauceList).map { IdentifiableString(string: $0.name) }, optionToString: { $0.string }, numChoices: 4,selected: $sauceSelected, currList: $ingredients.sauceListPicker).padding(-50).padding(.leading, 75).padding(.top, 60)
                    }.overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.yellow, lineWidth: 5))
                    
                    HStack {
                        Image("coloredSeasoning").resizable().frame(width: 50, height: 50).padding(.leading, 50)
                        MultiSelector(label: Text("Choose Seasoning"), options: (ingredients.seasoningList).map { IdentifiableString(string: $0.name) }, optionToString: { $0.string }, numChoices: 4,selected: $seasoningSelected, currList: $ingredients.seasoningListPicker).padding(-50).padding(.leading, 65).padding(.top, 60)
                    }.overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.yellow, lineWidth: 5))
                    
                    HStack {
                        Image("coloredExtras").resizable().frame(width: 50, height: 50).padding(.leading, 50)
                        MultiSelector(label: Text("Choose Extras"), options: (ingredients.extraList).map { IdentifiableString(string: $0.name) }, optionToString: { $0.string }, numChoices: 3,selected: $extraSelected, currList: $ingredients.extraListPicker).padding(-50).padding(.leading, 75).padding(.top, 60)
                    }.overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.yellow, lineWidth: 5))
                  
                    TextField("Enter your calorie limit (if any)", text: $calroies, onEditingChanged: { (changed) in
                        if !changed {
                            
                        }
                    }).textFieldStyle(RoundedBorderTextFieldStyle()).keyboardType(.decimalPad)
                }.padding(5).padding([.leading, . trailing], 20)
                Group {
                  NavigationLink(destination: GenerateView(list: {
                    if Int(self.calroies) != nil && Int(self.calroies)! > 0 {
                        print(self.calroies, "peepee")
                        return [""]
                    } else {
                        return [""]
                    }
                  }, calroies).environmentObject(ingredients)) {
                      Text("Generate Sub!").foregroundColor(.yellow).fontWeight(.bold)
                  }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).overlay(RoundedRectangle(cornerRadius: 15)
                                                                                        .stroke(Color.yellow, lineWidth: 5)).environmentObject(ingredients).padding(.top, 20)
                }.environmentObject(ingredients).padding(.bottom, 20)
            }.frame(width: 400, height: 975, alignment: .center).padding([.top, .bottom], 300)
        }.frame(width: 400, height: 1200, alignment: .center).background(Color.green).environmentObject(ingredients)
    }
}

struct IdentifiableString: Identifiable, Hashable {
    let string: String
    var id: String { string }
}

struct MultiSelectionView<Selectable: Identifiable & Hashable>: View {
    let options: [Selectable]
    let optionToString: (Selectable) -> String
    let numChoices: Int
    @Binding var currList: [String]
    @EnvironmentObject var ingredients : Generator
//    var numSelected = 0

    @Binding var selected: Set<Selectable>

    var body: some View {
        Text("Please select no more than \(numChoices) choices")
        List {
            ForEach(options) { selectable in
                Button(action: { toggleSelection(selectable: selectable) }) {
                    HStack {
                        Text(optionToString(selectable)).foregroundColor(.black)
                        Spacer()
                        if selected.contains { $0.id == selectable.id } {
                            Image(systemName: "checkmark").foregroundColor(.accentColor)
                        }
                    }
                }.tag(selectable.id)
            }
        }.listStyle(GroupedListStyle())
    }

    private func toggleSelection(selectable: Selectable) {
        if let existingIndex = selected.firstIndex(where: { $0.id == selectable.id }) {
            let removed = selected.remove(at: existingIndex) as! IdentifiableString
            currList.removeAll(where: {$0 == removed.string})
            print(currList)
        } else if selected.count < numChoices {
            selected.insert(selectable)
            selected.forEach { (elem) in
              if !currList.contains((elem as! IdentifiableString).string) {
                currList.append((elem as! IdentifiableString).string)
                }
            }
            
            print(currList)
        }
      
      let strings = (self.options as! [IdentifiableString]).map({$0.string})
      if strings.first! == "pesc" {
            var diets: [Diet] = []
            for (_, e) in currList.enumerated() {
//              print(e.string)
              print(currList)
              let id = strings.firstIndex(of: e)
              print(Int(id!))
              diets.append(Diet(id: id! + 2)!)
            }
            print(diets)
//        print(ingredients.breadList.forEach({print($0.name)}))
            ingredients.dietType(diets: diets)
            print(ingredients.breadList.forEach({print($0.name)}))
        }    }
}

struct MultiSelector<LabelView: View, Selectable: Identifiable & Hashable>: View {
    let label: LabelView
    let options: [Selectable]
    let optionToString: (Selectable) -> String
    let numChoices: Int

    var selected: Binding<Set<Selectable>>
    var currList: Binding<[String]>

    /*private var formattedSelectedListString: String {
        ListFormatter.localizedString(byJoining: selected.wrappedValue.map { optionToString($0) })
    }*/

    var body: some View {
        NavigationLink(destination: multiSelectionView()) {
            HStack {
                label
                Spacer()
                //Text(formattedSelectedListString)
                    //.foregroundColor(.gray)
                    //.multilineTextAlignment(.trailing)
            }.padding()
        }
    }

    private func multiSelectionView() -> some View {
        MultiSelectionView(
            options: options,
            optionToString: optionToString,
            numChoices: numChoices, currList: currList, selected: selected
        )
    }
}

struct poopy_Previews: PreviewProvider {
    static var previews: some View {
        preferenceView()
    }
}
