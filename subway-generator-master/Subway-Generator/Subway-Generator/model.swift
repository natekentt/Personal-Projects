//
//  model.swift
//  Subway-Generator
//
//  Created by Nathan Kent on 3/2/21.
//

import Foundation

public enum Diet {
    //This enum represents a given diet the user might have
    case none
    case pesc
    case keto
    case vegan
    case vegetarian
    case lactose
    case gluten
    case paleo
    case medi
    case kosher
    case halal
  
    init?(id : Int) {
        switch id {
        case 1: self = .none
        case 2: self = .pesc
        case 3: self = .keto
        case 4: self = .vegan
        case 5: self = .vegetarian
        case 6: self = .lactose
        case 7: self = .gluten
        case 8: self = .paleo
        case 9: self = .medi
        case 10: self = .kosher
        case 11: self = .halal
        default: return nil
        }
    }
}

class Ingredient {
    //This class contains information regarding the various nutrients in various ingredients which can be added to Subs.
    let name: String
    let cals: Double

    init(_ newName:String, _ newCals:Double) {
        name = newName
        cals = newCals
    }
}

class Generator: ObservableObject {
    var breadList: [Ingredient]
    var cheeseList: [Ingredient]
    var extraList: [Ingredient]
    var sauceList: [Ingredient]
    var veggieList: [Ingredient]
    var proteinList: [Ingredient]
    var seasoningList: [Ingredient]
    var tempList: [Ingredient]
    var diets: [Diet]? = nil
    @Published var breadListPicker: [String]
    @Published var cheeseListPicker: [String]
    @Published var extraListPicker: [String]
    @Published var sauceListPicker: [String]
    @Published var veggieListPicker: [String]
    @Published var proteinListPicker: [String]
    @Published var seasoningListPicker: [String]
    @Published var tempListPicker: [String]
    @Published var dietsPicker: [String]
    //@Published var finalCals: Int = 0
    init () {
        //The following nutrition info is obtained from https://www.subway.com/en-US/MenuNutrition/Nutrition/NutritionGrid
        breadList = [
            Ingredient("9-Grain Wheat", 71),
            Ingredient("Artisan Flatbread", 87),
            Ingredient("Gluten-Free Bread", 0),
            Ingredient("Italian", 65),
            Ingredient("Italian Herbs & Cheese", 76),
            Ingredient("Mini 9-Grain Wheat", 47),
            Ingredient("Mini Italian", 47),
            Ingredient("Spinach Wrap", 102),
            Ingredient("Tomato Basil Wrap", 102)
        ]
        cheeseList = [
            Ingredient("American Cheese", 11),
            Ingredient("Monterey Cheddar", 14),
            Ingredient("Pepperjack", 11),
            Ingredient("Provolone", 14),
            Ingredient("Swiss", 14)
        ]
        extraList = [
            Ingredient("Bacon", 15),
            Ingredient("Guacamole", 35),
            Ingredient("Pepperoni", 18)
        ]
        sauceList = [
            Ingredient("Caesar", 14),
            Ingredient("Chipotle Southwest", 14),
            Ingredient("Honey Mustard", 14),
            Ingredient("Light Mayonnaise", 15),
            Ingredient("Oil", 5),
            Ingredient("Ranch", 14),
            Ingredient("Red Wine Vinegar", 4),
            Ingredient("Regular Mayonnaise",  14),
            Ingredient("Subway® Vinaigrette", 14),
            Ingredient("Sweet Onion Sauce", 18),
            Ingredient("Yellow Mustard", 14)
        ]
        veggieList = [
            Ingredient("Banana Peppers", 4),
            Ingredient("Black Olives", 3),
            Ingredient("Cucumbers", 14),
            Ingredient("Green Peppers", 7),
            Ingredient("Jalapeños", 4),
            Ingredient("Lettuce", 21),
            Ingredient("Pickles", 9),
            Ingredient("Red Onions", 7),
            Ingredient("Spinach", 7),
            Ingredient("Tomatoes", 35)
        ]
        proteinList = [
            Ingredient("Bacon", 15),
            Ingredient("Bologna", 80),
            Ingredient("Capicola", 60),
            Ingredient("Chicken Strips", 100),
            Ingredient("Egg Patty", 60),
            Ingredient("Egg Salad", 370),
            Ingredient("Falafel", 320),
            Ingredient("Ham", 69),
            Ingredient("Meatballs", 260),
            Ingredient("Pepperoni", 80),
            Ingredient("Roast Beef", 320),
            Ingredient("Rotisserie Style Chicken", 350),
            Ingredient("Salami", 430),
            Ingredient("Sausage Patty", 80),
            Ingredient("Seafood Sensation", 420),
            Ingredient("Tuna Salad", 450),
            Ingredient("Turkey Breast", 110),
            Ingredient("Veggie Patty (Vegan)", 360),
            Ingredient("Veggie Patty (Non-Vegan)", 360)
        ]
        seasoningList = [
            Ingredient("Parmesan Cheese", 1),
            Ingredient("Oregano", 0),
            Ingredient("Salt", 0),
            Ingredient("Pepper", 0),
        ]
        tempList = [
            Ingredient("Warm Sub",0),Ingredient("Cold Sub",0)
        ]
        //arrays for each ingredient (bread array, cheese, etc), hashMap could be used for calories of each (key: ingredient, value: calories)
        
        breadListPicker = []
        cheeseListPicker = []
        extraListPicker = []
        sauceListPicker = []
        veggieListPicker = []
        proteinListPicker = []
        seasoningListPicker = []
        tempListPicker = []
        dietsPicker = []
    }
    

