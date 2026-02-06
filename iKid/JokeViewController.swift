//
//  ViewController.swift
//  iKid
//
//  Created by Parshvi Balu on 2/5/26.
//

import UIKit

class JokeViewController: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!

    private var showingPunchline = false
    private var setupText: String = ""
    private var punchlineText: String = ""
    
    private var cards: [String] = []
    private var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        switch tabBarItem.title {
        case "Good":
            cards = [
                "Knock knock.",
                "Who’s there?",
                "Lettuce.",
                "Lettuce who?",
                "Lettuce in — it’s cold out here!"
            ]

        case "Pun":
            cards = [
                "I used to be a baker…",
                "But I couldn’t make enough dough."
            ]

        case "Dad":
            cards = [
                "What do you call cheese that isn’t yours?",
                "Nacho cheese."
            ]

        default:
            cards = ["Missing tab title."]
        }

        index = 0
        jokeLabel.text = cards[index]
        nextButton.setTitle("Next", for: .normal)

    }

    @IBAction func nextTapped(_ sender: UIButton) {
        index = (index + 1) % cards.count

       UIView.transition(with: jokeLabel,
                         duration: 0.4,
                         //found online to see how flip works
                         options: .transitionFlipFromRight,
                         animations: {
                             self.jokeLabel.text = self.cards[self.index]
                         },
                         completion: nil)
    }

}

