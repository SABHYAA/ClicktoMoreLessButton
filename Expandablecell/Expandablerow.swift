//
//  Expandablerow.swift
//  Expandablecell
//
//  Created by appinventiv on 28/08/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class Expandablerow: UIViewController {

    @IBOutlet var tableview: UITableView!
   var selectmoreButton = false
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    self.tableview.estimatedRowHeight = UITableViewAutomaticDimension
    self.tableview.rowHeight = 44.0
    self.tableview.dataSource = self
    self.tableview.delegate = self
    
    }
   
    @IBAction func moreBtn(_ sender: UIButton) {
     self.selectmoreButton = !self.selectmoreButton
        tableview.reloadData()
    
    }
    
    
}
extension Expandablerow : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if self.selectmoreButton == false{
//            return 2
//        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"customcell", for: indexPath) as? Customcell
            else{
                fatalError()
        }
        if selectmoreButton == true{
            cell.helloLabel.numberOfLines = 0
        }else{
            cell.helloLabel.numberOfLines = 1
        }
        
        
        return cell
       
        
    }
                
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return 100
//
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if self.selectmoreButton{
            return UITableViewAutomaticDimension
        }else{
            return 82
        }
        
    }
    }
class Customcell: UITableViewCell {
    @IBOutlet var moreBtn: UIButton!
    @IBOutlet var helloLabel: UILabel!
}
