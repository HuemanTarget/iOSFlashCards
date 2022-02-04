//
//  ContentView.swift
//  iOSFlashCard
//
//  Created by Joshua Basche on 2/4/22.
//

import SwiftUI

struct ContentView: View {
	
	@State private var cards = [Card](repeating: Card.example, count: 10)
	
	var body: some View {
		ZStack {
			
			Image("Background")
				.resizable()
				.ignoresSafeArea()
			
			VStack {
				ZStack {
					ForEach(0..<cards.count, id: \.self) { index in
						CardView(card: cards[index])
							.stacked(at: index, in: cards.count)
					}
				}
			}
		}
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
