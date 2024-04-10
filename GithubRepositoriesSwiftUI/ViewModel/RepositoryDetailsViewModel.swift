//
//  RepositoryDetailsViewModel.swift
//  GithubRepositoriesSwiftUI
//
//  Created by Jorge de Carvalho on 30/03/24.
//

import Foundation

class RepositoryDetailsViewModel {
    var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }

    func showDescription() -> Bool {
        return repository.description != nil
    }
}
