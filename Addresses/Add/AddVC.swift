//
//  AddVC.swift
//  Addresses
//
//  Created by Mayank Yadav on 23/08/22.
//

import Foundation
import UIKit

class AddVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    var mainView = AddPageView()
    
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.mainView.tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
        task()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey]
            {
                DispatchQueue.main.async {
                    let newsize  = newvalue as! CGSize
                    self.mainView.Theight.constant = newsize.height
                }
                
            }
        }
    }
    
    func task() {
        
        mainView.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainView.tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        
        cell?.add(with: arrData[indexPath.row])
        cell?.parentVC = self
        cell?.btnEdit.tag = indexPath.row
        cell?.btnDel.tag = indexPath.row
        return cell!
    }
    
}
