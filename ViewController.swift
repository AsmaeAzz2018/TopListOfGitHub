//
//  ViewController.swift
//  TopListOfGitHub
//
//  Created by mac on 5/10/18.
//  Copyright © 2018 LyndeDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource ,  UITableViewDelegate {

   
    
 var fetchingMore = false
   let url = URL(string: "http://api.github.com/search/repositories?q=created:%3E2017-10-22&sort=stars&order=desc")
  
  private  var repos = [Reposotory]()
   
 @IBOutlet var Tableview: UITableView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        downloadJson ()
        
        
    }
            
 
    func downloadJson(){
   
        guard let downloadURL = url else { return }
        URLSession.shared.dataTask(with: downloadURL){ data, urlResponse, error in
                
            guard let data = data, error == nil, urlResponse != nil else {
                print("something is wrong")
                return
            }
            
             print("downloaded")
            do
            {
                let decoder = JSONDecoder()
        
                
       let downloadedRepo = try decoder.decode(items.self , from: data)
                
              self.repos = downloadedRepo.items
               
               DispatchQueue.main.async {
                self.Tableview.reloadData()
                }
            } catch {
                print("wrong after downloading")
            }
        }.resume()
     }
     
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return repos.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "idRepo") as? idRepo else { return UITableViewCell() }
            
            cell.namelbl.text = "Reposotory: " + repos[indexPath.row].name
            cell.desclbl.text = "Description: " + repos[indexPath.row].description
            cell.lblowner.text = "Owner: " + repos[indexPath.row].owner.login
            
            
            cell.stars.text = "Stars :" + ("\(repos[indexPath.row].stargazers_count)")
            
            
            
            if let imageURL = URL(string : repos[indexPath.row].owner.avatar_url){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data : data)
                        DispatchQueue.main.async {
                            cell.avatar.image = image
                        }
                    }
                }
            }
    return cell
            
    }
    }
  


