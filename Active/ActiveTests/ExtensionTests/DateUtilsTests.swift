//
//  DateUtilsTests.swift
//  ActiveTests
//
//  Created by Tiago Maia Lopes on 13/06/18.
//  Copyright © 2018 Tiago Maia Lopes. All rights reserved.
//

import XCTest
@testable import Active

/// Class in charge of testing the Date Utilities extension.
class DateUtilsTests: XCTestCase {
    
    // MARK: Tests
    
    func testGettingDateComponents() {
        // Declare the date.
        let date = Date()
        
        // Get the date's components.
        let dateComponents = Calendar.current.dateComponents(
            [.second, .minute, .hour, .day, .month, .year],
            from: date
        )
        
        // Compare with the extension's one.
        XCTAssertEqual(dateComponents, date.components)
    }
    
    func testGettingTheBeginningOfToday() {
        // Declare today's date.
        let today = Date()
        
        // Get the date representing the beginning (midnight) of today's date.
        let todayBeginning = today.getBeginningOfDay()
        
        // Compare the dates' day, month and year.
        XCTAssertEqual(today.components.day, todayBeginning.components.day, "The dates should have equal days.")
        XCTAssertEqual(today.components.month, todayBeginning.components.month, "The dates should have equal months.")
        XCTAssertEqual(today.components.year, todayBeginning.components.year, "The dates should have equal years.")
        
        // Check if the generated date represents the previous date at midnight.
        XCTAssertEqual(todayBeginning.components.minute, 0, "The beginning of a day's date should be at midnight (0 minutes).")
        XCTAssertEqual(todayBeginning.components.hour, 0, "The beginning of a day's date should be at midnight (0 hours, midnight).")
    }
    
    func testGettingTheEndOfToday() {
        // Declare today's date.
        let today = Date()
        
        // Get the date representing the end (23:59 PM) of today's date.
        let todayEnd = today.getEndOfDay()
        
        // Compare the dates' day, month and year.
        XCTAssertEqual(today.components.day, todayEnd.components.day, "The dates should have equal days.")
        XCTAssertEqual(today.components.month, todayEnd.components.month, "The dates should have equal months.")
        XCTAssertEqual(today.components.year, todayEnd.components.year, "The dates should have equal years.")

        // Check if the generated date represents the previous date at the end.
        XCTAssertEqual(todayEnd.components.minute, 59, "The end of a day's date should be at 59 minutes.")
        XCTAssertEqual(todayEnd.components.hour, 23, "The end of a day's date should be at 23 hours.")
    }
    
    func testGettingDateByAddingDays() {
        // Declare a date at the beginning of the month.
        let date = Calendar.current.date(
            bySetting: .day,
            value: 1,
            of: Date()
        )
        
        // Get a new date by adding a number of days to the original date.
        let dateAfter = date?.byAddingDays(7)
        
        // Compare the dates' month and year components.
        XCTAssertEqual(date?.components.month, dateAfter?.components.month)
        XCTAssertEqual(date?.components.year, dateAfter?.components.year)
        
        // Check if the days were correclty added.
        XCTAssertEqual((date?.components.day ?? 1) + 7, dateAfter?.components.day, "The days should be correclty added.")
    }
    
}

