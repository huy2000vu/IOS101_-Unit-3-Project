//
//  TriviaController.swift
//  Trivia
//
//  Created by X Y on 3/11/24.
//

import UIKit

class TriviaController: UIViewController {
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    private var questions: [Question] = [] //tracks the possible questions
    private var currQuestionIndex = 0

    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var QuestionNum: UILabel!
    @IBOutlet weak var qCategory: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions.append(Trivia.Question(prompt: "How many bones are in the human body?", answers: ["206", "195", "210", "187"], correctAnswer: "206", category: "Category: Anatomy"))
        questions.append(Trivia.Question(prompt: "Who sings 'Poker Face'?", answers: ["Madonna", "Lady Gaga",  "Katy Perry", "Rihanna"], correctAnswer: "Lady Gaga", category: "Category: Music"))
        questions.append(Trivia.Question(prompt: "Which one of the following is the largest ocean in the world", answers: ["Atlantic Ocean", "Arctic Ocean",  "Indian Ocean", "Pacific Ocean"], correctAnswer: "Pacific Ocean", category: "Category: Science"))
        questions.append(Trivia.Question(prompt: "Who is the best member in BlackPink", answers: ["Rose", "Jisoo",  "Lisa", "Jennie"], correctAnswer: "Lisa", category: "Category: Pop Culture"))
        loadCurrentQuestion()
    }
    
    private func loadCurrentQuestion() {
        guard currQuestionIndex < questions.count else { return }
        let currentQuestion = questions[currQuestionIndex]
        QuestionNum.text = "Question \(currQuestionIndex + 1) of \(questions.count)"
        qCategory.text = currentQuestion.category
        Question.text = currentQuestion.prompt

        // Set the titles of the answer buttons
        answerButton1.setTitle(currentQuestion.answers[0], for: .normal)
        answerButton2.setTitle(currentQuestion.answers[1], for: .normal)
        answerButton3.setTitle(currentQuestion.answers[2], for: .normal)
        answerButton4.setTitle(currentQuestion.answers[3], for: .normal)
    }

    @IBAction func answerButtonTapped(_ sender: UIButton) {
        guard currQuestionIndex < questions.count else { return }
        
        let answer = sender.title(for: .normal) ?? ""
        let currentQuestion = questions[currQuestionIndex]

        if answer == currentQuestion.correctAnswer {
            // Correct answer
            currQuestionIndex += 1

            if currQuestionIndex < questions.count {
                loadCurrentQuestion()
            } else {
                // All questions have been answered
                currQuestionIndex = 0 // Restart from the first question or show a completion message
                // Show a completion message or segue to a different screen
                showCompletionAlert()
            }
        } else {
            showIncorrectAnswerAlert()
        }
    }
    private func showIncorrectAnswerAlert(){
        let alert = UIAlertController(title: "Wrong answer", message: "Please select a different option",preferredStyle : .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
    }

    func showCompletionAlert() {
        let alert = UIAlertController(title: "Great job!", message: "You've completed all the questions.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.loadCurrentQuestion()
        }))
        present(alert, animated: true)
    }
}
