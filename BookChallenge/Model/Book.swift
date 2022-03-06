//
//  Data.swift
//  BookChallenge
//
//  Created by Otoole on 03/03/2022.
//

import Foundation

struct Book:Identifiable, Decodable
{
    var title:String
    var id:Int
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var content:[String]
}
