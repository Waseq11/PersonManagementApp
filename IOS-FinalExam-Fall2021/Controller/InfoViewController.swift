//
//  InfoViewController.swift
//  IOS-FinalExam-Fall2021
//
//  Created by Daniel Carvalho on 2021-12-06.
//

import UIKit

class InfoViewController: UIViewController {
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public var selectedCelebrity : Celebrity?
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var btnDelete: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedCelebrity == nil{
            btnDelete.isHidden = true
            self.title = "Adding"
            
        } else {
            txtName.text = selectedCelebrity?.artisticName
            txtEmail.text = selectedCelebrity?.email
            btnDelete.isHidden = false
            self.title = "Showing"
        }
        
    }
    
    
    @IBAction func btnDeleteTouchUp(_ sender: Any) {
        if selectedCelebrity!.delete(context: context){
            navigationController?.popViewController(animated: true)
        } else {
            Toast.ok(view: self, title: "ERROR", message: "Error!")
        }
    }
    
    @IBAction func btnSaveTouchUp(_ sender: Any) {
        
        guard let artisticName = txtName.text, let email = txtEmail.text else {
            
            Toast.show(view: self, title: "ERROR", message: "Invalid, try again!")
            return
        }
        
        if artisticName.isEmpty || email.isEmpty {
            
            Toast.show(view: self, title: "ERROR", message: "Name and Email can not be empty!")
            return
        }
        
        if selectedCelebrity == nil {
            let celebrity = Celebrity(context: context)
            celebrity.artisticName = txtName.text!
            celebrity.email = txtEmail.text!
            
            if celebrity.save(context: context) != nil {
                navigationController?.popViewController(animated: true)
            } else {
                Toast.ok(view: self, title: "Error", message: "Error!")
            }
            
        }else{
            self.selectedCelebrity?.artisticName = txtName.text!
            self.selectedCelebrity?.email = txtEmail.text!
            
            if self.selectedCelebrity?.save(context: context) != nil {
                navigationController?.popViewController(animated: true)
            }else{
                Toast.ok(view: self, title: "Error", message: "Unable to save due to error!")
            }
        }
        
    }
    
    


}
