//
//  BookDetailView.swift
//  BookChallenge
//
//  Created by Otoole on 04/03/2022.
//

import SwiftUI

struct BookDetailView: View {
    
    var book:Book
    @State var selectedRating:Int = 1
    @EnvironmentObject var bookModel:BookModel
    
    var ratings = [1,2,3,4,5]
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20.0)
            {
                NavigationLink(destination: BooKContentView(book: book)){
                    
                    VStack{
                        Text("Read Now!")
                            .foregroundColor(.black)
                            .padding(.vertical)
                        
                        Image("cover" + BookModel.getstringForImage(item: book.id))
                            .resizable()
                            .padding(.horizontal)
                            .scaledToFit()
                    }
                    .padding(.horizontal)
                }


                Text("Mark for later!")
                
                
                Button {
                    bookModel.setBookAsFavorite(book: book)
                } label: {
                    
                    if book.isFavourite
                    {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    else
                    {
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                }
                
                Text("Rate Amazing Words")
                
                Picker(selection: $selectedRating) {
                    ForEach(0..<ratings.count,id: \.self){
                        index in
                        Text("\(ratings[index])").tag(index + 1)
                    }
                } label: {
                    Text("rate")
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: selectedRating, perform: {
                    newValue in
                    bookModel.setRatingOfBook(book: book, newRating: newValue)
                })
                
                
               
                
            }.navigationBarTitle(book.title)
                .onAppear {
                    //
                    setInitialRating()
            }
        }
    }
    
    func setInitialRating(){
        selectedRating = book.rating
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let bookmodel = BookModel()
        BookDetailView(book: bookmodel.books[0])
            .previewDevice("iPhone 13 Pro")
    }
}
