//
//  CardReaderView.swift
//  Flash Cards
//
//  Created by David Solis on 3/14/24.
//

import SwiftUI

struct CardReaderView: View {
    let color: Color
    let text: String
    var displaysCode: Bool = false
    
    var body: some View {
        CardContainerView {
            Text(text)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.33)
                .padding()
                .fontDesign(displaysCode ? .monospaced : .default)
        }
        .backgroundStyle(color)
    }
}

#Preview("Card Reader Front") {
    CardReaderView(color: Color.cardFront, text: "7 x 7", displaysCode: false)
}

#Preview("Card Reader Back") {
    CardReaderView(color: Color.cardBack, text: "49", displaysCode: true)
}
