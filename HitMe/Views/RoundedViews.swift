import SwiftUI

struct RoundedImageViewStroked: View {
	
	var systemName: String
	
    var body: some View {
		Image(systemName: systemName)
			.font(.title)
			.foregroundColor(Constants.Color.textColor)
			.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			.overlay(
				Circle()
					.strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
			)
    }
}

struct RoundedImageViewFilled: View {
	
	var systemName: String
	
	var body: some View {
		Image(systemName: systemName)
			.font(.title)
			.foregroundColor(Color("ButtonFilledTextColor"))
			.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			.background(
				Circle()
					.fill(Color("ButtonFilledBackgroundColor"))
			)
	}
}

struct RoundedRectTextView: View {
	
	var text: String
	
	var body: some View {
		Text(text)
			.kerning(-0.2)
			.bold()
			.font(.title3)
			.fontWeight(.bold)
			.frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
			.foregroundColor(Constants.Color.textColor)
			.overlay(
				RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
					.stroke(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
					.foregroundColor(Color("ButtonStrokeColor"))
			)
		
	}
}


struct RoundedTextView: View {
	
	var text: String
	
	var body: some View {
		Text(text)
			.font(.title)
			.foregroundColor(Constants.Color.textColor)
			.frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
			.overlay(
				Circle()
					.strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
			)
	}
}

struct PreviewView: View {
	var body: some View {
		VStack(spacing: 10) {
			RoundedImageViewStroked(systemName: "arrow.counterclockwise")
			RoundedImageViewFilled(systemName: "list.dash")
			RoundedRectTextView(text: "100")
			RoundedTextView(text: "1")
		}
	}
}


struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
		PreviewView()
			.preferredColorScheme(.dark)
		PreviewView()
    }
}
