//
//  ContentView.swift
//  BookChallenge
//
//  Created by Otoole on 03/03/2022.
//

import SwiftUI

struct BookListView: View {
    @EnvironmentObject var model:BookModel
    
    var body: some View {
        NavigationView{
                ScrollView{
                    LazyVStack(spacing: 20){
                        
                        ForEach(0..<model.books.count){
                            index in
                            
                            NavigationLink {
                                BookDetailView(book: model.books[index])
                            } label: {
                                Bookview(book: model.books[index])
                            }

                        }
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }.navigationTitle("My Library")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .previewDevice("iPhone 13 Pro")
            .environmentObject(BookModel())
    }
}
