//
//  AddPageView.swift
//  Addresses
//
//  Created by Mayank Yadav on 23/08/22.
//

import UIKit

class AddPageView: UIView {
    
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var Theight: NSLayoutConstraint!
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        contentView.layer.cornerRadius = 10
        btnAdd.layer.borderWidth = 1
        btnAdd.layer.borderColor = UIColor.green.cgColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    func initView(){
        Bundle.main.loadNibNamed("AddPageView", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
    }
}
