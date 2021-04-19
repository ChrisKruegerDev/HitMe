import SwiftUI

struct Shapes: View {
	
	@State private var wideShapes = true
	
	var body: some View {
		VStack {
			if !wideShapes {
				Circle()
					.stroke(Color.blue, lineWidth: 1.0)
					//				 .fill(Color.blue)
					.frame(width: 200, height: 100, alignment: .center)
					.transition(.opacity)
			}
			
			RoundedRectangle(cornerRadius: 20.0)
				.fill(Color.blue)
				.frame(width: wideShapes ? 200 : 100, height: 100)
				.animation(.easeInOut)
			Capsule()
				.fill(Color.blue)
				.frame(width: wideShapes ? 200 : 100, height: 100, alignment: .center)
			Ellipse()
				.fill(Color.blue)
				.frame(width: wideShapes ? 200 : 100, height: 100, alignment: .center)
			
			Button(action: {
				withAnimation {
					wideShapes.toggle()
				}
			}, label: {
				Text("Animate")
			})
		}
		.background(Color.green)
	}
}

struct Shapes_Previews: PreviewProvider {
	static var previews: some View {
		Shapes()
	}
}
