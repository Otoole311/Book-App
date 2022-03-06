//
//  CardView.swift
//  BookChallenge
//
//  Created by Otoole on 03/03/2022.
//

import SwiftUI

struct Bookview: View {
    
    var book:Book
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Rectangle().foregroundColor(.white)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
            
            
            VStack(alignment: .leading, spacing: 8.0)
            {
                
                HStack(){
                    Text(book.title)
                        .bold()
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
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
                .padding(.horizontal)
                
                Text(book.author)
                    .font(Font.custom("Avenir", size: 15))
                    .italic()
                    .padding(.leading)
                
                
                //MARK: Book cover
                Image("cover" + BookModel.getstringForImage(item: book.id))
                    .resizable()
                    .scaledToFill()
                
                    .clipped()
                    .aspectRatio(contentMode: .fit)
            }
            .padding(.all)
        }
        .accentColor(.black)
        
        
    }
    
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let bmodel = BookModel()
        Bookview(book: bmodel.books[0])
            .previewDevice("iPhone 13 Pro")
    }
}
