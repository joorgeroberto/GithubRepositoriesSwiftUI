//
//  RepositoriesView.swift
//  GithubRepositoriesSwiftUI
//
//  Created by Jorge de Carvalho on 30/03/24.
//

import SwiftUI

struct RepositoriesView: View {
    @ObservedObject var viewModel = RepositoriesViewModel(webService: WebService())
    
    var body: some View {
        NavigationStack {
            List(viewModel.repositories, id: \.fullName) { repository in
                NavigationLink(destination: RepositoryDetailsView(viewModel: RepositoryDetailsViewModel(repository: repository))) {
                    HStack {
                        AsyncImage(url: URL(string: repository.owner.avatarUrl)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60, height: 60)
                        .cornerRadius(15)
                        .padding()

                        VStack(alignment: .leading) {
                            Text(repository.fullName)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Repositories")
        }
        .onAppear() {
            viewModel.fetchRepositories()
        }
    }
}

#Preview {
    RepositoriesView()
}
