//
//  CardView.swift
//  iOSFlashCard
//
//  Created by Joshua Basche on 2/4/22.
//

import SwiftUI

struct CardView: View {
	let card: Card
	
	@State var isShowingAnswer: Bool = false
	
	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 25, style: .continuous)
				.fill(.white)
				.shadow(radius: 10)
			
			VStack {
				Text(card.prompt)
					.font(.largeTitle)
					.foregroundColor(.black)
				
				if isShowingAnswer {
					Text(card.answer)
						.font(.title)
						.foregroundColor(.gray)
				}
			}
			.padding(20)
			.multilineTextAlignment(.center)
		}
		.frame(width: 350, height: 250)
		.onTapGesture {
			isShowingAnswer.toggle()
		}
	}
}

struct CardView_Previews: PreviewProvider {
	static var previews: some View {
		CardView(card: Card.example)
.previewInterfaceOrientation(.portrait)
	}
}
