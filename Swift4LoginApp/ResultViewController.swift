//
//  ResultViewController.swift
//  Swift4LoginApp
//
//  Created by tatsumi kentaro on 2018/02/20.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import Firebase
class ResultViewController: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            
            dismiss(animated: true, completion: nil)
            
        }catch let error as NSError {
            print("\(error.localizedDescription)")
        }
        
    }
    
    

    

}
