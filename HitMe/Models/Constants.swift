import SwiftUI


/// Hold constants about the view styling
enum Constants {
	
	enum General {
		public static let strokeWidth = CGFloat(2.0)
		public static let roundedViewLength = CGFloat(56.0)
		public static let roundRectViewWidth = CGFloat(68.0)
		public static let roundRectViewHeight = CGFloat(56.0)
		public static let roundRectCornerRadius = CGFloat(21.0)
	}
	
	enum Color {
		public static let backgroundColor = SwiftUI.Color("BackgroundColor")
		public static let textColor = SwiftUI.Color("TextColor")
	}
	
	enum Leaderboard {
		public static let leaderboardScoreColWidth = CGFloat(50.0)
		public static let leaderboardDateColWidth = CGFloat(170.0)
		public static let leaderboardMaxRowWidth = CGFloat(480.0)
	}
	
}
