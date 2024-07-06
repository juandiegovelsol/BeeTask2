// GameView.swift
import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 40) {
                Text("Score: \(gameManager.score)")
                    .font(.title)
                    .foregroundColor(.white)
                
                if let question = gameManager.currentQuestion {
                    Text(question.type == .whichColorIs ? "Which color IS the word?" : "Which color MEANS the word?")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(question.word)
                        .font(.system(size: 60, weight: .bold, design: .rounded))
                        .foregroundColor(question.wordColor)
                }
                
                HStack(spacing: 20) {
                    ColorButton(title: "RED", backgroundColor: Bool.random() ? .red : .blue) {
                        gameManager.checkAnswer(.red)
                    }
                    
                    ColorButton(title: "BLUE", backgroundColor: Bool.random() ? .red : .blue) {
                        gameManager.checkAnswer(.blue)
                    }
                }
            }
        }
        .alert(isPresented: $gameManager.isGameOver) {
            Alert(
                title: Text("Game Over"),
                message: Text("Your score: \(gameManager.score)"),
                dismissButton: .default(Text("Play Again")) {
                    gameManager.restartGame()
                }
            )
        }
    }
}
