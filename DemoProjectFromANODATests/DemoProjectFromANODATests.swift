//
//  DemoProjectFromANODATests.swift
//  DemoProjectFromANODATests
//
//  Created by admin on 12/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import XCTest
@testable import DemoProjectFromANODA

class DemoProjectFromANODATests: XCTestCase {

    override func setUp() {
    }
    
    override func tearDown() {
    }

    func testPostStackIniticalization() {
        let postVC = PostsViewController()
        let postRouter = Router.init(dependencies: AppDependencies(webParserManager: WebParser()))
        postRouter.start(with: postVC)
        XCTAssertTrue(postRouter.controller != nil, "Controller(UIViewContoller) property of the router shouldn't be nil")
    }
    
    func testPostJSONSerialization() {
        let webParser = WebParser()
        let posts = webParser.parseJson(fileName: "test")
        XCTAssertTrue(posts != nil, "Serialization problem, test.json should contain valid objects or structure")
    }
    
    func testDiffTime() {
        let oldDate = Date(timeIntervalSince1970: 86400)
        let newDate = Date(timeIntervalSince1970: 1545763417)
        let timeDiff = String.getDiffTime(olderDate: oldDate, newerDate: newDate)
        XCTAssertTrue("48 years ago" == timeDiff!, "Time difference isn't valid")
    }
    
}
