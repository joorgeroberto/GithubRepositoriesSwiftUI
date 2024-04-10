//
//  WebServiceSpy.swift
//  GithubRepositoriesSwiftUITests
//
//  Created by Jorge de Carvalho on 31/03/24.
//

@testable import GithubRepositoriesSwiftUI
import Foundation

final class WebServiceSpy: WebServiceProtocol {
    private(set) var dataPassed: Data?
    private(set) var urlStringPassed: String?
    private(set) var urlPassed: URL?

    private(set) var decodeDataFromFunctionCalled: Bool = false
    private(set) var makeRequestFunctionCalled: Bool = false
    private(set) var fetchDataFunctionCalled: Bool = false

    var fetchDataToBeReturned: Repository?
    var fetchDataArrayToBeReturned: [Repository] = []

    var decodedDataToBeReturned: Repository?
    var decodedDataArrayToBeReturned: [Repository] = []

    
    var makeRequestDataToBeReturned: Repository?
    var makeRequestDataArrayToBeReturned: [Repository] = []

    func decodeDataFrom<T: Decodable>(_ data: Data, completion: @escaping ([T]?) -> ()) {
        decodeDataFromFunctionCalled = true
        dataPassed = data

        completion(decodedDataArrayToBeReturned as? [T])
    }
    
    func decodeDataFrom<T: Decodable>(_ data: Data, completion: @escaping (T?) -> ()) {
        decodeDataFromFunctionCalled = true
        dataPassed = data

        completion(decodedDataToBeReturned as? T)
    }
    
    func makeRequest<T: Decodable>(url: URL, completion: @escaping ([T]?) -> ()) {
        makeRequestFunctionCalled = true
        urlPassed = url
    }
    
    func makeRequest<T: Decodable>(url: URL, completion: @escaping ((T)?) -> ()) {
        makeRequestFunctionCalled = true
        urlPassed = url
    }
    
    func fetchData<T: Decodable>(url: String, completion: @escaping ([T]?) -> ()) {
        fetchDataFunctionCalled = true
        urlStringPassed = url

        completion(fetchDataArrayToBeReturned as? [T])
    }
    
    func fetchData<T: Decodable>(url: String, completion: @escaping (T?) -> ()) {
        fetchDataFunctionCalled = true
        urlStringPassed = url

        completion(fetchDataToBeReturned as? T)
    }
}
