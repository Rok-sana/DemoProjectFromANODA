//
//  ViewModel.swift
//  DemoProjectFromANODA
//
//  Created by admin on 12/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

protocol ViewModelType: class {
    func getCountPosts() -> Int
    func getPost(at index: Int) -> Post?
}

class ViewModel: ViewModelType {
    var router: Router?
    private let dependencies: WebParserType
    private let posts:[Post]
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies.webParserManager
        posts =  self.dependencies.parseJson(fileName: "test") ?? []
    }
    
    func getCountPosts() -> Int{
       return posts.count
    }
    
    func getPost(at index: Int) -> Post? {
        return posts[index]
    }
}
