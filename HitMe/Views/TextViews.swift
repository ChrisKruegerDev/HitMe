import SwiftUI

struct InstructionText: View {
	
	var text: String
	
	var body: some View {
		Text(text.uppercased())
			.bold()
			.kerning(2.0)
			.multilineTextAlignment(.center)
			.lineSpacing(4.0)
			.font(.footnote)
			.foregroundColor(Color("TextColor"))
	}
	
}

struct BigNumberText: View {
	
	var text: String
	
	var body: some View {
		Text(text)
			.kerning(-1.0)
			.font(.largeTitle)
			.fontWeight(.bold)
			.foregroundColor(Color("TextColor"))
	}
	
}

struct SliderLabelText: View {
	
	var text: String
	
	var body: some View {
		Text(text)
			.bold()
			.foregroundColor(Color("TextColor"))
			.multilineTextAlignment(.center)
			.frame(width: 35.0)
	}
	
}


struct LabelText: View {
	
	var text: String
	
	var body: some View {
		Text(text.uppercased())
			.bold()
			.kerning(1.5)
			.font(.caption)
			.multilineTextAlignment(.center)
			.foregroundColor(Color("TextColor"))
	}
	
}

struct BodyText: View {
	
	var text: String
	
	var body: some View {
		Text(text)
			.font(.subheadline)
			.fontWeight(.semibold)
			.multilineTextAlignment(.center)
			.frame(maxWidth: .infinity)
			.lineLimit(2)
			.lineSpacing(12.0)
	}
	
}


struct ButtonText: View {
	
	var text: String
	
	var body: some View {
		Text(text)
			.bold()
			.padding()
			.frame(maxWidth: .infinity)
			.background(Color.accentColor)
			.foregroundColor(Color.white)
			.cornerRadius(12.0)
	}
	
}


struct ScoreText: View {
	
	var score: Int
	
	var body: some View {
		Text(String(score))
			.bold()
			.kerning(-0.2)
			.foregroundColor(Constants.Color.textColor)
			.font(.title3)
	}
	
}


struct DateText: View {
	
	var date: Date
	
	var body: some View {
		Text(date, style: .time)
	}
	
}


struct BigBoldText: View {
	
	var text: String
	
	var body: some View {
		Text(text.uppercased())
			.kerning(2.0)
			.foregroundColor(Constants.Color.textColor)
			.font(.title)
			.fontWeight(.black)
	}
	
}

struct TextViews_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			InstructionText(text: "Instructions")
			BigNumberText(text: "999")
			SliderLabelText(text: "1")
			LabelText(text: "Label")
			BodyText(text: "Your scored 200 Points \n 🎉🎉🎉")
			ButtonText(text: "Start New Round")
			ScoreText(score: 459)
			DateText(date: Date())
			BigBoldText(text: "Leaderboard")
		}.padding()
	}
}
