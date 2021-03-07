//
//  ContentView.swift
//  Memorize
//
//  Created by Kirill Denisov on 12.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }.padding(4)
            }.padding()
             .foregroundColor(Color.red)

        }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader {geometry in self.body(for: geometry.size)}
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.FaceUp {
           RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
           RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth:lineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
            RoundedRectangle(cornerRadius: cornerRadius).fill()}
            }
           
       }
        .font(Font.system(size: fontSize(for: size)))

    }
    // MARK: - Drawing constants
    
    let cornerRadius: CGFloat = 10.0
    let lineWidth: CGFloat = 3.0
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
