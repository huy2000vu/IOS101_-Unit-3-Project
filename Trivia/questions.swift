//
//  questions.swift
//  Trivia
//
//  Created by X Y on 3/11/24.
//

import Foundation
import UIKit
struct Question {
    let prompt: String
    let answers: [String]
    let correctAnswer: String
    let category: String
}

enum QuestionCode{
    case q1,q2,q3,q4
    var details: (prompt: String, category:String){
        switch self{
        case .q1:
            return ("How many bones are in the human body?", "Anatomy")
        case .q2:
            return ("Who sings 'Poker Face'?", "Music")
        case .q3:
            return ("Which one of the following is the largest ocean in the world?", "Geography")
        case .q4:
            return ("Who is the best member in BlackPink?", "Pop Culture")
        }
    }
}
