//
//  ThirdViewController.swift
//  fienlute-pset2
//
//  Created by Fien Lute on 08-11-16.
//  Copyright © 2016 Fien Lute. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var data: Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if (data != nil) {
            print(data)
        }
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
