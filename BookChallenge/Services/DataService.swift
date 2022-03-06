//
//  DataService.swift
//  BookChallenge
//
//  Created by Otoole on 03/03/2022.
//

import Foundation
import UIKit

class DataService
{
    static func getLocalData() -> [Book]{
        
        //get url path to file
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        //Check if path is not nil otherwise...
        guard pathString != nil else{
            return [Book]()
        }
        
        //create url object
        let url = URL(fileURLWithPath: pathString!)
        
        do
        {
            //create data object
            let data = try Data(contentsOf: url)
            
            //decode the data with json decoder
            let decoder = JSONDecoder()
            
            do
            {
                let bookData = try decoder.decode([Book].self, from: data)
                
                //return recipes
                return bookData
            }
            catch
            {
                //error with parsing json
                print(error)
            }
        }
        catch
        {
            //error with getting data
                print(error)
        }
        return [Book]()
    }
}
