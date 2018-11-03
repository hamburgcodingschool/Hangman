//
//  HangmanLogic.swift
//  Hangman
//
//  Created by Helder Pereira on 03.11.18.
//  Copyright © 2018 Hamburg Coding School. All rights reserved.
//

import Foundation

class HangmanLogic {
    
    private var secretWord: String
    
    private(set) var userWord: String = ""
    private(set) var health: Int = 6
    
    init() {
        secretWord = "Hello World"
        startGame()
    }
    
    init(word: String) {
        secretWord = word
        startGame()
    }
    
    init(words: [String]) {
        secretWord = words[Int.random(in: 0..<words.count)]
        startGame()
    }
    
    private func startGame() {
        for letter in secretWord {
            if letter == " " {
                userWord += " "
            } else {
                userWord += "-"
            }
        }
    }
    
    func check(letter: String) -> Bool {
        
        var foundIt = false
        
        for i in 0..<secretWord.count {
            
            let pos = userWord.index(userWord.startIndex, offsetBy: i)
            let range = pos...pos
            let secretLetter = secretWord[range]
            
            if letter.compare(secretLetter, options: [.caseInsensitive, .diacriticInsensitive], range: nil, locale: nil)  == .orderedSame {
                
                foundIt = true
                userWord.replaceSubrange(range, with: secretLetter)
            }
        }
        
        if !foundIt {
            health -= 1
        }
   
        return foundIt
    }
    
    func isPlaying() -> Bool {
        if health > 0 && userWord != secretWord {
            return true
        }
        return false
    }
    
    func hasWon() -> Bool {
        if !isPlaying() && health > 0 {
            return true
        }
        return false
    }
}
