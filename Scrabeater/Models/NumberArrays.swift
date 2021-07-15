//
//  NumberArrays.swift
//  Scrabeater
//
//  Created by Hamzah Gopaul on 23/09/2020.
//  Copyright © 2020 Hamzah Gopaul. All rights reserved.

import UIKit

struct NA {
    var third : UIButton?, fourth : UIButton?, fifth : UIButton?, sixth : UIButton?
    var threeWords = [String](), threePoints = [String](), threeDefinitions = [String]()
    var fourDefinitions = [String](), fiveDefinitions = [String](), sixDefinitions = [String]()
    var fourWords = [String](), fourPoints = [String](), fiveWords = [String](), fivePoints = [String]()
    var sixWords = [String](), sixPoints = [String]()
    
    mutating func help(thirdButton: UIButton, fourthButton : UIButton, fifthButton : UIButton, sixthButton : UIButton) {
        self.third = thirdButton
        self.fourth = fourthButton
        self.fifth = fifthButton
        self.sixth = sixthButton
    }
    
    func hideStuff() {
        third!.isHidden = true
        fourth!.isHidden = true
        fifth!.isHidden = true
        sixth!.isHidden = true
    }
    
    func titleColors(previous p : Int, new n : Int) {
        switch n {
        case 3: third?.setTitleColor(UIColor.yellow, for: .normal)
        case 4: fourth?.setTitleColor(UIColor.yellow, for: .normal)
        case 5: fifth?.setTitleColor(UIColor.yellow, for: .normal)
        case 6: sixth?.setTitleColor(UIColor.yellow, for: .normal)
        default: return
        }
        
        switch p {
        case 3: third?.setTitleColor(UIColor.white, for: .normal)
        case 4: fourth?.setTitleColor(UIColor.white, for: .normal)
        case 5: fifth?.setTitleColor(UIColor.white, for: .normal)
        case 6: sixth?.setTitleColor(UIColor.white, for: .normal)
        default: return
        }
    }
    
    mutating func mainAsyncHelp(_ n : Int, _ y : [[String]]) {
        if n == 3 {
            self.threeWords = y[0]
            self.threePoints = y[1]
            self.threeDefinitions = y[2]
            self.third!.isHidden = false
        } else if n == 4 {
            self.fourWords = y[0]
            self.fourPoints = y[1]
            self.fourDefinitions = y[2]

            self.fourth!.isHidden = false
        } else if n == 5 {
            self.fiveWords = y[0]
            self.fivePoints = y[1]
            self.fiveDefinitions = y[2]
            self.fifth!.isHidden = false
        } else {
            self.sixWords = y[0]
            self.sixPoints = y[1]
            self.sixDefinitions = y[2]
            self.sixth!.isHidden = false
        }
    }
    
    mutating func wordCount(_ n : Int) -> Int {
        var exy = 0
        if n == 3 {
            exy = threeWords.count
        } else if n == 4 {
            exy = fourWords.count
        } else if n == 5 {
            exy = fiveWords.count
        } else if n == 6 {
            exy = sixWords.count
        }
        return exy
    }
    
    mutating func tableHelp(_ n : Int, _ id  : Int) -> [String] {
        var y0 : String?
        var y1 : String?
        if n == 3 {
            y0 = String(threeWords[id])
            y1 = String(threePoints[id])
        } else if n == 4 {
            y0 = String(fourWords[id])
            y1 = String(fourPoints[id])
        } else if n == 5 {
            y0  = String(fiveWords[id])
            y1 = String(fivePoints[id])
        } else if n == 6 {
            y0  = String(sixWords[id])
            y1 = String(sixPoints[id])
        }
        return [y0!,y1!]
    }
    
    mutating func definitionHelp(_ n : Int, _ id : Int) -> [String] {
        var z = ""
        var x = ""
        if n == 3 {
            z = threeDefinitions[id]
            x = String(threeWords[id])
        } else if n == 4 {
            z = fourDefinitions[id]
            x = String(fourWords[id])
        } else if n == 5 {
            z = fiveDefinitions[id]
            x = String(fiveWords[id])
        } else if n == 6 {
            z = sixDefinitions[id]
            x = String(sixWords[id])
        }
        return [x,z]
    }
    
}
