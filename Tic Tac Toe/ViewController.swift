//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by David Chavez on 2/18/17.
//  Copyright © 2017 David Chavez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    var activePlayer = 1 //Cross
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    var gameIsActive = true
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nextPiece: UIImageView!

    
    
    
    @IBOutlet weak var nextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nextPiece.image = UIImage(named: "Cross.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    @IBAction func action(_ sender: AnyObject, forEvent event: UIEvent) {
        
        
        
        
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
                nextPiece.image = UIImage(named: "Nought.png")
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activePlayer = 1
                nextPiece.image = UIImage(named: "Cross.png")

            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    label.text = "CROSS HAS WON!"
                    for i in combination{
                        let button = view.viewWithTag(i+1) as! UIButton
                        button.setImage(UIImage(named: "White Cross.png"), for: UIControlState())
                        
                    }
                    
                }
                else
                {
                    label.text = "NOUGHT HAS WON!"
                    for i in combination{
                        let button = view.viewWithTag(i+1) as! UIButton
                        button.setImage(UIImage(named: "White Nought.png"), for: UIControlState())
                        
                    }
                }
                
                playAgainLabel.isHidden = false
                label.isHidden = false
                
                for i in 1...9{
                    let button = view.viewWithTag(i) as! UIButton
                    button.isUserInteractionEnabled = false
                    
                }
                
                nextPiece.image = nil
                nextLabel.isHidden = true
            }
            
            
            
        }
        
        var count = 1
        
        if gameIsActive == true{
            for i in gameState{
                count = i*count
            }
            if count != 0
            {
                label.text = "IT WAS A DRAW"
                label.isHidden = false
                playAgainLabel.isHidden = false
                gameIsActive = false
                
                for i in 1...9{
                    let button = view.viewWithTag(i) as! UIButton
                    button.isUserInteractionEnabled = false
                    
                }
                nextPiece.image = nil
                nextLabel.isHidden = true



            }
        }

        
    }
    
    @IBOutlet weak var playAgainLabel: UIButton!
    @IBAction func playAgainButton(_ sender: Any) {
        playAgainLabel.isHidden = true
        
        label.isHidden = true
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        gameIsActive = true
        
        activePlayer = 1
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
            button.isUserInteractionEnabled = true
        }
        
        nextPiece.image = UIImage(named: "Cross.png")
        
        nextLabel.isHidden = false
      
    }
    
    
    
    

}

