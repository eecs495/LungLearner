//
//  LungLearnerTests.swift
//  LungLearnerTests
//
//  Created by Katherine Sanchez on 11/10/20.
//

import XCTest
var sut: CaseDataManager
var ssut: UserData

class LungLearnerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        sut = CaseDataManager()
        ssut = UserDatabaseManager()
    }

    override func tearDown() {
        sut = nil
        ssut = nil
        super.tearDown()
    }

    func testGetRandomCase() {
      // 1. given
      //let guess = sut.targetValue + 5

      // 2. when
      sut.getRandomCase()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
    }

    func testGetCaseById() {
      // 1. given
      let c = 10

      // 2. when
      sut.getCaseById(id: c)

      // 3. then
      XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }

    func testGetAllCases() {
      // 1. given
      //let c = 10

      // 2. when
      sut.getAllCases()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }
    
    func testPrepareUserDatabase() {
      // 1. given
      //let c = 10

      // 2. when
      ssut.prepareUserDatabase()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }

    func testGetTotalUserProgress() {
      // 1. given
      //let c = 10

      // 2. when
      ssut.getTotalUserProgress()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }

    func testStoreCaseResult() {
      // 1. given
      let r = 10

      // 2. when
      ssut.storeCaseResult(result: r)

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }

    func testGetListOfCompletedCases() {
      // 1. given
      //let c = 10

      // 2. when
      ssut.getListOfCompletedCases()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }
    func testSetCaseFavorite() {
      // 1. given
      //let c = 10

      // 2. when
      ssut.setCaseFavorite(idInput: 10, favoriteInput: True)()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }
    func testGetFavoriteCases() {
      // 1. given
      //let c = 10

      // 2. when
      ssut.getFavoriteCases()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }

    func testgetUserCaseById() {
      // 1. given
      //let c = 10

      // 2. when
      ssut.getUserCaseById(Id: 10)

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }

    func testGetUserDiagnosis() {
      // 1. given
      //let c = 10

      // 2. when
      ssut.getUserDiagnosis()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }

    func testGetAgeGroup() {
      // 1. given
      //let c = 10

      // 2. when
      ssut.getAgeGroup()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }

    func testGetGenderGroup() {
      // 1. given
      //let c = 10

      // 2. when
      ssut.getGenderGroup()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }




}


