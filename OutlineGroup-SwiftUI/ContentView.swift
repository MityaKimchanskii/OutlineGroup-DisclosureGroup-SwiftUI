//
//  ContentView.swift
//  OutlineGroup-SwiftUI
//
//  Created by Mitya Kim on 7/26/22.
//

import SwiftUI

struct ListItem: Identifiable {
    let id: UUID = UUID()
    let name: String
    var items: [ListItem]?
}

extension ListItem {
    
    static func all() -> [ListItem] {
        
        let animals = [ListItem(name: "π«"), ListItem(name: "π"), ListItem(name: "π¦£"), ListItem(name: "π¦"), ListItem(name: "π¦"), ListItem(name: "π¦")]
        let fruits = [ListItem(name: "π"), ListItem(name: "π"), ListItem(name: "π"), ListItem(name: "π₯¬"), ListItem(name: "π₯"), ListItem(name: "π₯₯")]
        let cars = [ListItem(name: "π"), ListItem(name: "π"), ListItem(name: "π"), ListItem(name: "π"), ListItem(name: "π"), ListItem(name: "π")]
        
        return [ListItem(name: "Animals", items: animals),
                ListItem(name: "Fruits", items: fruits),
                ListItem(name: "Cars", items: cars)
        ]
    }
}

struct ContentView: View {
    
    @State private var sportsExpanded: Bool = true
    let sports = ["π", "β·", "πͺ", "ππ»ββοΈ", "π€ΌββοΈ", "π€Έπ»ββοΈ", "ππΌ", "ππΎββοΈ"]
    let fruits = ["π", "π", "π", "π", "π", "π", "π₯", "π"]
    
    var body: some View {
        
        VStack {
            
            List {
                
                ForEach(ListItem.all()) { category in
                    
                    Section(header: EmptyView()) {
                        
                        OutlineGroup(category, children: \.items) { item in
                            Text(item.name)
                                .font(.custom("Arial", size: 20))
                        }
                    }
                }
            }
            
            Form {
                
                DisclosureGroup(isExpanded: $sportsExpanded) {
                    HStack {
                        ForEach(sports, id: \.self) { human in
                            Text(human)
                                .font(.system(size: 30))
                        }
                    }
                } label: {
                    Text("Sport")
                }
                
                DisclosureGroup(isExpanded: $sportsExpanded) {
                    HStack {
                        ForEach(fruits, id: \.self) { fruit in
                            Text(fruit)
                                .font(.system(size: 30))
                        }
                    }
                } label: {
                    Text("Fruit")
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
