//
//  WordViewController.swift
//  Scrabeater
//
//  Created by Hamzah Gopaul on 01/09/2020.
//  Copyright © 2020 Hamzah Gopaul. All rights reserved.
//
import SCLAlertView
import UIKit

class WordViewController : UIViewController, UITextFieldDelegate {
    
    // Newly added for debugging -------------
    @IBOutlet weak var goButton: UIButton!
    // ---------------------------------------
    @IBOutlet weak var three: UIButton!, four : UIButton!, five : UIButton!, six : UIButton!
    @IBOutlet weak var resultsTB: UITableView!, lettersTextField : UITextField!
    var helpy = NA(), number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lettersTextField.delegate = self
        resultsTB.delegate = self
        resultsTB.dataSource = self
        lettersTextField.autocorrectionType = .no
        lettersTextField.attributedPlaceholder = NSAttributedString(string: "Letters", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        if lettersTextField.text?.count == 7 {
            self.view.endEditing(true)
            helpy.help(thirdButton: three, fourthButton: four, fifthButton: five, sixthButton: six)
            helpy.hideStuff()
            for x in 3...6 {
                sortOutWords(number : x)
            }
        }
    }
    
    private func sortOutWords(number n : Int) {
        var loadingBarAnimation = Animations()
        loadingBarAnimation.startLoadingBar(yourView: view)
        let tryee = Pointyes()
        var calculateIt = CalculatePossibilities()
        let il = lettersTextField.text
        
        DispatchQueue.global(qos: .userInitiated).async {
            let x = calculateIt.possibilities(wordsWanted: n, inputtedLetters: il ?? "")
            let y = tryee.totalPoints(totalPointsFor: x)
            DispatchQueue.main.async {
                self.helpy.mainAsyncHelp(n,y)
                loadingBarAnimation.loading.stopAnimating()
                return
            }
            return
        }
    }
    
    @IBAction func arrayButtonPressed(_ sender: UIButton) {
        helpy.titleColors(previous: number, new: sender.tag)
        number = sender.tag
        resultsTB.reloadData()
        
        // New addition 3rd addition version 1.3 --------------
        if (helpy.wordCount(number) > 1) {
            goButton.setTitleColor(UIColor.red, for: .normal)
        }
        // -----------------------------------------------------
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.letters
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet) && range.location < 7
    }
}

extension WordViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SCLAlertView().showInfo(helpy.definitionHelp(number, indexPath.row)[0].capitalized, subTitle: helpy.definitionHelp(number, indexPath.row)[1])
    }
}

extension WordViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return helpy.wordCount(number)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = helpy.tableHelp(number,indexPath.row)[0]
        cell.detailTextLabel?.text = helpy.tableHelp(number,indexPath.row)[1]
        
        if (indexPath.row == 0) {
            goButton.setTitle(helpy.tableHelp(number,indexPath.row)[0], for: .normal)
        }
        return cell
    }
}

