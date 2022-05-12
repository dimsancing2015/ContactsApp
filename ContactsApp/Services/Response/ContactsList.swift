//
//  ContactsList.swift
//  ContactsApp
//
//  Created by Dim San Cing on 5/11/22.
//

import Foundation

// MARK: - ContactsList
struct ContactsList: Codable {
    let page, perPage, total, totalPages: Int
    let data: [Contact]
    let support: Support

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case total
        case totalPages = "total_pages"
        case data, support
    }
}

// MARK: - Contact
struct Contact: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct Support: Codable {
    let url: String
    let text: String
}
