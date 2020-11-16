//
//  LungLearnerTests.swift
//  LungLearnerTests
//
//  Created by Katherine Sanchez on 11/10/20.
//
import XCTest


class LungLearnerTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetRandomCase() {
      // 1. given
      //let guess = sut.targetValue + 5
      // 2. when
      let sut: CaseDatabaseManager = CaseDatabaseManager()
      let case1 = try! sut.getRandomCase()
      //printCase(caseInfo: case1.caseId)
      // 3. then
      XCTAssertGreaterThan(case1.caseId, 0, "Random Case")
    }

    func testGetCaseById() {
      // 1. given
      let c = 10
      let sut: CaseDatabaseManager = CaseDatabaseManager()

      // 2. when
      let case1 = try! sut.getCaseById(Id: Int64(c))

      // 3. then
      XCTAssertEqual(case1.id, 10, "returned wrong case id")
    }

    func testGetAllCases() {
      // 1. given
      //let c = 10
      // 2. when
      let sut: CaseDatabaseManager = CaseDatabaseManager()
      sut.getAllCases()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }
    
    func testPrepareUserDatabase() {
      // 1. given
      //let c = 10
      // 2. when
      let ssut: UserDatabaseManager = UserDatabaseManager()
      ssut.prepareUserDatabase()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }

    func testGetTotalUserProgress() {
      // 1. given
      //let c = 10
      // 2. when
      let ssut: UserDatabaseManager = UserDatabaseManager()
      let progress = ssut.getTotalUserProgress()

      // 3. then
      XCTAssertEqual(progress.correctCases, 0, "returned wrong case id")
    }

    func testStoreCaseResult() {
      // 1. given
      
      let ssut: UserDatabaseManager = UserDatabaseManager()
        let r: UserCaseResult = UserCaseResult(caseid: 25, diagnoses: ["COPD"], reason: "image", correct: true)
      // 2. when
      
      ssut.storeCaseResult(result: r)

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }

    func testGetListOfCompletedCases() {
      // 1. given
      //let c = 10
      // 2. when
      let ssut: UserDatabaseManager = UserDatabaseManager()
        _ = ssut.getListOfCompletedCases()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }
    func testSetCaseFavorite() {
      // 1. given
      //let c = 10
      // 2. when
      let ssut: UserDatabaseManager = UserDatabaseManager()
        let x = ssut.setCaseFavorite(idInput: 10, favoriteInput: true)

      // 3. then
      XCTAssertEqual(x, true, "incorrectly set favorite")
    }
    func testGetFavoriteCases() {
      // 1. given
      //let c = 10
      // 2. when
      let ssut: UserDatabaseManager = UserDatabaseManager()
      let x = ssut.getFavoriteCases()

      // 3. then
      XCTAssertEqual(x, [], "wrong cases returned")
    }

    func testgetUserCaseById() {
      // 1. given
      //let c = 10
      // 2. when
      let ssut: UserDatabaseManager = UserDatabaseManager()
      let x = try! ssut.getUserCaseById(Id: 10)

      // 3. then
      XCTAssertEqual(x.caseid, 10, "returned wrong case")
    }

    func testGetUserDiagnosis() {
      // 1. given
      //let c = 10
      // 2. when
      let id = 10;
      let ssut: UserDatabaseManager = UserDatabaseManager()
      let x = ssut.getUserDiagnosis(idInput: Int64(id))

      // 3. then
      XCTAssertEqual(x.diagnoses, "", "returned wrong diagnoses")
    }

    func testGetAgeGroup() {
      // 1. given
      //let c = 10
      // 2. when
      let ssut: UserDatabaseManager = UserDatabaseManager()
      _ = ssut.getAgeGroup()

      // 3. then
      //XCTAssertEqual(sut.scoreRound, 10, "returned wrong case id")
    }

    func testGetGenderGroup() {
      // 1. given
      //let c = 10
      // 2. when
      let ssut: UserDatabaseManager = UserDatabaseManager()
      _ = ssut.getGenderGroup()

      // 3. then
      //XCTAssertGreaterThan(x, 0, "returned wrong case id")
    }




}
