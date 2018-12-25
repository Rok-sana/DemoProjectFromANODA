//
//  WebParserManager.swift
//  DemoProjectFromANODA
//
//  Created by admin on 12/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

protocol AppDependenciesType {
    
}

struct AppDependencies: AppDependenciesType {
    var webParserManager: WebParserType
}

protocol WebParserType: class {
   func parseJson(fileName: String) -> [Post]?
}

public class WebParser: WebParserType {
    
    func parseJson(fileName: String) -> [Post]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode( [Post].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
   
}
