//
//  Data.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 11.10.2020.
//

import Foundation

struct CreditRequest: Codable {
    let comment: String!
    let customer_party: CustomerParty!
    let datetime: String!
    let interest_rate: Float!
    let requested_amount: Int!
    let requested_term: Int!
    let trade_mark: String!
    let vehicle_cost: Int!

}

struct CustomerParty: Codable {
    let email: String!
    let income_amount: Int!
    let person: Person!
    let phone: String!
}

struct Person: Codable {
    let birth_date_time: String!
    let birth_place: String!
    let family_name: String!
    let first_name: String!
    let middle_name: String!
    let gender: String!
    let nationality_country_code: String! = "RU"
}

struct UserDataRequest: Codable {
    let email: String
    let income_amount:Int
    let birth_date_time:String
    let birth_place:String
    let family_name:String
    let first_name:String
    let gender:String
    let middle_name:String
    let nationality_country_code:String
    let phone:String
}

struct LoginRequest: Codable {
    let username: String
    let password: String
}

struct RegisterRequest: Codable {
    let username: String
    let password: String
    let password_confirm: String
}

struct UserDataResponse: Codable {
    let id: Int
    let email: String
    let income_amount:Int
    let birth_date_time:String
    let birth_place:String
    let family_name:String
    let first_name:String
    let gender:String
    let middle_name:String
    let nationality_country_code:String
    let phone:String
}

struct CarPhoto: Codable {
    let photo: String
}
