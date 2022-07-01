
//    ViewController.swift
//Rock Scissors and Paper

//Created by Dmitry Alexandrovich on 13.04.22.


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var phoneButton: UIButton!
    
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var winScoreLabel: UILabel!
    @IBOutlet weak var drawScoreLabel: UILabel!
    @IBOutlet weak var loseScoreLabel: UILabel!
    
    @IBOutlet weak var resetScoreButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
    }
    
    var resultWin = 0
    var resultLose = 0
    var resultDraw = 0
    
    
    func play(_ sign: Sign){
        let computerSign = randomSign()
        phoneButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case.rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        resetButton.isHidden = false
        
        let result = sign.takeTurn(computerSign)
        
        switch result {
        case .win:
            statusLabel.text = "It's a win!"
            resultWin += 1
            winScoreLabel.text = "\(resultWin)"
            self.view.backgroundColor = UIColor.green
        case .lose:
            statusLabel.text = "You lose!"
            self.view.backgroundColor = UIColor.red
            resultLose += 1
            loseScoreLabel.text = "\(resultLose)"
        case .start:
            reset()
        case .draw:
            statusLabel.text = "It's a draw!"
            self.view.backgroundColor = UIColor.gray
            resultDraw += 1
            drawScoreLabel.text = "\(resultDraw)"
        
        }
        
    }
    func reset() {
        statusLabel.text = "Rock, scissors and paper!"
        self.view.backgroundColor = UIColor.white
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = false
        
        resetButton.isHidden = true
    }
    
    func resetScore() {
        resultWin = 0
        resultLose = 0
        resultDraw = 0
        drawScoreLabel.text = "\(resultDraw)"
        loseScoreLabel.text = "\(resultLose)"
        winScoreLabel.text = "\(resultWin)"
        
    }
    
    // MARK: - IbActoin
    
    @IBAction func rockButtonPressed(_ sender: Any) {
        play(.rock)
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(.paper)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
    
    @IBAction func resetScoreButtonPressed(_ sender: UIButton) {
        resetScore()
    }
    
    
}
