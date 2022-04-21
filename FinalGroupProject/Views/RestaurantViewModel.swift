//
//  RestaurantViewModel.swift
//  FinalGroupProject
//
//  Created by Alexander Kudin on 2022-04-20.
//

import Foundation

class RestaurantViewModel: ObservableObject {
    @Published private(set) var restaurants: [Restaurant] = []
    
    init() {
        restaurants = Restaurant.al
    }
    
    func addRestaurand(restaurant: Restaurant){
        restaurants.append(restaurant)
    }
    
    func updateRestaurant(id: UUID, restaurant: Restaurant){
        restaurants = restaurants.map{
            var mutableRestaurant = $0
            if $0.id == id{
                mutableRestaurant = restaurant
            }
            return mutableRestaurant
        }
    }
    
    func removeRestaurant(id: UUID){
        restaurants = restaurants.filter{ $0.id != id }
    }
}
