//
//  pointsCalculator.swift
//  Scrabeater
//
//  Created by Hamzah Gopaul on 01/09/2020.
//  Copyright © 2020 Hamzah Gopaul. All rights reserved.
//

import Foundation

class Pointyes {
    
    var lettersInput = "X"
    var letterInput : Character = "P"
    var lWPoints = [Int]()
    var finalWordsArray = [String]()
    var finalPointsArray = [String]()
    var finalDefinitionsArray = [String]()
    var hasDefinedWordsFinished = false

    func points(howManyPointsFor letter : Character) -> Int {
        letterInput = letter
        switch letterInput {
        case "A","E","I","L","N","O","R","S","T","U":
            return 1
        case "D","G":
            return 2
        case "B","C","P":
            return 3
        case "F","H","V","W","Y":
            return 4
        case "K":
            return 5
        case "J","X":
            return 8
        case "Q","Z":
            return 10
        default:
            return 0
        }
    }
    
    func totalPoints(totalPointsFor letters : String) -> Int {
        lettersInput = letters
        var appendedPoints = 0
        for char in lettersInput {
            appendedPoints += points(howManyPointsFor: char)
        }
        return appendedPoints
    }
        
    func totalPoints(totalPointsFor wordz : [String]) -> [[String]] {
        let defAndNewWords = DataProcess()
        let y = defAndNewWords.findDefinitions(undefinedWords: wordz)
        
        for x in y[0] {
            lWPoints.append(totalPoints(totalPointsFor: x.uppercased()))
        }
        
        for _ in 0..<y[0].count {
            let indexfound = lWPoints.firstIndex(of: lWPoints.max()!)
            finalPointsArray.append(String(lWPoints[indexfound!]))
            finalWordsArray.append((y[0][indexfound!]))
            finalDefinitionsArray.append((y[1][indexfound!]))
            lWPoints[indexfound!] = 0
        }
        return [finalWordsArray,finalPointsArray,finalDefinitionsArray]
    }
}
