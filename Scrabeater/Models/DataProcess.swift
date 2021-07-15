//
//  DataProcess.swift
//  Scrabeater
//
//  Created by Hamzah Gopaul on 26/09/2020.
//  Copyright © 2020 Hamzah Gopaul. All rights reserved.
//

import UIKit

class DataProcess {
    
    var newWords : [String] = [], definitions : [String] = [], y = 0
    
    func findDefinitions(undefinedWords words : [String]) -> [[String]] {
        for x in words {
            processJSON(x)
        }
        while y != words.count {}
        return [newWords, definitions]
    }

    private func processJSON(_ x : String) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://wordsapiv1.p.rapidapi.com/words/\(x.lowercased())/definitions")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["x-rapidapi-key": "11b581f795msh0a2d71dcb776eb1p1c0f6bjsn832ff832851c","x-rapidapi-host": "wordsapiv1.p.rapidapi.com"]

        let session = URLSession.shared
        session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            if let data = data, let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                DispatchQueue.main.async {
                    if !self.parseJSON(jsonData).isEmpty {
                        self.definitions.append(self.parseJSON(jsonData))
                        self.newWords.append(x)
                    }
                    self.y = self.y + 1
                    return
                }
            } else {
                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue)!)
                return
            }
            return
        }).resume()
    }
    
    private func parseJSON(_ definitionData: Any) -> String {
        let decoder = JSONDecoder()
        do {
            let jsonData = try? JSONSerialization.data(withJSONObject:definitionData)
            let decodedData = try decoder.decode(DataFramework.self, from: jsonData!)
            return !decodedData.definitions.isEmpty ? decodedData.definitions[0].definition : ""
        } catch {
            print("Error Encountered")
            return ""
        }
    }
}

struct DataFramework: Codable {
    let definitions: [Definitions]
}

struct Definitions : Codable {
    let definition : String
}

