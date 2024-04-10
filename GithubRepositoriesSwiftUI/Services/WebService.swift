//
//  ApiService.swift
//  Fipe_SwiftUI
//
//  Created by Jorge de Carvalho on 05/02/24.
//

import Foundation

protocol WebServiceProtocol {
    func decodeDataFrom<T: Decodable>(_ data: Data, completion: @escaping ([T]?) -> ())
    func decodeDataFrom<T: Decodable>(_ data: Data, completion: @escaping (T?) -> ())

    func makeRequest<T: Decodable>(url: URL, completion: @escaping ([T]?) -> ())
    func makeRequest<T: Decodable>(url: URL, completion: @escaping (T?) -> ())

    func fetchData<T: Decodable>(url: String, completion: @escaping ([T]?) -> ())
    func fetchData<T: Decodable>(url: String, completion: @escaping (T?) -> ())
}

class WebService: WebServiceProtocol {
    // MARK: Decode Functions
    func decodeDataFrom<T: Decodable>(_ data: Data, completion: @escaping ([T]?) -> ()) {
        let decodedData = try? JSONDecoder().decode([T].self, from: data)
        completion(decodedData)
    }
    
    func decodeDataFrom<T: Decodable>(_ data: Data, completion: @escaping ((T)?) -> ()) {
        let decodedData = try? JSONDecoder().decode(T.self, from: data)
        completion(decodedData)
    }
}

// MARK: Request Functions
extension WebService {
    func makeRequest<T: Decodable>(url: URL, completion: @escaping ([T]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            self.decodeDataFrom(data) { decodedData in
                completion(decodedData)
            }
        }
        .resume()
    }
    
    func makeRequest<T: Decodable>(url: URL, completion: @escaping ((T)?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            self.decodeDataFrom(data) { decodedData in
                completion(decodedData)
            }
        }
        .resume()
    }
}

// MARK: Fetch Functions
extension WebService {
    func fetchData<T: Decodable>(url: String, completion: @escaping ([T]?) -> ()) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }

        self.makeRequest(url: url) { data in
            completion(data)
        }
    }

    func fetchData<T: Decodable>(url: String, completion: @escaping (T?) -> ()) {
        guard let url = URL(string: url) else {
            completion(nil)
            return
        }

        self.makeRequest(url: url) { data in
            completion(data)
        }
    }
}
