//
//  BooKContentView.swift
//  BookChallenge
//
//  Created by Otoole on 05/03/2022.
//

import SwiftUI

struct BooKContentView: View {
    
    var book:Book
    @State var selectedPage = 1
    
    var body: some View {
       
        VStack{
            
            TabView(selection: $selectedPage){
                
                ForEach(0..<book.content.count, id: \.self){
                    
                    content in
                    
                    ScrollView{
                        Text(book.content[content]).tag(content + 1)
                    }
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            
            Text(String(selectedPage))
                .font(.body)
                .font(Font.custom("Times New Roman", size: 24))
                .multilineTextAlignment(.leading)
            
        }
        .padding(.horizontal)
        .navigationBarTitle(book.title)
        
    }
}

struct BooKContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let bookModel = BookModel()
        BooKContentView(book: bookModel.books[0])
            .previewDevice("iPhone 13 Pro")
    }
}
