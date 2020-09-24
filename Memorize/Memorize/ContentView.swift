//
//  ContentView.swift
//  Memorize
//
//  Created by Christian David Turner on 9/24/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return HStack {
            ForEach(0..<4) { index in
                ZStack {
                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                    Text("🦂")
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
        
    }
}






































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
