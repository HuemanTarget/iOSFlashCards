//
//  ContentView.swift
//  iOSFlashCard
//
//  Created by Joshua Basche on 2/4/22.
//

import SwiftUI

struct ContentView: View {
	
	var body: some View {
		CardView(card: Card.example)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
