//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultAnimalLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!

    var receivedAnswers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true

        let resultQuiz = getResultForQuiz(with: receivedAnswers)
        resultAnimalLabel.text = "Вы - \(resultQuiz.rawValue)"
        resultDefinitionLabel.text = resultQuiz.definition
    }

    func getResultForQuiz(with answers: [Answer]) -> Animal {

        var counterDictionary: [Animal: Int] = [:]
        var countAnswers = 0
        var resultAnswer: Animal!

        answers.forEach {
            counterDictionary[$0.animal, default: 0] += 1
        }

        for (animal, count) in counterDictionary {
            if count > countAnswers {
                countAnswers = count
                resultAnswer = animal
            } else if countAnswers == count {
                let randomResultAnswer = [resultAnswer, animal]
                resultAnswer = randomResultAnswer.randomElement() as? Animal
            }
        }
        return resultAnswer
    }
}
