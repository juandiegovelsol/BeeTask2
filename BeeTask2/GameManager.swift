// GameManager.swift
import SwiftUI

class GameManager: ObservableObject {
    @Published var currentQuestion: Question?
    @Published var score: Int = 0
    @Published var isGameOver: Bool = false
    
    private var questions: [Question] = []
    private var currentQuestionIndex = 0
    private var consecutiveFailures = 0
    
    init() {
        generateQuestions()
        nextQuestion()
    }
    
    private func generateQuestions() {
        // Generate a series of random questions
        for _ in 0..<50 {
            let type: Question.QuestionType = Bool.random() ? .whichColorIs : .whichColorMeans
            let word = ["RED", "BLUE"].randomElement()!
            let wordColor: Color = Bool.random() ? .red : .blue
            let correctAnswer: Color = type == .whichColorIs ? wordColor : (word == "RED" ? .red : .blue)
            
            questions.append(Question(type: type, word: word, wordColor: wordColor, correctAnswer: correctAnswer))
        }
    }
    
    func nextQuestion() {
        if currentQuestionIndex < questions.count {
            currentQuestion = questions[currentQuestionIndex]
            currentQuestionIndex += 1
        } else {
            generateQuestions()
            currentQuestionIndex = 0
            nextQuestion()
        }
    }
    
    func checkAnswer(_ answer: Color) {
        guard let currentQuestion = currentQuestion else { return }
        
        if answer == currentQuestion.correctAnswer {
            score += 1
            consecutiveFailures = 0
        } else {
            consecutiveFailures += 1
            if consecutiveFailures >= 3 {
                isGameOver = true
            }
        }
        
        nextQuestion()
    }
    
    func restartGame() {
        score = 0
        isGameOver = false
        consecutiveFailures = 0
        currentQuestionIndex = 0
        generateQuestions()
        nextQuestion()
    }
}
