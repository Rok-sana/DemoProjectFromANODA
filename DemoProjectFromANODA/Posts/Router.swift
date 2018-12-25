//
//  Router.swift
//  DemoProjectFromANODA
//
//  Created by admin on 12/24/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

import UIKit

protocol FlowRouter: class {
    func showPerform(segue: UIStoryboardSegue) -> Bool
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
    var dependencies: AppDependencies { get }
}

extension FlowRouter {
    func showPerform(segue: UIStoryboardSegue) -> Bool {
        return true
    }
}

protocol RouterType: FlowRouter {
    
}

class Router: RouterType {
    weak var controller: UIViewController?
    
    let dependencies: AppDependencies
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    deinit {
        print("\(self) deinit")
    }
    
    func start(with viewController: PostsViewController) {
        let viewModel = ViewModel(dependencies: dependencies)
        viewModel.router = self
        self.controller = viewController
        viewController.configure(router: self, viewModel: viewModel)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
