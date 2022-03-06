//
//  BookModel.swift
//  BookChallenge
//
//  Created by Otoole on 03/03/2022.
//

import Foundation

class BookModel:ObservableObject
{
    @Published var books = [Book]()
    
    init()
    {
        self.books = DataService.getLocalData()
    }
    
    static func getstringForImage(item:Int) ->String{
        if item == 0{
            return ""
        }
        return String(item)
    }
    
    /**
     This function changes the isfavorite property of  a selected book
     */
    func setBookAsFavorite(book:Book)
    {
        if let index = self.books.firstIndex(where: {$0.id == book.id}){
            self.books[index].isFavourite = !self.books[index].isFavourite
        }
    }
    
    func setRatingOfBook(book:Book, newRating:Int){
        if let index = self.books.firstIndex(where: {$0.id == book.id}){
            self.books[index].rating = newRating
        }
    }
    
    func updateCurrentPage(book:Book, newPage:Int){
        if let index = self.books.firstIndex(where: {$0.id == book.id}){
            self.books[index].currentPage = newPage
        }
    }
}
