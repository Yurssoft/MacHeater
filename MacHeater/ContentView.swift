//
//  ContentView.swift
//  MacHeater
//
//  Created by Yurii B on 12/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "hold.brakesignal")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .tint(.red)
            HStack {
                Image(systemName: "flame")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .tint(.orange)
                Image(systemName: "flame")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .tint(.orange)
                Image(systemName: "flame")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .tint(.orange)
                Image(systemName: "flame")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .tint(.orange)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
