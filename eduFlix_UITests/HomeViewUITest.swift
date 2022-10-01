//
//  HomeViewUITest.swift
//  eduFlix_UITests
//
//  Created by Reya on 01.05.22.
//

import XCTest
//NamingStructure: test_UnitOfWork_StateUnderTest_ExpectedBehavr
//NamingStructure: test_[struct or class]_[variable or function)_[expected result]
//Testing Structure: Given , When, Then
class HomeViewUITest: XCTestCase {
    let app = XCUIApplication()
    override func setUpWithError() throws {
       
        continueAfterFailure = false
        XCUIApplication().launch()

    }
    
    func test_HomeViewFlashcards_shouldOpenFlashcards() {
        
     //   Given
        let field =  app.scrollViews.otherElements.staticTexts["UX Fundamentals"]
        // When
        field.tap()
        //Then
        let tabbar = app.tabBars["Tab Bar"].buttons["Flashcards"]
         
        XCTAssertTrue(tabbar.exists)
        
        
        
    }
    
    func test_HomeViewNotes_shouldOpenNotes() {
        


     //   Given
        let field =  app.scrollViews.otherElements.staticTexts["UX Research Interviews"]
        // When
        field.tap()
        //Then
        let view = app.staticTexts["Notes "]
        XCTAssertTrue(view.exists)
 
    }
    
    func test_HomeView_shouldOpenCalendar() {


        // given
        let cal = app.scrollViews.otherElements.buttons["calendarIcon"]
        //when
        cal.tap()

        // then
        let view =  app.navigationBars["calendar"]

         XCTAssertTrue(view.exists)

 

    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
