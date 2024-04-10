//
//  URL+Extensions.swift
//  GithubRepositoriesSwiftUI
//
//  Created by Jorge de Carvalho on 30/03/24.
//

import Foundation

extension URL {
    private static let baseURL = "https://api.github.com"

    enum getURL: String {
        case repositories

        var value: String {
            switch self {
            case .repositories:
                return URL.baseURL + "/repositories"
            }
        }
    }
}
