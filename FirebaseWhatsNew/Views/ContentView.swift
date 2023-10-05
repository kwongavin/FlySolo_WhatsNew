//
//  ContentView.swift
//  FirebaseWhatsNew
//
//  Created by Gavin Kwon on 10/4/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var model: WhatsNewModel
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                TabView {
                    ForEach(model.articles) { article in
                        VStack {
                            if article.whatsNewImageURL != nil {
                                WebImage(url: URL(string: article.whatsNewImageURL ?? ""))
                                    .resizable()
                                    .placeholder {
                                        Rectangle()
                                            .frame(width: geo.size.width*0.9, height: 100)
                                            .cornerRadius(10)
                                            .opacity(0.1)
                                            .padding(.top)
                                    }
                                    .cornerRadius(10)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 100)
                            }
                            VStack(spacing: geo.size.width*0.03) {
                                Text("Finally, Available on Apple App Store!")
                                    .bold()
                                Text("Thanks for installing FlySolo. Now, spread the word to your musician buds and drop us a stellar review! Your positive feedback will make us do the happy dance. 🕺💃") // article.whatsNewText
                            }
                            .padding(.top)
                            .frame(maxHeight: .infinity, alignment: .top)
                            .font(Font.custom("Avenir Roman", size: geo.size.width*0.043))
                        }
                        .padding()
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .background(Color.blue.opacity(0.1))
            }
        }
        .frame(width: screenWidth, height: screenHeight*0.4)
    }
}

#Preview {
    ContentView(model: WhatsNewModel())
}
