//
//  SecondViewController.swift
//  fienlute-pset2
//
//  Created by Fien Lute on 08-11-16.
//  Copyright © 2016 Fien Lute. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var story: Story!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadStory()
    }
    
    // load file of story
    func loadStory() {

        if let dir = Bundle.main.path(forResource: "madlib1_tarzan", ofType: "txt") {
            print(dir)
            do {
                let text = try String(contentsOf: URL(string: "file://\(dir)")!, encoding: String.Encoding.utf8)
                story = Story(stream: text)
            } catch {
                print(error)
            }
        }
    }
    
    // load placeholders into story
    
    // print the amount of placeholders that the user has to fill in
   @IBOutlet weak var wordsLeft: UILabel!
   // (print story.getPlaceholderRemainingCount() + 'words left')
    
    @IBOutlet weak var dataInputField: UITextField!
    
    
    @IBAction func inputButton(_ sender: Any) {
        print(dataInputField.text)
        
        // if a placeholder is filled in, put in story and return remaining amount of placeholders
        while (story.getPlaceholderRemainingCount() != 0) {
            if dataInputField.text == "" {
                return
            }
            else {
                story.fillInPlaceholder(word: dataInputField.text!)
                wordsLeft.text = String(story.getPlaceholderRemainingCount()) + "words left"
            }
        }
        
        
    }
    


    
    // print hoeveel placeholders left
    // vul ingevulde placeholders in in text
    // geef placeholder soort weer in balk
    // print text met placeholder
    // maak text weer leeg
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let ThirdViewController = segue.destination as! ThirdViewController
        
        ThirdViewController.data = dataInputField.text!.characters.split{ $0 == " " || $0 == ","}.map(String.init)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
