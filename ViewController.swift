//
//  ViewController.swift
//  Deneme23
//
//  Created by Eren lifetime on 6.11.2023.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var tableView:UITableView!
    var showed = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Titles"
        tableView.delegate = self
        tableView.dataSource = self
        updateTitles()
    }
        func updateTitles(){
            showed.removeAll()
            guard let count = UserDefaults.value(forKey: "Title") as? Int else{
                return
            }
            for x in 0..<count{
    if let task = UserDefaults.value(forKey: "titles_\(x+1)") as? String{
        showed.append(task)
    }
            }
        }

      @IBAction func barButtonPressed(){
          let vc = storyboard?.instantiateViewController(identifier: "show")
          vc?.title = "Our Title"
          vc.update{
              DispatchQueue.main.async {
                  self.updateTitles()
              }
          }
                    
          navigationController?.pushViewController(vc!, animated: true)
      }
    }
    extension ViewController:UITableViewDelegate{
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
    let vc = storyboard?.instantiateViewController(identifier: "show") as! ShowViewController
            vc.title = "Our Title" 
            vc.show = showed[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    extension ViewController:UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return showed.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = showed[indexPath.row]
            return cell
        }
        
    }
