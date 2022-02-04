//
//  ContentView.swift
//  iOSFlashCard
//
//  Created by Joshua Basche on 2/4/22.
//

import SwiftUI

struct ContentView: View {
	@Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
	
	@State private var cards = [Card](repeating: Card.example, count: 10)
	@State private var timeRemaining: Int = 100
	
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	
	var body: some View {
		ZStack {
			
			Image("Background")
				.resizable()
				.ignoresSafeArea()
			
			VStack {
				Text("Time: \(timeRemaining)")
					.font(.largeTitle)
					.foregroundColor(.white)
					.padding(.horizontal, 20)
					.padding(.vertical, 5)
					.background(.black.opacity(0.75))
					.clipShape(Capsule())
				
				ZStack {
					ForEach(0..<cards.count, id: \.self) { index in
						CardView(card: cards[index]) {
							withAnimation {
								removeCard(at: index)
							}
						}
						.stacked(at: index, in: cards.count)
					}
				}
			}
			
			if differentiateWithoutColor {
				VStack {
					Spacer()
					
					HStack {
						Image(systemName: "xmark.circle")
							.padding()
							.background(.black.opacity(0.7))
							.clipShape(Circle())
						
						Spacer()
						
						Image(systemName: "checkmark.circle")
							.padding()
							.background(.black.opacity(0.7))
							.clipShape(Circle())
					}
					.foregroundColor(.white)
					.font(.largeTitle)
					.padding()
				}
			}
		}
		.onReceive(timer) { time in
			if timeRemaining > 0 {
				timeRemaining -= 1
			}
		}
	}
	
	func removeCard(at index: Int) {
		cards.remove(at: index)
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

extension View {
	func stacked(at position: Int, in total: Int) -> some View {
		let offset = Double(total - position)
		return self.offset(x: 0, y: offset * 10)
	}
}
