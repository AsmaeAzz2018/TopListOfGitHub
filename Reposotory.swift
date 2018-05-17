//
//  Reposotory.swift
//  TopListOfGitHub
//
//  Created by mac on 5/11/18.
//  Copyright © 2018 LyndeDev. All rights reserved.
//

import UIKit

class items : Codable {
    let items : [Reposotory]
    init( items : [Reposotory] ){
        self.items = items
      
    }}




class owners : Codable {
    let login : String
    let avatar_url : String
    init( login : String , avatar_url : String){
        self.login = login
        self.avatar_url = avatar_url
        
    }
}

class Reposotory : Codable {
    let name : String
    let description : String
    let owner : owners
    let stargazers_count : Int
    
    init(name : String, description : String , owner : owners , stargazers_count : Int ){
        self.name = name
        self.description = description
       self.owner = owner
        self.stargazers_count = stargazers_count
       
    
     
    }
}
