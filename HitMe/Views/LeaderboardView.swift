// LeaderboardView.swift

import SwiftUI

struct LeaderboardView: View {
	
	@Binding var leaderboardIsShowing: Bool
	@Binding var game: Game
	
	var body: some View {
		ZStack {
			Constants.Color.backgroundColor
				.edgesIgnoringSafeArea(.all)
			VStack(spacing: 10) {
				HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
				LabelView()
				ScrollView {
					VStack(spacing: 10) {
						ForEach(game.leaderboardEntries.indices) { i in
							let entry = game.leaderboardEntries[i]
							RowView(index: i, score: entry.score, date: entry.date)
						}
					}
				}
			}
		}
	}
	
}

struct RowView: View {
	
	let index: Int
	let score: Int
	let date: Date
	
	var body: some View {
		HStack {
			RoundedTextView(text: String(index))
			Spacer()
			ScoreText(score: score)
				.frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
			Spacer()
			DateText(date: date)
				.frame(width: Constants.Leaderboard.leaderboardDateColWidth)
		}.background(
			RoundedRectangle(cornerRadius: .infinity)
				.strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
		)
		.padding(.leading)
		.padding(.trailing)
		.frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
		
	}
	
}

struct HeaderView: View {
	
	@Binding var leaderboardIsShowing: Bool
	/// .regular and .compact for landscape, otherwise vice versa
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	@Environment(\.verticalSizeClass) var verticalSizeClass
	
	var body: some View {
		ZStack {
			HStack {
				if verticalSizeClass == .regular && horizontalSizeClass == .compact {
					BigBoldText(text: "Leaderboard")
						.padding(.leading)
					Spacer()
				} else {
					BigBoldText(text: "Leaderboard")
				}
			}
			HStack {
				Spacer()
				Button(action: {
					leaderboardIsShowing = false
				}, label: {
					RoundedImageViewFilled(systemName: "xmark")
						.padding(.trailing)
				})
			}
		}
		.padding(.top)
	}
	
}

struct LabelView: View {
	
	var body: some View {
		HStack {
			Spacer()
				.frame(width: Constants.General.roundedViewLength)
			Spacer()
			LabelText(text: "Score")
				.frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
			Spacer()
			LabelText(text: "Date")
				.frame(width: Constants.Leaderboard.leaderboardDateColWidth)
		}
		.padding(.leading)
		.padding(.trailing)
		.frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
	}
	
}

struct LeaderboardView_Previews: PreviewProvider {
	
	static private var leaderboardIsShowing = Binding.constant(false)
	static private var game = Binding.constant(Game(loadTestData: true))
	
	static var previews: some View {
		
		LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
			.preferredColorScheme(.dark)
		LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game).previewLayout(.fixed(width: 568, height: 320))
	}
}
