//
//  ContentView.swift
//  FirebaseWhatsNew
//
//  Created by Gavin Kwon on 10/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: WhatsNewModel
    
    var body: some View {
        VStack {
            ForEach(model.articles) { article in
                Text(article.whatsNewText)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(WhatsNewModel())
}
