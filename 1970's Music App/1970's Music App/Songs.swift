//
//  Songs.swift
//  1970's Music App
//
//  Created by Hasani Mason on 11/2/17.
//  Copyright © 2017 Hasani Mason. All rights reserved.
//

import Foundation

public class Song{
    
    public var Position: String?
    public var Title: String?
    public var Artist: String?
    
    
    init(title: String, artist: String, position: String){
        
        Title = title
        Artist = artist
        Position = position
    }
    
    
    init(){
        
        
        Title = nil
        Position = nil
        Artist = nil
    }
    
    
}
