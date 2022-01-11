//
//  ViewController.swift
//  IOS-FinalExam-Fall2021
//
//  Created by Daniel Carvalho on 2021-12-05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsername : UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == Segue.toListView{
            guard let Login = txtUsername.text else{
                Toast.show(view: self, title: "ERROR", message: "You have to enter Login name!")
                return false
            }
            guard let Password = txtPassword.text else{
                Toast.show(view: self, title: "ERROR", message: "You have to enter Password!")
                return false
            }
            
            if Password.isEmpty{
                Toast.show(view: self, title: "ERROR", message: "Password can't be empty!")
                return false
            }
            if Login.isEmpty{
                Toast.show(view: self, title: "ERROR", message: "Login name can't be empty!")
                return false
            }
            if Login.count<2 {
                Toast.show(view: self, title: "ERROR", message: "Invalid! Login name should have more than 2 characters!")
                return false
            }
            if Password == "1913864" {
                return true
            }
            else {
                Toast.show(view: self, title: "ERROR", message: "Unable to Login! Check Login name and Password")
                return false
            }
            
        }
  
        return true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toListView {
            (segue.destination as! ListViewController).loggedUserName = txtUsername.text!
        }
        
    }
}

