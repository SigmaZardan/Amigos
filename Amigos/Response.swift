//
//  Response.swift
//  Amigos
//
//  Created by Bibek Bhujel on 06/11/2024.
//
import SwiftData
import Foundation

@Model
class Person: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]

    init(
        id: String,
        isActive: Bool,
        name: String,
        age: Int,
        company: String,
        email: String,
        address: String,
        about: String,
        registered: String,
        tags: [String],
        friends: [Friend]
    ) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }


    enum CodingKeys: String, CodingKey {
        case id
        case isActive
        case name
        case age
        case company
        case email
        case address
        case about
        case registered
        case tags
        case friends
    }


    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        isActive = try container.decode(Bool.self, forKey: .isActive)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)
        company = try container.decode(String.self, forKey: .id)
        email = try container.decode(String.self, forKey: .id)
        address = try container.decode(String.self, forKey: .id)
        about = try container.decode(String.self, forKey: .id)
        registered = try container.decode(String.self, forKey: .id)
        tags = try container.decode([String].self, forKey: .tags)
        friends = try container.decode([Friend].self, forKey: .friends)
    }


    func encode(to encoder: any Encoder) throws {

    }
}

@Model
class Friend: Codable {
    var id: String
    var name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: any Encoder) throws {
    }
}
