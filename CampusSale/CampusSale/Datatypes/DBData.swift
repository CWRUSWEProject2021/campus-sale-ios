//
//  DBData.swift
//  CampusSale
//
//  Created by Bradley Wu on 11/14/21.
//

import Foundation

struct UserData: Codable {
    let user_id: String
    let fname: String
    let lname: String
    let username: String
    let bio: String
    let create_date: String
    let phone_number: String
    let graduation_term: String
    let on_campus: String
}

struct UserProfileData: Codable {
    let password: String
    let user_id: Int
}

struct loginInfo {
    let username: String
    let password: String
}

struct UserLoginInfo {
    let username: String
    let password: String
}

struct Product: Codable, Identifiable{
    var id: Int { product_id }
    let description: String
    let keywords: String
    let name: String
    let price: Float
    let product_id: Int
    let seller_id: Int
}

struct Products: Codable {
    let product: [Product]
}
