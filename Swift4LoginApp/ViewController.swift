//
//  ViewController.swift
//  Swift4LoginApp
//
//  Created by tatsumi kentaro on 2018/02/20.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle!

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if Auth.auth().currentUser != nil {
                self.login()
            } else {
                print("ログインしてね")
            }
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextFeild.text!) { (user, error) in
            print(self.emailTextField.text!)
            if let error = error {
                print("エラー")
                return
            }else{
                self.login()
            }
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "Register", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func login(){
        performSegue(withIdentifier: "Last", sender: nil)
    }
    


}

