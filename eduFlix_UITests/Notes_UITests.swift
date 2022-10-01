//
//  Notes_UITests.swift
//  eduFlix_UITests
//
//  Created by Reya on 01.05.22.
//

import XCTest

class Notes_UITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false


        XCUIApplication().launch()

   
    }
    func test_EditNotes_shouldExist() {
        //given
        let view =  app.tabBars["Tab Bar"].buttons["Notes"]
        //when
        view.tap()
        
     //then
        let editWindow = app.tables/*@START_MENU_TOKEN@*/.buttons["Edit Your Note"]/*[[".cells[\"Edit Your Note\"].buttons[\"Edit Your Note\"]",".buttons[\"Edit Your Note\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
      //  editWindow.tap()
        
        XCTAssertTrue(editWindow.exists)
 
    }
    
    // PROFILE
    func test_HelpInfo_shouldOpenInProfile() {
        
       
    let view =  app.tabBars["Tab Bar"].buttons["Profile"]
        
    view.tap()
        
    let tablesQuery = app.tables
    let helpDropDown =  tablesQuery/*@START_MENU_TOKEN@*/.buttons["Notes"]/*[[".cells[\"Notes\"].buttons[\"Notes\"]",".buttons[\"Notes\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
    XCTAssertTrue(helpDropDown.exists)
        

        
    }
    
    

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
