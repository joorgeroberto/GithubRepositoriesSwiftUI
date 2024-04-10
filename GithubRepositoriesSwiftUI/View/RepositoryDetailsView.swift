//
//  RepositoryDetailsView.swift
//  GithubRepositoriesSwiftUI
//
//  Created by Jorge de Carvalho on 30/03/24.
//

import SwiftUI

struct RepositoryDetailsView: View {
    var viewModel: RepositoryDetailsViewModel
    
    init(viewModel: RepositoryDetailsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: viewModel.repository.owner.avatarUrl)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            .cornerRadius(25)
            .padding()

            VStack {
                Text("Name:")
                    .fontWeight(.bold)
                Text(viewModel.repository.name)
            }
            .padding(.bottom)

            VStack {
                Text("Developer:")
                    .fontWeight(.bold)
                Text(viewModel.repository.owner.login)
            }
            .padding(.bottom)

            if viewModel.showDescription() {
                VStack {
                    Text("Description:")
                        .fontWeight(.bold)
                    Text(viewModel.repository.description ?? "")
                }
                .padding(.bottom)
            }

            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
    }
}

#Preview {
    RepositoryDetailsView(viewModel: RepositoryDetailsViewModel(repository: Repository(name: "Repo", fullName: "example/repo", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dapibus placerat urna sit amet congue. Cras feugiat elit vel dui condimentum imperdiet. Aliquam erat volutpat. Sed velit turpis, congue quis lectus non, rhoncus elementum eros. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi eu tortor sit amet orci accumsan lobortis vel in nisi. Pellentesque maximus tellus id nisl consequat ornare. Nunc hendrerit, nisi non posuere lacinia, augue dolor aliquet enim, laoreet interdum tortor libero ac erat. Sed quis cursus leo. Aenean ac neque ullamcorper, euismod dui et, feugiat libero.", owner: Owner(id: 1, login: "developer", nodeId: "10", avatarUrl: "https://source.unsplash.com/user/c_v_r/100x100"))))
}
