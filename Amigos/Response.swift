//
//  Response.swift
//  Amigos
//
//  Created by Bibek Bhujel on 06/11/2024.
//

import Foundation

struct Person: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}

struct Friend: Codable {
    let id: String
    let name: String
}
