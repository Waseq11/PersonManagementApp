//
//  ListViewController.swift
//  IOS-FinalExam-Fall2021
//
//  Created by Daniel Carvalho on 2021-12-05.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var loggedUserName : String = ""
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedRow : Int = 0
    
    @IBOutlet weak var lblLoggedUserName : UILabel!

    @IBOutlet weak var tableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLoggedUserName.text = loggedUserName
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Celebrity.all(context: self.context).count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let celebrity = Celebrity.all(context: self.context)[indexPath.row]
        
        cell.textLabel!.text = celebrity.artisticName
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedRow = indexPath.row
        
        performSegue(withIdentifier: Segue.toInfoViewEditing, sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == Segue.toInfoViewEditing){
            let celebrity = Celebrity.all(context: self.context)[self.selectedRow]
            (segue.destination as! InfoViewController).selectedCelebrity = celebrity
        }
    }

    
    @IBAction func btnRefreshTouchUp(_ sender : Any?) {
        
        tableView.reloadData()
        
    }
    
    
}
