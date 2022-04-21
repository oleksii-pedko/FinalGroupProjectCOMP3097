//
//  EditRestaturantView.swift
//  FinalGroupProject
//
//  Created by Alexander Kudin on 2022-04-20.
//

import SwiftUI

struct EditRestaturantView: View {
    var restaurant: Restaurant
    
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
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Name")) {
                    TextField("Restaurant Name", text: $name)
                }
                .onAppear { name = restaurant.name }

                Section(header: Text("Category")) {
                    Picker("Category", selection: $categorySelected) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                }
                .onAppear { categorySelected = Category(rawValue: restaurant.category) ?? Category.other }

                Section(header: Text("Phone")) {
                    TextField("Restaurant Phone", text: $phone)
                }
                .onAppear { phone = restaurant.phone }
                
                Section(header: Text("Rating")) {
                    Picker("Rating", selection: $rating) {
                        ForEach(0 ..< 6) {
                            Text("\($0) / 5")
                        }
                    }
                    .pickerStyle(.menu)
                }
                .onAppear { rating = restaurant.rating }

                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                .onAppear { description = restaurant.description }

                Section(header: Text("Street")) {
                    TextField("123 Main Street", text: $street)
                }
                .onAppear { street = restaurant.street }
                
                Section(header: Text("City")) {
                    TextField("", text: $city)
                }
                .onAppear { city = restaurant.city }
                
                Section(header: Text("Province")) {
                    TextField("", text: $province)
                }
                .onAppear { province = restaurant.province }
                
                Section(header: Text("Country")) {
                    TextField("", text: $country)
                }
                .onAppear { country = restaurant.country }
                
                Section(header: Text("Postal Code")) {
                    TextField("", text: $postal)
                }
                .onAppear { postal = restaurant.postal }
            
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
                    Button {
                        saveRestaurant()
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                    .disabled(name.isEmpty)
                    .disabled(phone.isEmpty)
                    .disabled(street.isEmpty)
                    .disabled(city.isEmpty)
                    .disabled(province.isEmpty)
                    .disabled(country.isEmpty)
                }
            })
            .navigationTitle("Update Restaurant")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        
        Button {
            restaurantVM.removeRestaurant(id: restaurant.id)
            dismiss()
        } label: {
            Text("Delete Restaurant")
        }
    }
}

struct EditRestaturantView_Previews: PreviewProvider {
    static var previews: some View {
        EditRestaturantView(restaurant: Restaurant.all[0])
            .environmentObject(RestaurantViewModel())
    }
}

extension EditRestaturantView {
    private func saveRestaurant() {
            
        let updatedRestaurant = Restaurant(
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
            dateCreated: restaurant.dateCreated
        )
        
        restaurantVM.updateRestaurant(
            id: restaurant.id,
            restaurant: updatedRestaurant
        )
    }
}
