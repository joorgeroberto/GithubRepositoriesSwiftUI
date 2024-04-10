//
//  RepositoriesViewModel.swift
//  GithubRepositoriesSwiftUI
//
//  Created by Jorge de Carvalho on 30/03/24.
//

import Foundation

class RepositoriesViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    var webService: WebServiceProtocol
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }

    func fetchRepositories() {
        webService.fetchData(url: URL.getURL.repositories.value) { (fetchedList: [Repository]?) in
            DispatchQueue.main.async {
                if let fetchedList = fetchedList {
                    self.repositories = fetchedList
                }
            }
        }
    }
}
