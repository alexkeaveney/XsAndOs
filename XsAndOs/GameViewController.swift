//
//  ViewController.swift
//  XsAndOs
//
//  Created by admin on 17/08/2017.
//  Copyright © 2017 Alex Keaveney. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    
    var playerTurn = 1
    
    var player1moves = [Int]()
    var player2moves = [Int]()
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        
        let button = sender as! UIButton
        
        playTurn(button: button)
        
        FindWinner()
    }
    
    func playTurn(button: UIButton) {
        
        if playerTurn == 1 {
            button.setTitle("X", for: UIControlState.normal)
            button.backgroundColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
            
            player1moves.append(button.tag)
            
            playerTurn = 2
            
            ComputerTurn()
        }
        else {
            button.setTitle("O", for: UIControlState.normal)
            button.backgroundColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0)
            
            player2moves.append(button.tag)
            playerTurn = 1
        }
        button.isEnabled = false
        
    }
    
    func FindWinner() {
        var winner = -1
        
        
        //row1
        if player1moves.contains(1) && player1moves.contains(2) && player1moves.contains(3) {
            winner = 1
        }

        if player2moves.contains(1) && player2moves.contains(2) && player2moves.contains(3) {
            winner = 2
        }
        
        //row2
        if player1moves.contains(4) && player1moves.contains(5) && player1moves.contains(6) {
            winner = 1
        }
        
        if player2moves.contains(4) && player2moves.contains(5) && player2moves.contains(6) {
            winner = 2
        }
        
        //row3
        if player1moves.contains(7) && player1moves.contains(8) && player1moves.contains(9) {
            winner = 1
        }
        
        if player2moves.contains(7) && player2moves.contains(8) && player2moves.contains(9) {
            winner = 2
        }
        
        //column1
        if player1moves.contains(1) && player1moves.contains(4) && player1moves.contains(7) {
            winner = 1
        }
        
        if player2moves.contains(1) && player2moves.contains(4) && player2moves.contains(7) {
            winner = 2
        }
        
        //column2
        if player1moves.contains(2) && player1moves.contains(5) && player1moves.contains(8) {
            winner = 1
        }
        
        if player2moves.contains(2) && player2moves.contains(5) && player2moves.contains(8) {
            winner = 2
        }
        
        //column3
        if player1moves.contains(3) && player1moves.contains(6) && player1moves.contains(9) {
            winner = 1
        }
        
        if player2moves.contains(3) && player2moves.contains(6) && player2moves.contains(9) {
            winner = 2
        }
        
        //horizontal left
        if player1moves.contains(1) && player1moves.contains(5) && player1moves.contains(9) {
            winner = 1
        }
        
        if player2moves.contains(1) && player2moves.contains(5) && player2moves.contains(9) {
            winner = 2
        }
        
        //horizontal right
        if player1moves.contains(3) && player1moves.contains(5) && player1moves.contains(7) {
            winner = 1
        }
        
        if player2moves.contains(3) && player2moves.contains(5) && player2moves.contains(7) {
            winner = 2
        }
        
        if winner != -1 {
            var message = ""
        
            if winner == 1 {
                message = "Player 1 wins!"
            }
            else if winner == 2 {
                message = "Player 2 wins!"
            }
        
            let alert = UIAlertController(title: "Game over", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default,   handler: nil)
            )
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func ComputerTurn() {
        
        //scan for empty cells
        var emptyCells = [Int]()
        
        for index in 1...9 {
            
            if !(player1moves.contains(index) || player2moves.contains(index)) {
                emptyCells.append(index)
            }
            
        }
        
        let random = arc4random_uniform(UInt32(emptyCells.count))
        
        let cellId = emptyCells[Int(random)]
        
        var button = UIButton()
        
        switch cellId {
            case 1:
                button = button1
            case 2:
                button = button2
            case 3:
                button = button3
            case 4:
                button = button4
            case 5:
                button = button5
            case 6:
                button = button6
            case 7:
                button = button7
            case 8:
                button = button8
            case 9:
                button = button9
            default:
                print("n/a")
        }
        
        buttonTapped(sender: button)
        
        
        
    }
    
    
    
}

