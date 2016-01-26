//
//  ViewController.swift
//  Quiz
//
//  Created by Lifoma Salaam on 1/21/16.
//  Copyright © 2016 Lifoma Salaam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel! //Outlet for the QuestionLabel
    @IBOutlet var answerLabel: UILabel! //Outlet for the answerLabel
    @IBOutlet var checkAnswerLabel: UILabel! //Outlet for the checkAnswerLabel
    @IBOutlet var answerTextField: UITextField! //Outlet for the answer Text Field
    
    
    let questions:[String] = ["From what is cognac made?", "What is 7+7?", "What is the capital of Vermont?"] // Creates an array of question to be asked
    
    let answers: [String] = ["Grape","14","Montpelier"] // Creates an array of answers to the questions asked
    
    var currentQuestionIndex: Int = 0 // variable to keep count of the questions
    
    @IBAction func showNextQuestion(sender: AnyObject){
        // this action is called when the nextQuestion button is pressed
        // this function changes the question label to the next question
        ++currentQuestionIndex
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "..."
    
    }
    
    @IBAction func showAnswer(sender: AnyObject){
        // this action is called when the showAnswer button is pressed
        // this function changes the answerLabel to the answer of the question displayed
        
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        // this function is called when the quiz application is loaded.
        // loads the first question into the question label
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    
    @IBAction func answerFieldEditingChange(textField: UITextField){
        // This function is called while the text in the textField is being edited
        if let text = textField.text{
            if text == answers[currentQuestionIndex]{
                checkAnswerLabel.text = "Right!!"
            }
            else {
                checkAnswerLabel.text = "Try again!!"
            }
        }
        
    }
    @IBAction func dismissKeyboard(sender: AnyObject) {
        // this function is called when the users taps the screen to dismiss the keyboard.
        answerTextField.resignFirstResponder()
    }
    
}

