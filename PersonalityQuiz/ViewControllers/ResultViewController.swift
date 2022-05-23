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

        getResultForQuiz(with: receivedAnswers)
    }

    private func getResultForQuiz(with answers: [Answer]) {

        var counterDictionary: [Animal: Int] = [:]
        var resultAnimal: Animal!

        answers.forEach {
            counterDictionary[$0.animal, default: 0] += 1
        }

        resultAnimal = counterDictionary.sorted { $0.value > $1.value }.first?.key
        showResultOfQuiz(resultAnimal)

        showResultOfQuiz(resultAnimal)
    }

    private func showResultOfQuiz(_ result: Animal) {
        resultAnimalLabel.text = "Вы - \(result.rawValue)"
        resultDefinitionLabel.text = result.definition
    }
}
