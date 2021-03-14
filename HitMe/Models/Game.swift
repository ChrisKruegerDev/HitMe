import Foundation


struct LeaderboardEntry {
	let score: Int
	let date: Date
}

struct Game {
	
	var target = Int.random(in: 1...100)
	var score = 0
	var round = 1
	var leaderboardEntries: [LeaderboardEntry] = []
	
	init(loadTestData: Bool = false) {
		if loadTestData {
			addToLeaderboard(points: 100)
			addToLeaderboard(points: 80)
			addToLeaderboard(points: 300)
			addToLeaderboard(points: 50)
			addToLeaderboard(points: 150)
			addToLeaderboard(points: 520)
			addToLeaderboard(points: 10)
		}
	}
	
	
	func points(sliderValue: Int) -> Int {
		let difference = abs(self.target - sliderValue)
		let bonus: Int
		if difference == 0 {
			bonus = 100
		}
		else if difference <= 2 {
			bonus = 50
		}
		else {
			bonus = 0
		}
		
		return 100 - difference + bonus
	}
	
	mutating func addToLeaderboard(points: Int) {
		leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
		leaderboardEntries.sort { $0.score > $1.score }
	}
	
	mutating func startNewRound(points: Int) {
		score += points
		round += 1
		target = Int.random(in: 1...100)
		addToLeaderboard(points: points)
	}
	
	mutating func restart() {
		score = 0
		round = 1
		target = Int.random(in: 1...100)
	}
	
}
