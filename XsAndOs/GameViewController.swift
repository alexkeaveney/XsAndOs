//
//  GameViewController.swift
//  XsAndOs
//
//  Created by admin on 17/08/2017.
//  Copyright © 2017 Alex Keaveney. All rights reserved.
//

import UIKit

/* This script contains all of the logic for the game including restarting the game or sending the user back to the home screen */

class GameViewController: UIViewController {

    //starts with users turn
    var playerTurn = 1
    
    //holds the moves that each player has made
    var player1moves = [Int]()
    var player2moves = [Int]()
    
    
    /* stores buttons 1 to 9 */
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    
    //array to hold all of the buttons
    var buttons: [UIButton] = [UIButton]()
    
    
    override func viewDidLoad() {
        
        //puts all of the buttons in an array for access later
        self.buttons = [button1, button2, button3, button4, button5, button6, button7, button8, button9]
    
    }
    
    /* This function is called when a button is tapped by the user or the computer play a move */
    @IBAction func buttonTapped(_ sender: Any) {
        
        //gets the button it was sent from
        let button = sender as! UIButton
        
        //passes the button into the play turn method to select that button as a turn
        playTurn(button: button)
        
        //checks if someone has won
        FindWinner()
    }
    
    /* Function to alternate between turns */
    func playTurn(button: UIButton) {
        
        // humans turn
        if playerTurn == 1 {
            
            //sets the buttons title to X
            button.setTitle("X", for: UIControlState.normal)
            
            //sets the background of the button to green
            button.backgroundColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
            
            //puts the button index in the players moves array
            player1moves.append(button.tag)
            
            //changes the playersTurn to the computers turn (2)
            playerTurn = 2
            
            //Calls the function to take the computers turn
            ComputerTurn()
        }
            
        //computers turn
        else {
            
            //sets the button title for the computer to O
            button.setTitle("O", for: UIControlState.normal)
            
            //sets the button background to red
            button.backgroundColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0)
            
            //puts the button index in player 2 moves array
            player2moves.append(button.tag)
            
            //changes the playerTurn to the humans turn
            playerTurn = 1
        }
        
        //disables the button so the same button cant be used in future turns
        button.isEnabled = false
        
    }
    
    /* The function is called after each turn to check if someone won */
    func FindWinner() {
        
        //set to -1 when there is no winner
        var winner = -1
        
        /* each possibility for winning is evaluated below after each turn */
        
        /* each row is checked that either player hasn't all of that row filled */
        
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
        
        /* each column is checked to see if either player has filled it */
        
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
        
        /* The two horizontal directions are checked that either player hasnt filled them */
        
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
        
        //this checks if there is no more moves left to make
        if player1moves.count + player2moves.count == 9 {
            //winner is set to 3 for a draw
            winner = 3
        }
        
        //checks if there is a winner
        if winner != -1 {
            
            //holds the message for who wins / a draw
            var message = ""
        
            //1 for human wins
            if winner == 1 {
                message = "Player 1 wins!"
            }
                
            //2 for computer wins
            else if winner == 2 {
                message = "Player 2 wins!"
            }
                
            //3 for a draw
            else {
                message = "It's a draw!"
            }
        
            //new alert controller to present the result to the user. The message is passed into this
            let alert = UIAlertController(title: "Game over", message: message, preferredStyle: UIAlertControllerStyle.alert)
            
            //This alert action is used if the user selects play again to Restart the game
            alert.addAction(UIAlertAction(title: "play again?", style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction!) in
                
                //calls restart game function to reset all elements to default
                self.RestartGame()
            }))
            
            //This alert action us used if the user selects home to bring the user back to the HomeScreen
            alert.addAction(UIAlertAction(title: "home", style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction!) in
                
                //returns to HomeViewController
                self.navigationController?.popViewController(animated: true)
            }))
            
            //makes the alert visible
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /* This function is used to decide where the computer will move each turn */
    func ComputerTurn() {
        
        //array to hold the empty positions
        var emptyCells = [Int]()
        
        //loops through the positions
        for index in 1...9 {
            
            //if player 1 and player 2 moves arrays doesnt have an index
            if !(player1moves.contains(index) || player2moves.contains(index)) {
                
                //add it to the empty cells array
                emptyCells.append(index)
            }
            
        }
        
        //if there are still empty cells
        if emptyCells.count > 0 {
            
            //get a random number between 0 and the amount of empty cells
            let random = arc4random_uniform(UInt32(emptyCells.count))
            
            //gets the random cell id
            let cellId = emptyCells[Int(random)]
            
            //creates a new button
            var button = UIButton()
            
            //goes through the different indexes looking to retrieve the corresponding button
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
            
            //calls the buttonTapped function with the random button as a sender
            buttonTapped(sender: button)
        }
        
    }
    
    /* This function is used to set everything back to the way it was on view did load */
    func RestartGame() {

        //loops through the buttons
        for index in 0...buttons.count-1 {
            
            //sets their background colours back to white
            buttons[index].backgroundColor = .white
            
            //enables them all again
            buttons[index].isEnabled = true
        }
        
        //empties the player moves arrays
        player1moves.removeAll(keepingCapacity: false)
        player2moves.removeAll(keepingCapacity: false)
        
        //sets the player turn back to the humans
        playerTurn = 1
        
    }

}

