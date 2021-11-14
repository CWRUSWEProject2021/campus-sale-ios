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
