//
//  WebServiceTests.swift
//  GithubRepositoriesSwiftUITests
//
//  Created by Jorge de Carvalho on 31/03/24.
//

@testable import GithubRepositoriesSwiftUI
import XCTest

final class WebServiceTests: XCTestCase {
    private var sut: WebServiceStub?

    override func setUp() {
        sut = WebServiceStub()
    }

    override func tearDown() {
        sut = nil
    }

    // MARK: decodeDataFrom tests
    func test_decodeDataFrom_must_return_decoded_array_provided_by_json_file() {
        // Given
        var testResult: [Repository] = []
        var data: Data?
        guard let path = Bundle.main.path(forResource: "repositories-array", ofType: "json") else {
            return XCTFail("path must be valid")
        }
        data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

        guard let data = data else {
            return XCTFail("data must be valid")
        }
        guard let sut = sut else {
            XCTFail("sut must be valid.")
            return
        }
        // When
        sut.decodeDataFrom(data) { (fetchedList: [Repository]?) in
            guard let fetchedList = fetchedList else {
                return XCTFail("fetchedList must be valid")
            }
            testResult = fetchedList
        }

        // Then
        XCTAssertEqual(testResult.count, 3)
    }

    func test_decodeDataFrom_must_return_decoded_variable_provided_by_json_file() {
        // Given
        var testResult: Repository?
        var data: Data?
        guard let path = Bundle.main.path(forResource: "repositories-variable", ofType: "json") else {
            return XCTFail("path must be valid")
        }
        data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        
        guard let data = data else {
            return XCTFail("data must be valid")
        }
        guard let sut = sut else {
            XCTFail("sut must be valid.")
            return
        }
        // When
        sut.decodeDataFrom(data) { (fetchedData: Repository?) in
            guard let fetchedData = fetchedData else {
                return XCTFail("fetchedList must be valid")
            }
            testResult = fetchedData
        }
        
        // Then
        XCTAssertEqual(testResult?.name, "grit")
        XCTAssertEqual(testResult?.fullName, "mojombo/grit")
        XCTAssertEqual(testResult?.description, "description")
        XCTAssertEqual(testResult?.owner.id, 1)
        XCTAssertEqual(testResult?.owner.login, "mojombo")
        XCTAssertEqual(testResult?.owner.nodeId, "MDQ6VXNlcjE=")
        XCTAssertEqual(testResult?.owner.avatarUrl, "https://avatars.githubusercontent.com/u/1?v=4")
    }

    // MARK: makeRequests tests
    func test_makeRequests_must_return_array_on_completion() {
        // Given
        var testResult: [Repository] = []
        guard let sut = sut else {
            XCTFail("sut must be valid.")
            return
        }
        guard let url = URL(string: "https://test.com") else {
            return XCTFail("url must be valid")
        }
        sut.stubMakeRequestWithArrayOnCompletion = true

        // When
        sut.makeRequest(url: url) { (fetchedList: [Repository]?) in
            guard let fetchedList = fetchedList else {
               return XCTFail("fetchedList must be valid")
            }
            testResult = fetchedList
        }

        // Then
        XCTAssertEqual(testResult.count, 3)
    }

    func test_makeRequests_must_return_variable_on_completion() {
        // Given
        var testResult: Repository?
        guard let sut = sut else {
            XCTFail("sut must be valid.")
            return
        }
        guard let url = URL(string: "https://test.com") else {
            return XCTFail("url must be valid")
        }
        sut.stubMakeRequestWithVariableOnCompletion = true

        // When
        sut.makeRequest(url: url) { (fetchedData: Repository?) in
            guard let fetchedData = fetchedData else {
               return XCTFail("fetchedList must be valid")
            }
            testResult = fetchedData
        }

        // Then
        XCTAssertEqual(testResult?.name, "Repo")
        XCTAssertEqual(testResult?.fullName, "Repo/Double")
        XCTAssertNil(testResult?.description)
        XCTAssertEqual(testResult?.owner.id, 1)
        XCTAssertEqual(testResult?.owner.login, "login")
        XCTAssertEqual(testResult?.owner.nodeId, "1")
        XCTAssertEqual(testResult?.owner.avatarUrl, "http://example.com")
    }
    
    // MARK: fetchData tests
    func test_fetchData_must_return_array_on_completion() {
        // Given
        var testResult: [Repository] = []
        guard let sut = sut else {
            XCTFail("sut must be valid.")
            return
        }
        sut.stubMakeRequestWithArrayOnCompletion = true

        // When
        sut.fetchData(url: "https://test.com") { (fetchedList: [Repository]?) in
            guard let fetchedList = fetchedList else {
               return XCTFail("fetchedList must be valid")
            }
            testResult = fetchedList
        }

        // Then
        XCTAssertEqual(testResult.count, 3)
    }

    func test_fetchData_must_return_variable_on_completion() {
        // Given
        var testResult: Repository?
        guard let sut = sut else {
            XCTFail("sut must be valid.")
            return
        }
        sut.stubMakeRequestWithVariableOnCompletion = true

        // When
        sut.fetchData(url: "https://test.com") { (fetchedRepository: Repository?) in
            guard let fetchedRepository = fetchedRepository else {
               return XCTFail("fetchedList must be valid")
            }
            testResult = fetchedRepository
        }

        // Then
        XCTAssertEqual(testResult?.name, "Repo")
        XCTAssertEqual(testResult?.fullName, "Repo/Double")
        XCTAssertNil(testResult?.description)
        XCTAssertEqual(testResult?.owner.id, 1)
        XCTAssertEqual(testResult?.owner.login, "login")
        XCTAssertEqual(testResult?.owner.nodeId, "1")
        XCTAssertEqual(testResult?.owner.avatarUrl, "http://example.com")
    }
}
