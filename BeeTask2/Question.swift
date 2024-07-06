// Question.swift
import SwiftUI

struct Question {
    enum QuestionType {
        case whichColorIs
        case whichColorMeans
    }
    
    let type: QuestionType
    let word: String
    let wordColor: Color
    let correctAnswer: Color
}
