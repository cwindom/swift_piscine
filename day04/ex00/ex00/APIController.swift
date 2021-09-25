//
//  APIController.swift
//  ex00
//
//  Created by OUT-Korogodova-MM on 25.09.2021.
//

import Foundation

class APIController {
    
    weak var delegate: APITwitterDelegate?
    let token: String
    
    var tweets = [Tweet]()
    
    init(delegate: APITwitterDelegate?, token: String) {
        
        self.delegate = delegate
        self.token = token
        
//        self.token = "AAAAAAAAAAAAAAAAAAAAAO3k9gAAAAAAYiCjT11ullplhI%2FwD7DfpQCK2B0%3De7YvgUGT6pCgqAFbq0qqyKvWxlIwgqsjGV6WVTBzrTJpzTYGTk"
    }
    
    func request(requestString: String) {
        
        let info = URL(string: "https://api.twitter.com/1.1/search/tweets.json?q=\(requestString)&count=100&lang=en&result_type=recent".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
        
        guard let info = info else {
            return
        }
        
        var url = URLRequest(url: info)
        url.httpMethod = "GET"
        url.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
                   if let error = error {
                    self.delegate?.manageError(error as NSError)
                       return
                   }
                   guard let data = data else {
                       return
                   }
            
            do {
                let dataArray = try JSONDecoder().decode(JSONInfo.self, from: data)
                self.tweets = dataArray.statuses?.compactMap { post in
                    guard let name = post.user?.screen_name,
                          let text = post.text else { return nil }
                    
                    return Tweet(name: name, text: text)
                } ?? []
                
                self.delegate?.manageTweets(self.tweets)
                
            } catch let error {
                
                self.delegate?.manageError(error as NSError)
            }
        }.resume()
    }
}

