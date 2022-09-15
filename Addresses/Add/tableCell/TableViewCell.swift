//
//  TableViewCell.swift
//  Addresses
//
//  Created by Mayank Yadav on 23/08/22.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAdd: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var imgHome: UIImageView!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnDel: UIButton!
    @IBOutlet weak var btnShr: UIButton!
    
    var parentVC : AddVC!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func add(with arrData : MyData) {
        lblTitle.text = arrData.Title
        lblAdd.text = arrData.Add
        lblPhone.text = arrData.Phone
        
    }
    
    @IBAction func onClickedDel(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delete Address",
                                      message: "Are you sure you want to delete this address?",
                                      preferredStyle: .alert)
        let delete = UIAlertAction(title: "Yes", style: .default) { (action) in
            arrData.remove(at: self.tag)
            DispatchQueue.main.async {
                self.parentVC.mainView.tableView.reloadData()
            }
        }
        alert.addAction(delete)
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        parentVC.present(alert, animated: true)
    }
    @IBAction func onClickedEdit(_ sender: UIButton) {
        let model = arrData[sender.tag]
        let alert = UIAlertController(title: "Edit Address", message: model.Title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Edit", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        parentVC.present(alert, animated: true)
        
    }
}
