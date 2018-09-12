//
//  ResultsVC.swift
//  PersonalityQuiz
//
//  Created by Максим on 11.09.2018.
//  Copyright © 2018 MaksimEliseev. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefenetionLabel: UILabel!

    var responces: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatePersonalityResults()
        navigationItem.title = "Результат"
    }
    
    func calculatePersonalityResults() {
        var frequencyOfAnswer: [AnimalType: Int] = [:]
        let responseTypes = responces.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswer[response] = (frequencyOfAnswer[response] ?? 0) + 1
        }
        
        let mostCommonAnswer = frequencyOfAnswer.sorted{ $0.1  > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefenetionLabel.text = mostCommonAnswer.defition
    }
}
