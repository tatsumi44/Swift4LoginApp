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
    var db: Firestore!
    var uid: String!
    var email: String!
    var name: String!
    var course: String!
    var grade: String!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var gradeTextField: UITextField!
    
    @IBOutlet weak var courseTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        uid = user?.uid
        email = user?.email
        db = Firestore.firestore()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    @IBAction func registerButton(_ sender: Any) {
        
        name = nameTextField.text
        grade = gradeTextField.text
        course = courseTextField.text
        db.collection("users").document(uid).setData([
            "name": name,
            "grade": grade,
            "course": course,
            "email":email,
            "id": uid]){ err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
        }
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
