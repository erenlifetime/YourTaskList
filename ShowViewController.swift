//
//  ShowViewController.swift
//  Deneme23
//
//  Created by Eren lifetime on 6.11.2023.
//

import UIKit

class ShowViewController: UIViewController {
    @IBOutlet var label:UILabel!
    var show:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = show
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteShow))
        
    }
    @objc func deleteShow(){
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
