//
//  ThirdViewController.swift
//  fienlute-pset2
//
//  Created by Fien Lute on 08-11-16.
//  Copyright © 2016 Fien Lute. All rights reserved.
//

import UIKit

// get user input from second vc 
class ThirdViewController: UIViewController {
    var story: Story!
    
    @IBOutlet weak var buttonHome: UIButton!
    
    @IBAction func clearStory(_ sender: Any) {
        if buttonHome.isSelected == true {
            story.clear()
        }
        
    }
    var storyData: String?
    
    @IBOutlet weak var textFieldStory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldStory.text = storyData
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
