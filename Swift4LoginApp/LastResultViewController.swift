//
//  LastResultViewController.swift
//  Swift4LoginApp
//
//  Created by tatsumi kentaro on 2018/02/22.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import UIKit
import Firebase
class LastResultViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    var uid: String!
    let db = Firestore.firestore()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        uid = Auth.auth().currentUser?.uid

        db.collection("users").document(uid).getDocument { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let data = querySnapshot?.data()
                self.nameLabel.text = data!["name"] as? String
                self.gradeLabel.text = data!["grade"] as? String
                self.courseLabel.text = data!["course"] as? String
                self.emailLabel.text = data!["email"] as? String
                self.idLabel.text = data!["id"] as? String
                
                print(data!["name"] as! String)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            
            dismiss(animated: true, completion: nil)
            
        }catch let error as NSError {
            print("\(error.localizedDescription)")
        }
    }
    

}
