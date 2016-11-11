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
        // make sure the first kind of placeholder is vieweble in the textfield
        dataInputField.placeholder = story.getNextPlaceholder()
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
    
    @IBOutlet weak var wordsLeft: UILabel!
    
    @IBOutlet weak var dataInputField: UITextField!
    
    @IBAction func inputButton(_ sender: Any) {
        print(dataInputField.text!)
        
        // if a placeholder is filled in, put in story and return remaining amount of placeholders
        if (story.isFilledIn() == false) {
            if dataInputField.text == "" {
                return
            }
            else {
                story.fillInPlaceholder(word: dataInputField.text!)
                dataInputField.text = ""
                dataInputField.placeholder = story.getNextPlaceholder()
                wordsLeft.text = String(story.getPlaceholderRemainingCount()) + "words left"
            }
        }
       
    print(story.toString())

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // segue to put data of second vc into third vc
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let thirdVC = segue.destination as? ThirdViewController {
            thirdVC.storyData = story.toString() }
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
