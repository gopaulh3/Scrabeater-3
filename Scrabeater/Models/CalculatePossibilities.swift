//
//  CalculationsAndJSON.swift
//  Scrabeater
//
//  Created by Hamzah Gopaul on 02/09/2020.
//  Copyright © 2020 Hamzah Gopaul. All rights reserved.
//

import UIKit

struct CalculatePossibilities {
    
    func wordIsReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSMakeRange(0, word.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en_UK")
        return misspelledRange.location == NSNotFound
    }
    
    mutating func possibilities(wordsWanted ww:Int, inputtedLetters il:String ) -> [String] {
        let inputtedLetterz = Array(il.lowercased())
        var lettersy = Set<String>()
        
        switch ww {
        case 3:
            for w in 0...6 {
                for x in 0...6 {
                    if w==x {
                        continue
                    }
                    for y in 0...6 {
                        if x==y || w==y {
                            continue
                        }
                        let combinedLetters = String(inputtedLetterz[w])+String(inputtedLetterz[x])+String(inputtedLetterz[y])
                        if wordIsReal(word: combinedLetters) {
                            lettersy.insert(combinedLetters)
                        }
                    }
                }
            }
        case 4:
            for v in 0...6 {
                for w in 0...6 {
                    if v==w {
                        continue
                    }
                    for x in 0...6 {
                        if w==x || v==x  {
                            continue
                        }
                        for y in 0...6 {
                            if x==y || v==y || w==y {
                                continue
                            }
                            let combinedLetters = String(inputtedLetterz[v])+String(inputtedLetterz[w])+String(inputtedLetterz[x])+String(inputtedLetterz[y])
                            if wordIsReal(word: combinedLetters) {
                                lettersy.insert(combinedLetters)
                            }
                        }
                    }
                }
            }
        case 5:
            for u in 0...6 {
                for v in 0...6 {
                    if u==v {
                        continue
                    }
                    for w in 0...6 {
                        if v==w || w==u {
                            continue
                        }
                        for x in 0...6 {
                            if w==x || v==x || x==u  {
                                continue
                            }
                            for y in 0...6 {
                                if x==y || v==y || w==y || y==v {
                                    continue
                                }
                                let combinedLetters = String(inputtedLetterz[u])+String(inputtedLetterz[v])+String(inputtedLetterz[w])+String(inputtedLetterz[x])+String(inputtedLetterz[y])
                                if wordIsReal(word: combinedLetters) {
                                    lettersy.insert(combinedLetters)
                                }
                            }
                        }
                    }
                }
            }
            case 6:
                for t in 0...6 {
                for u in 0...6 {
                    if t==u {
                        continue
                    }
                    for v in 0...6 {
                        if u==v || v==t {
                            continue
                        }
                        for w in 0...6 {
                            if v==w || w==u || w==t {
                                continue
                            }
                            for x in 0...6 {
                                if w==x || v==x || x==u || x==t   {
                                    continue
                                }
                                for y in 0...6 {
                                    if x==y || v==y || w==y || y==t || y==u {
                                        continue
                                    }
                                    let combinedLetters = String(inputtedLetterz[t])+String(inputtedLetterz[u])+String(inputtedLetterz[v])+String(inputtedLetterz[w])+String(inputtedLetterz[x])+String(inputtedLetterz[y])
                                    if wordIsReal(word: combinedLetters) {
                                        lettersy.insert(combinedLetters)
                                    }
                                }
                            }
                        }
                    }
                }
        }
        default:
            print("Naa mate")
        }
        return Array(lettersy)
    }
}

