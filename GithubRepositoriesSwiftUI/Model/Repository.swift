//
//  Repository.swift
//  GithubRepositoriesSwiftUI
//
//  Created by Jorge de Carvalho on 30/03/24.
//

import Foundation

struct Repository: Codable {
    let name: String
    let fullName: String
    var description: String?
    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case name, description, owner
        case fullName = "full_name"
    }
}
extension Repository {
    static func fixture(
        name: String = "Repo",
        fullName: String = "Repo/Double",
        description: String? = nil,
        owner: Owner = Owner(
            id: 1,
            login: "login",
            nodeId: "1",
            avatarUrl: "http://example.com"
        )
    ) -> Self {
        .init(name: name, fullName: fullName, description: description, owner: owner)
    }
}

struct Owner: Codable {
    let id: Int
    let login: String
    let nodeId: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id, login
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
    }
}
