//
//  classes.swift
//  RockPaperScissors
//
//  Created by Kim EenSung on 11/28/23.
//

import Foundation

struct GameMaster {
    var gameType: GameType = .rockPaperScissors
    var turn: Turn = .computer
    
    mutating func playGame() {
        var userInput: String?
        
        gameLoop : repeat {
            
            print(self.gameType.message(turn: self.turn), terminator: "")
            
            userInput = readLine()
            
            switch userInput {
                
            case "0":
                break gameLoop
                
            case "1", "2", "3":
                guard let input = userInput, let intUserInput = Int(input) else {
                    break
                }
                
                let (gameResult, gameType, turn) = self.gameType.play(turn: self.turn, userInput: intUserInput)
                self.gameType = gameType
                self.turn = turn
                
                if gameResult == .completed {
                    break gameLoop
                }
                
            default :
                self.turn = .computer
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
            
        } while userInput != "0"
        print("게임 종료")
    }
}
