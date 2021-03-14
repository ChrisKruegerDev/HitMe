import XCTest
@testable import HitMe

class HitMeTests: XCTestCase {
	
	var classToTest: Game!

    override func setUpWithError() throws {
		classToTest = Game()
    }

    override func tearDownWithError() throws {
		classToTest = nil
    }

	func testScorePositive() {
		let guess = classToTest.target + 5
		let score = classToTest.points(sliderValue: guess)
		XCTAssertEqual(score, 95)
	}
	
    func testScoreNegative() {
		let guess = classToTest.target - 5
		let score = classToTest.points(sliderValue: guess)
		XCTAssertEqual(score, 95)
    }
	
	func testScoreExact() {
		let guess = classToTest.target
		let score = classToTest.points(sliderValue: guess)
		XCTAssertEqual(score, 100 + 100)
	}
	
	func testScoreClose() {
		let guess = classToTest.target + 2
		let score = classToTest.points(sliderValue: guess)
		XCTAssertEqual(score, 98 + 50)
	}
	
	func testNewRound() {
		classToTest.startNewRound(points: 100)
		XCTAssertEqual(classToTest.score, 100)
		XCTAssertEqual(classToTest.round, 2)
	}
	
	func testRestart() {
		classToTest.startNewRound(points: 100)
		XCTAssertNotEqual(classToTest.score, 0)
		XCTAssertNotEqual(classToTest.round, 1)
		classToTest.restart()
		XCTAssertEqual(classToTest.score, 0)
		XCTAssertEqual(classToTest.round, 1)
	}
	
	func testLeaderboard() {
		classToTest.startNewRound(points: 100)
		
		XCTAssertEqual(classToTest.leaderboardEntries.count, 1)
		XCTAssertEqual(classToTest.leaderboardEntries[0].score, 100)
		
		classToTest.startNewRound(points: 200)
		
		XCTAssertEqual(classToTest.leaderboardEntries.count, 2)
		XCTAssertEqual(classToTest.leaderboardEntries[0].score, 200)
		XCTAssertEqual(classToTest.leaderboardEntries[1].score, 100)
	}
	

}
