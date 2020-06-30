//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Varun on 6/11/20.
//  Copyright © 2020 Varun. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    // View controller lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Outlet 
    @IBOutlet weak var wonLabel: UILabel!
    
    // Variables declaration
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true

    // When the user clicks a field to place an X or O
    @IBAction func buttonClicked(_ sender: Any)
    {
        if gameState[(sender as AnyObject).tag-1] == 0 && gameIsActive == true
        {
            gameState[(sender as AnyObject).tag - 1] = activePlayer
            
        if activePlayer == 1
        {
            (sender as AnyObject).setImage(UIImage(named:"Cross.jpg"), for: UIControl.State())
            activePlayer = 2
        }
        else
        {
            (sender as AnyObject).setImage(UIImage(named:"Circle.jpg"), for: UIControl.State())
            activePlayer = 1
        }
            
        }
    
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                if gameState[combination[0]] == 1
                {
                    wonLabel.text = "X HAS WON!"
                }
                else
                {
                    wonLabel.text = "O HAS WON!"
                }
                
                playAgainButton.isHidden = false
                wonLabel.isHidden = false
            }
        }
        
        gameIsActive = false
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            wonLabel.text = "IT WAS A DRAW!"
            wonLabel.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    // Outlet
    @IBOutlet weak var playAgainButton: UIButton!
    
    // When user wants to play again
    @IBAction func playAgain(_ sender: Any)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        wonLabel.isHidden = true

        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
}
