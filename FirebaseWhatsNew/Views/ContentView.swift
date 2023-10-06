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
    @State private var whatsNewIndex = 0
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                TabView(selection: $whatsNewIndex) {
                    ForEach(model.articles) { article in
                        VStack {
                            if article.whatsNewImageURL != nil {
                                if let url = URL(string: article.whatsNewLink ?? "") ?? URL(string: "https://") {
                                    Link(destination: url, label: {
                                        WebImage(url: URL(string: article.whatsNewImageURL ?? ""))
                                            .resizable()
                                            .placeholder {
                                                Rectangle()
                                                    .frame(width: geo.size.width*0.9, height: 100)
                                                    .cornerRadius(10)
                                                    .opacity(0.1)
                                            }
                                            .cornerRadius(10)
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 100)
                                    })
                                }
//                                Link(destination: URL(string: article.whatsNewLink ?? "")!, label: {
//                                })
                            }
                            VStack(spacing: geo.size.width*0.03) {
                                Text(article.whatsNewTitle ?? "")
                                    .bold()
                                Text(article.whatsNewText)
                            }
                            .padding(.top, 10)
//                            .frame(maxHeight: .infinity, alignment: .top)
                            .font(Font.custom("Avenir Roman", size: geo.size.width*0.043))
                        }
                        .padding()
                    }
                }
                .background(Color("bgColor4").opacity(0.4))
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                CustomPagingIndicator(currentIndex: whatsNewIndex, total: model.articles.count)
                    .position(x: screenWidth / 2, y: screenHeight * 0.45)
            }
        }
        .frame(width: screenWidth, height: screenHeight*0.4)
    }
}

#Preview {
    ContentView(model: WhatsNewModel())
}
