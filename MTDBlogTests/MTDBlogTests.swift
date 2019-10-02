//
//  MTDBlogTests.swift
//  MTDBlogTests
//
//  Created by Daniel Mandea on 05/09/2019.
//  Copyright © 2019 IBM. All rights reserved.
//

import XCTest
import MTDBlogRequests
@testable import MTDBlog

class MTDBlogTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

   @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func testFetchToken() {
//        let exp = expectation(description: "cos-token")
//        _ = OAuthService.tokenPublisher(from: Constants.Api.OAuth.url).sink(receiveCompletion: { completion in
//            exp.fulfill()
//            switch completion {
//            case .finished:
//                break
//            case .failure(let error):
//                XCTFail(error.localizedDescription)
//            }
//        }, receiveValue: { oauth in
//            XCTAssertNotNil(oauth)
//        })
//        wait(for: [exp], timeout: 10)
    }
}
