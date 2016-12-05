//
//  MenuViewController.swift
//  InterviewFlashCards
//
//  Created by Charles Kang on 11/2/16.
//  Copyright © 2016 Varindra Hart. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    enum Section: Int {
        case ios
        case dataStructures
        case algorithms
    }

    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Interview Flash Cards"
    }

    // MARK: Actions
    @IBAction func sectionButtonTapped(sender: UIButton) {
        guard let section = Section(rawValue: sender.tag),
            let storyboard = storyboard,
            let questionVC = storyboard
                .instantiateViewControllerWithIdentifier("QuestionsViewController")
                as? QuestionsViewController
            else {
                fatalError("Invalid Section")
        }
        questionVC.sectionName = sender.titleLabel?.text ?? ""

        switch section {
        case .ios:
            questionVC.set(sectionType: .iOSTechnical)
        case .dataStructures:
            questionVC.set(sectionType: .DataStructures)
        case .algorithms:
            questionVC.set(sectionType: .Algorithms)
        }
        navigationController?.pushViewController(questionVC, animated: true)
    }

}