    func dietType(diets: [Diet]) {
        //caters sandwich generation to certain diet
        //modifies arrays to remove all that dont fit diets
        for restriction in diets {
            switch restriction {
            case .none: break
                // bread options
                // gluten free
            // gluten free can't have wheat
            case .gluten:
                breadList.removeAll(where: {$0.name == "9-Grain Wheat"})
                breadList.removeAll(where: {$0.name == "Artisan Flatbread"})
                breadList.removeAll(where: {$0.name == "Italian"})
                breadList.removeAll(where: {$0.name == "Italian Herbs & Cheese"})
                breadList.removeAll(where: {$0.name == "Mini 9-Grain Wheat"})
                breadList.removeAll(where: {$0.name == "Mini Italian"})
                breadList.removeAll(where: {$0.name == "Spinach Wrap"})
                breadList.removeAll(where: {$0.name == "Tomato-Basil Wrap"})
                breadList.removeAll(where: {$0.name == "Italian"})
                proteinList.removeAll(where: {$0.name == "Falafel"})
                proteinList.removeAll(where: {$0.name == "Meatballs"})
                proteinList.removeAll(where: {$0.name == "Rotisserie Style Chicken"})
                proteinList.removeAll(where: {$0.name == "Seafood Sensation"})
                proteinList.removeAll(where: {$0.name == "Veggie Patty (Vegan)"})
                proteinList.removeAll(where: {$0.name == "Veggie Patty (Non-Vegan)"})
            // no meat for medi or pesc
            case .pesc:
                extraList.removeAll(where: {$0.name == "Bacon"})
                extraList.removeAll(where: {$0.name == "Pepperoni"})
                proteinList.removeAll(where: {$0.name != "Egg Salad" && $0.name != "Egg Patty" && $0.name != "Falafel" && $0.name != "Seafood Sensation" && $0.name != "Tuna Salad" && $0.name != "Veggie Patty (Vegan)" && $0.name != "Veggie Patty (Non-Vegan)"})
            // paleo and keto don't eat carbs; alts are egg salad on bed of lettuce etc
            case .paleo:
                breadList.removeAll()
                cheeseList.removeAll()
            // paleo and keto don't eat carbs; alts are egg salad on bed of lettuce etc
            case .keto:
                breadList.removeAll()
                cheeseList.removeAll()
            case .vegan:
                cheeseList.removeAll()
                extraList.removeAll(where: {$0.name == "Bacon"})
                extraList.removeAll(where: {$0.name == "Pepperoni"})
                proteinList.removeAll(where: {$0.name != "Falafel" && $0.name != "Veggie Patty (Vegan)"})
                sauceList.removeAll(where: {$0.name == "Light Mayonnaise"})
                sauceList.removeAll(where: {$0.name == "Regular Mayonnaise"})
                sauceList.removeAll(where: {$0.name == "Chipotle Southwest"})
                sauceList.removeAll(where: {$0.name == "Ranch"})
                sauceList.removeAll(where: {$0.name == "Caesar"})
                sauceList.removeAll(where: {$0.name == "Honey Mustard"})
                proteinList.removeAll(where: {$0.name == "Veggie Patty (Non-Vegan)"})
            case .vegetarian:
                extraList.removeAll(where: {$0.name == "Bacon"})
                extraList.removeAll(where: {$0.name == "Pepperoni"})
                proteinList.removeAll(where: {$0.name != "Egg Salad" && $0.name != "Egg Patty" && $0.name != "Falafel" && $0.name != "Veggie Patty (Vegan)" && $0.name != "Veggie Patty (Non-Vegan)"})
            case .kosher:
                extraList.removeAll(where: {$0.name == "Bacon"})
                extraList.removeAll(where: {$0.name == "Pepperoni"})
                proteinList.removeAll() //Either this line goes, or all the ones after it. Which is it?
                proteinList.removeAll(where: {$0.name == "Bacon"})
                proteinList.removeAll(where: {$0.name == "Bologna"})
                proteinList.removeAll(where: {$0.name == "Capicola"})
                proteinList.removeAll(where: {$0.name == "Ham"})
                proteinList.removeAll(where: {$0.name == "Pepperoni"})
                proteinList.removeAll(where: {$0.name == "Salami"})
                proteinList.removeAll(where: {$0.name == "Sausage Patty"})
            case .lactose:
                cheeseList.removeAll()
                sauceList.removeAll(where: {$0.name == "Chipotle Southwest"})
                sauceList.removeAll(where: {$0.name == "Ranch"})
                sauceList.removeAll(where: {$0.name == "Light Mayonnaise"})
                sauceList.removeAll(where: {$0.name == "Regular Mayonnaise"})
            case .halal:
                extraList.removeAll(where: {$0.name == "Bacon"})
                extraList.removeAll(where: {$0.name == "Pepperoni"})
                proteinList.removeAll() //Either this line goes, or all the ones after it. Which is it?
                proteinList.removeAll(where: {$0.name == "Bacon"})
                proteinList.removeAll(where: {$0.name == "Bologna"})
                proteinList.removeAll(where: {$0.name == "Capicola"})
                proteinList.removeAll(where: {$0.name == "Ham"})
                proteinList.removeAll(where: {$0.name == "Pepperoni"})
                proteinList.removeAll(where: {$0.name == "Salami"})
                proteinList.removeAll(where: {$0.name == "Sausage Patty"})
            // sauce options
            // mayo fattening for Medi, dairy in Mayo for Vegan and lactose
            case .medi:
                cheeseList.removeAll()
                extraList.removeAll(where: {$0.name == "Bacon"})
                extraList.removeAll(where: {$0.name == "Pepperoni"})
                proteinList.removeAll()
                sauceList.removeAll(where: {$0.name == "Light Mayonnaise"})
                sauceList.removeAll(where: {$0.name == "Regular Mayonnaise"})
                
            }
            
        }
        
        
        func choices (chosen: [Ingredient]) {
            /*this function should go through all of the chosen ingredients in the array
             and only keep whats been chosen to randomize the sub
             For example: if Italian bread is selected, the rest of the bread choices should
             be eliminated from the bread array
             If you are unsure ask Nate
             */
        }
    }
    // was cals: Double = 1000, recur: Int = 0
    func randomize (cals: Double,recur: Int = 0, chosen: [[String]] = [[],[],[],[],[],[],[],[]]) -> [String]? { //On return nil, the program should inform the user that no sandwich with their specified calorie and dietary needs could be found
        //take the dietary restrictions from dietType (class arrays should already be updated), and then generate sanwiches until calorie goal is met
    
        if recur > 100 {
            return nil
        }
        
        /* NOTE the quantity can be more than 1 for: PROTEINS up to 2,
                                                    CHEESE up to 3
                                                    VEGGIES up to 5
                                                    SAUCES up to 4
                                                    SEASONING up to 4
                                                    EXTRAS up to 3*/
        var returnableList: [String] = []       // stores the final list of ingredients to be returned
        var currIngredients: [Int] = []         // stores the count of ingredients for each component of the sandwich
        var total : Double = 0
        // appending 0 for each component of the sandwich, as there are zero ingredients to start with
        // this way we can access specific indices that category with ingredients, and we can update them as we go
        currIngredients.append(0)       // Temperature
        currIngredients.append(0)       // Bread
        currIngredients.append(0)       // Proteins
        currIngredients.append(0)       // Cheese
        currIngredients.append(0)       // Veggies
        currIngredients.append(0)       // Sauces
        currIngredients.append(0)       // Seasoning
        currIngredients.append(0)       // Extras
        
        // this loop iterates through user preferences and updates currIngredients and returnableList appropriately
        var i = 0
        for subLst: [String] in chosen {                // iterate through each category of the sandwich
            for element: String in subLst {
                returnableList.append(element)          // add each ingredient specified by user to returnableList
                currIngredients[i] += 1                 // update number of ingredients for each category
                switch(i) {
                case 0:
                    break
                case 1:
                    for ingredient in breadList {
                        if ingredient.name == element {
                            total += ingredient.cals
                        }
                    }
                    break
                case 2:
                    for ingredient in proteinList {
                        if ingredient.name == element {
                            total += ingredient.cals
                        }
                    }
                    break
                case 3:
                    for ingredient in cheeseList {
                        if ingredient.name == element {
                            total += ingredient.cals
                        }
                    }
                    break
                case 4:
                    for ingredient in veggieList {
                        if ingredient.name == element {
                            total += ingredient.cals
                        }
                    }
                    break
                case 5:
                    for ingredient in sauceList {
                        if ingredient.name == element {
                            total += ingredient.cals
                        }
                    }
                    break
                case 6:
                    for ingredient in seasoningList {
                        if ingredient.name == element {
                            total += ingredient.cals
                        }
                    }
                    break
                case 7:
                    for ingredient in extraList {
                        if ingredient.name == element {
                            total += ingredient.cals
                        }
                    }
                    break
                default:
                    break
                }
            }
            i += 1
        }
        
        // this loop generates random ingredients based off the remaining number of ingredients that can still be chosen
        // and adds them to  returnableList
        for j in 0..<8 {
            
            // bread and temperature
            if j == 0 || j == 1 {
                while currIngredients[j] < 1 {
                    
                    // bread
                    if j == 0 {
                        let breadType : Ingredient? = Int.random(in: 1...20) > 2 ? (breadList.count>0 ? breadList[Int.random(in: 0..<breadList.count)]:nil) : nil
                        if breadType != nil && !returnableList.contains(breadType!.name) { // MJ please check to make sure I did right lol
                            total += breadType!.cals
                            returnableList.append(breadType!.name)
                        }
                        
                    // temperature
                    } else {
                        let tempType : Ingredient = tempList[Int.random(in: 0..<tempList.count)]
                        total+=tempType.cals
                        returnableList.append(tempType.name)
                    }
                    currIngredients[j] += 1
                }
                
            // proteins
            } else if j == 2 {
                while currIngredients[j] < 2 {
                    let proteinType : Ingredient? = Int.random(in: 1...4) > 1 ? (proteinList.count>0 ? proteinList[Int.random(in: 0..<proteinList.count)]:nil) : nil
                    if proteinType != nil && !returnableList.contains(proteinType!.name) {
                        total += proteinType!.cals
                        returnableList.append(proteinType!.name)
                    }
                    currIngredients[j] += 1
                }
                
            // cheese and extras
            } else if j == 3 || j == 7 {
                while currIngredients[j] < 3 {
                    
                    // cheese
                    if j == 3 {
                        let cheeseType : Ingredient? = Int.random(in: 1...4) > 1 ? (cheeseList.count>0 ? cheeseList[Int.random(in: 0..<cheeseList.count)]:nil): nil
                        if cheeseType != nil && !returnableList.contains(cheeseType!.name){
                            total += cheeseType!.cals
                            returnableList.append(cheeseType!.name)
                        }
                        
                    // extras
                    } else {
                        let extraType : Ingredient? = Int.random(in: 1...4) > 1 ? (extraList.count>0 ? extraList[Int.random(in: 0..<extraList.count)]:nil): nil
                        if extraType != nil && !returnableList.contains(extraType!.name){
                            total += extraType!.cals
                            returnableList.append(extraType!.name)
                        }
                    }
                    currIngredients[j] += 1
                }
                
            // veggies
            } else if j == 4 {
                while currIngredients[j] < 5 {
                    let veggieType : Ingredient? = Int.random(in: 1...4) > 1 ? (veggieList.count>0 ? veggieList[Int.random(in: 0..<veggieList.count)]:nil) : nil
                    if veggieType != nil && !returnableList.contains(veggieType!.name){
                        total += veggieType!.cals
                        returnableList.append(veggieType!.name)
                    }
                    currIngredients[j] += 1
                }
                
            // sauces and seasonings
            } else {
                while currIngredients[j] < 4 {
                    
                    // sauces
                    if j == 5 {
                        let sauceType : Ingredient? = Int.random(in: 1...4) > 1 ? (sauceList.count>0 ? sauceList[Int.random(in: 0..<sauceList.count)]:nil) : nil
                        if sauceType != nil && !returnableList.contains(sauceType!.name){
                            total += sauceType!.cals
                            returnableList.append(sauceType!.name)
                        }
                        
                    // seasonings
                    } else {
                        let seasoningType : Ingredient? = Int.random(in: 1...4) > 1 ? (seasoningList.count>0 ? seasoningList[Int.random(in: 0..<seasoningList.count)]:nil) : nil
                        if seasoningType != nil && !returnableList.contains(seasoningType!.name){
                            total += seasoningType!.cals
                            returnableList.append(seasoningType!.name)
                        }
                    }
                    currIngredients[j] += 1
                }
            }
        }
        
        if total > cals || returnableList.count < 2 {
            return randomize(cals:cals,recur:recur+1, chosen: chosen)
        }
        //finalCals = Int(total)
        return returnableList
    }
    
}


