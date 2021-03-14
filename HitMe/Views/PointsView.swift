import SwiftUI

struct PointsView: View {
	
	@Binding var alertIsVisible: Bool
	@Binding var sliderValue: Double
	@Binding var game: Game
	
	var body: some View {
		let roundedValue = Int(self.sliderValue.rounded())
		let points = self.game.points(sliderValue: roundedValue)
		
		VStack(spacing: 10) {
			InstructionText(text: "The slider's value is")
			BigNumberText(text: String(roundedValue))
			BodyText(text: "Your scored \(points) Points\n🎉🎉🎉")
			Button(action: {
				withAnimation {
					alertIsVisible = false
				}
				game.startNewRound(points: points)
			}) {
				ButtonText(text: "Start New Round")
			}
		}
		.padding()
		.frame(maxWidth: 300)
		.background(Constants.Color.backgroundColor)
		.cornerRadius(21.0)
		.shadow(radius: 10, x: 5, y: 5)
		.transition(.scale)
	}
	
}

struct PointsView_Previews: PreviewProvider {
	
	static private var alertIsVisible = Binding.constant(true)
	static private var sliderValue = Binding.constant(50.0)
	static private var game = Binding.constant(Game())
	
	static var previews: some View {
		PointsView(
			alertIsVisible: alertIsVisible,
			sliderValue: sliderValue,
			game: game
		).preferredColorScheme(.dark)
		
		PointsView(
			alertIsVisible: alertIsVisible,
			sliderValue: sliderValue,
			game: game
		).previewLayout(.fixed(width: 568, height: 320))
	}
	
}
