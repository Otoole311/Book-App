//
//  BookChallengeApp.swift
//  BookChallenge
//
//  Created by Otoole on 03/03/2022.
//

import SwiftUI

@main
struct BookChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
                .environmentObject(BookModel())
                .preferredColorScheme(.light)
        }
    }
}
