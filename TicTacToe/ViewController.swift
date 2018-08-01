//
//  ViewController.swift
//  TicTacToe
//
//  Created by Junghoon Lee on 7/31/18.
//  Copyright © 2018 Junghoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var activeGame = true
    
    // 1 = noughts, 2 = crosses
    var activePlayer = 1
    
    // 0 - empty, 1 - noughts, 2 - crosses
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
       
    }
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        activeGame = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        for i in 1..<10 {
            if let mark = view.viewWithTag(i) as? UIButton {
                mark.setImage(nil, for: [])
            }
            
            winnerLabel.isHidden = true
            playAgainButton.isHidden = true
            winnerLabel.center = CGPoint(x: winnerLabel.center.x - 500, y: winnerLabel.center.y)
            playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        }
    }
    
    @IBAction func boardPressed(_ sender: AnyObject) {
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross"), for: [])
                activePlayer = 1
            }
            
            for combination in winningCombinations {
                
                print("Combination Code 0 = \(gameState[combination[0]]) 1 = \(gameState[combination[1]]) 2 = \(gameState[combination[2]])")
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        winnerLabel.text = "Player 1 has won!"
                    } else {
                        winnerLabel.text = "Player 2 has won!"
                    }
                    
                    UIView.animate(withDuration: 0.5) {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y)
                    }
                }
            }
        }
    }

}

