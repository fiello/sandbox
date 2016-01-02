//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by dmisin on 12/22/15.
//  Copyright © 2015 GZS. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
    // MARK: FoodTracker tests
    func testMealInitialization()
    {
        let potentialItem = Meal(name: "Goodie", photo: nil, rating: 2);
        XCTAssertNotNil(potentialItem);
        
        let noName = Meal(name: "", photo: nil, rating: 2);
        XCTAssertNil(noName);
        
        let badRating = Meal(name: "Goodie", photo: nil, rating: -2);
        XCTAssertNil(badRating);
    }
    
    
}
