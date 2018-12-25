//
//  PostsViewController.swift
//  DemoProjectFromANODA
//
//  Created by admin on 12/21/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SnapKit

class PostsViewController: UIViewController {
    
    enum PostCellType: String, CaseIterable {
        case header = "PostHeaderCell"
        case images = "PostImageCell"
        case actions = "PostActionsCell"
        case description = "PostDescriptionCell"
    }
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        return tableView
    }()
    var router: FlowRouter!
    var viewModel: ViewModelType!
    
    func configure(router: FlowRouter, viewModel: ViewModelType) {
        self.router = router
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image: UIImage = UIImage(named: "Instagram")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        for cellType in PostCellType.allCases {
            switch cellType {
            case .header:
                tableView.register(PostHeaderCell.self, forCellReuseIdentifier: cellType.rawValue)
            case .images:
                tableView.register(PostImageCell.self, forCellReuseIdentifier: cellType.rawValue)
            case .actions:
                tableView.register(PostActionsCell.self, forCellReuseIdentifier: cellType.rawValue)
            case .description:
                tableView.register(PostDescriptionCell.self, forCellReuseIdentifier: cellType.rawValue)
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PostsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return  viewModel.getCountPosts()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostCellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let postCellType = PostCellType.allCases[indexPath.row]
        guard let post = viewModel.getPost(at: indexPath.section) else { return UITableViewCell() }
        switch postCellType {
        case .header:
            let cell = tableView.dequeueReusableCell(withIdentifier: postCellType.rawValue, for: indexPath) as! PostHeaderCell
             cell.config(userPhotoProfile:post.authorImageURL,name: post.authorName, location: post.address )
             cell.selectionStyle = .none
            return cell
        case .images:
            let cell = tableView.dequeueReusableCell(withIdentifier: postCellType.rawValue, for: indexPath) as! PostImageCell
            cell.config(with: post.imagesURL, delegate: self)
            cell.selectionStyle = .none
           return cell
        case .actions:
            let cell = tableView.dequeueReusableCell(withIdentifier: postCellType.rawValue, for: indexPath) as! PostActionsCell
             cell.selectionStyle = .none
            cell.config(countOfImages: post.imagesURL.count)
            return cell
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: postCellType.rawValue, for: indexPath) as! PostDescriptionCell
             cell.selectionStyle = .none
            if  let description = post.message {
                cell.config(likedText: post.likedBy, descriptionText: description,date: post.date)
            }
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let postCellType = PostCellType.allCases[indexPath.row]
        switch postCellType {
        case .header:
            return 44.0
        case .images:
            return tableView.frame.width
        case .actions:
            return 44.0
        case .description:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
}

extension PostsViewController: PostImageCellDelegate {
    func postImageCell(_ cell: PostImageCell, didSelect imageIndex: Int) {
        if let indexPath = tableView.indexPath(for: cell) {
            if let index = PostCellType.allCases.index(of: .actions) {
                if let actionCell = tableView.cellForRow(at: IndexPath(row: index, section: indexPath.section)) as? PostActionsCell {
                    actionCell.updateCurrentPage(imageIndex)
                }
            }
        }
    }
}
