//
//  tabBarViewController.swift
//  Deneme23
//
//  Created by Eren lifetime on 6.11.2023.
//

import UIKit

class tabBarViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    // buradaya var update açtım ViewController'a geçtiğimde vc.update = self
    var update: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        field.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveAll))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveAll()
            return true
    }
    @objc func saveAll(){
        guard let text = field.text!, !text.isEmpty else{
            return
        }
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newCount = count + 1
        UserDefaults().set(newCount, forKey:"count")
        UserDefaults().set(text, forKey:"Saved\(newCount)")
        update?()
        navigationController?.popViewController(animated: true)
    }
    
    
}
