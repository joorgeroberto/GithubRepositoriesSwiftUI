//
//  WebServiceStub.swift
//  GithubRepositoriesSwiftUITests
//
//  Created by Jorge de Carvalho on 09/04/24.
//
@testable import GithubRepositoriesSwiftUI
import Foundation

class WebServiceStub: WebService {
    var stubDecodeDataWithArrayOnCompletion: Bool = false
    var stubDecodeDataWithVariableOnCompletion: Bool = false

    var stubMakeRequestWithArrayOnCompletion: Bool = false
    var stubMakeRequestWithVariableOnCompletion: Bool = false

    var stubFetchDataWithArrayOnCompletion: Bool = false
    var stubFetchDataWithVariableOnCompletion: Bool = false

    // MARK: Decode Functions
    override func decodeDataFrom<T: Decodable>(_ data: Data, completion: @escaping ([T]?) -> ()) {
        guard stubDecodeDataWithArrayOnCompletion else {
            return super.decodeDataFrom(data, completion: completion)
        }
        completion([
            Repository.fixture() as! T,
            Repository.fixture() as! T,
            Repository.fixture() as! T
        ])
     }

    override func decodeDataFrom<T: Decodable>(_ data: Data, completion: @escaping (T?) -> ()) {
        guard stubDecodeDataWithVariableOnCompletion else {
            return super.decodeDataFrom(data, completion: completion)
        }
        completion(
            (Repository.fixture() as! T)
        )
     }

    // MARK: Request Functions
    override func makeRequest<T: Decodable>(url: URL, completion: @escaping ([T]?) -> ()) {
        guard stubMakeRequestWithArrayOnCompletion else {
            return super.makeRequest(url: url, completion: completion)
        }

        completion([
            Repository.fixture() as! T,
            Repository.fixture() as! T,
            Repository.fixture() as! T
        ])
    }

    override func makeRequest<T: Decodable>(url: URL, completion: @escaping (T?) -> ()) {
        guard stubMakeRequestWithVariableOnCompletion else {
            return super.makeRequest(url: url, completion: completion)
        }

        completion(
            (Repository.fixture() as! T)
        )
    }

    // MARK: Fetch Functions
    override func fetchData<T: Decodable>(url: String, completion: @escaping ([T]?) -> ()) {
        guard stubFetchDataWithArrayOnCompletion else {
            return super.fetchData(url: url, completion: completion)
        }

        completion([
            Repository.fixture() as! T,
            Repository.fixture() as! T,
            Repository.fixture() as! T
        ])
    }

    override func fetchData<T: Decodable>(url: String, completion: @escaping (T?) -> ()) {
        guard stubFetchDataWithVariableOnCompletion else {
            return super.fetchData(url: url, completion: completion)
        }

        completion(
            (Repository.fixture() as! T)
        )
    }
}
