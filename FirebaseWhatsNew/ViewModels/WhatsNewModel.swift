//
//  WhatsNewModel.swift
//  FirebaseWhatsNew
//
//  Created by Gavin Kwon on 10/4/23.
//

import Foundation

class WhatsNewModel: ObservableObject {
    
    @Published var articles = [WhatsNewArticle]()
    
    
    init() {
        getRemoteData()
    }
    
    func getRemoteData() {
        
        let urlString = "https://raw.githubusercontent.com/kwongavin/FlySolo_WhatsNew/main/FirebaseWhatsNew/whatsnewdata.json"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            // Couldn't create url
            return
        }
        
        // Create a URLRequest object
        let request = URLRequest(url: url!)
        
        // Get the session and kick off the task
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            // Check if there's an error
            guard error == nil else {
                return
            }
            
            do {
                
                // Create json decoder
                let decoder = JSONDecoder()
                
                // Decode
                let articles = try decoder.decode([WhatsNewArticle].self, from: data!)
                
                DispatchQueue.main.async {
                    self.articles += articles
                }
                
            } catch {
                // Couldn't parse json
                return
            }
            
        }
        
        dataTask.resume()
        
    }
    
}

