//
//  AddRestaurantView.swift
//  FinalGroupProject
//
//  Created by Alexander Kudin on 2022-04-20.
//

import SwiftUI

struct AddRestaurantView: View {
    @EnvironmentObject var restaurantVM: RestaurantViewModel
    
    @State private var name: String = ""
    @State private var categorySelected: Category = Category.other
    @State private var rating: Int = 5
    @State private var phone: String = ""
    @State private var street: String = ""
    @State private var city: String = ""
    @State private var province: String = ""
    @State private var country: String = ""
    @State private var postal: String = ""
    @State private var description: String = ""
    
    @State private var navToRestaurant: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Name")) {
                    TextField("Restaurant Name", text: $name)
                }
                
                Section(header: Text("Category")) {
                    Picker("Category", selection: $categorySelected) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Phone")) {
                    TextField("Restaurant Phone", text: $phone)
                }
                
                Section(header: Text("Rating")) {
                    Picker("Rating", selection: $rating) {
                        ForEach(0 ..< 6) {
                            Text("\($0) / 5")
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                
                Section(header: Text("Street")) {
                    TextField("123 Main Street", text: $street)
                }
                
                Section(header: Text("City")) {
                    TextField("", text: $city)
                }
                
                Section(header: Text("Province")) {
                    TextField("", text: $province)
                }
                
                Section(header: Text("Country")) {
                    TextField("", text: $country)
                }
                
                Section(header: Text("Postal Code")) {
                    TextField("", text: $postal)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                
                ToolbarItem{
                    NavigationLink(isActive: $navToRestaurant){
                        RestaurantView(restaurant: restaurantVM.restaurants.sorted{ $0.dateCreated > $1.dateCreated }[0])
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Button {
                            saveRestaurant()
                            navToRestaurant = true
                        } label: {
                            Text("Save")
                        }
                    }
                    .disabled(name.isEmpty)
                    .disabled(phone.isEmpty)
                    .disabled(street.isEmpty)
                    .disabled(city.isEmpty)
                    .disabled(province.isEmpty)
                    .disabled(country.isEmpty)
                }
            })
            .navigationTitle("New Restaurant")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct AddRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        AddRestaurantView()
            .environmentObject(RestaurantViewModel())
    }
}

extension AddRestaurantView {
    private func saveRestaurant() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let curDate = dateFormatter.string(from: now)
            
        let restaurant = Restaurant(
            name: name,
            category: categorySelected.rawValue,
            rating: rating,
            phone: phone,
            street: street,
            city: city,
            province: province,
            country: country,
            postal: postal,
            description: description,
            dateCreated: curDate
        )
        
        restaurantVM.addRestaurand(restaurant: restaurant)
    }
}
