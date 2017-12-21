//
//  SearchResult.swift
//  1970's Music App
//
//  Created by Hasani Mason on 11/2/17.
//  Copyright © 2017 Hasani Mason. All rights reserved.
//

import Foundation

public class SearchResult{
    
    public var Title: String?
    public var Id: String?
    
    init(title: String, id: String){
        
        Title = title
        Id = id
    }
    
    init()
    {
        
        Title = nil
        Id = nil
    }
}
