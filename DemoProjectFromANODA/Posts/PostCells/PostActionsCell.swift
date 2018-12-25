//
//  PostActionsCell.swift
//  DemoProjectFromANODA
//
//  Created by admin on 12/24/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class PostActionsCell: UITableViewCell {
    
    var leftSetButtonsStackView: UIStackView  = {
        let leftSetButtonsStackView = UIStackView()
        leftSetButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
        leftSetButtonsStackView.axis = .horizontal
        leftSetButtonsStackView.spacing = 1.0
        leftSetButtonsStackView.distribution = .fillProportionally
        leftSetButtonsStackView.contentMode = .scaleAspectFill
        return leftSetButtonsStackView
    }()
    
    //================================================================================
    
    var heartButton: UIButton = {
        let heartButton = UIButton()
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        return heartButton
    }()
    
    //================================================================================
    
    var commentButton: UIButton = {
        let  commentButton = UIButton()
        commentButton.translatesAutoresizingMaskIntoConstraints = false
      
        return  commentButton
    }()
    //===============================================================================
    var shareButton: UIButton = {
        let  shareButton = UIButton()
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        return  shareButton
    }()
    
    //===============================================================================
    
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.init(red: 14.0/255, green: 122.0/255, blue: 254.0/255, alpha: 1.0)
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPage = 0
        return pageControl
    }()
    
    //===============================================================================
    
    var markButton: UIButton = {
        let  markButton = UIButton()
        markButton.translatesAutoresizingMaskIntoConstraints = false
        return markButton
    }()
    
    //================================================================================
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  setupUI(){
        contentView.addSubview(leftSetButtonsStackView)
        leftSetButtonsStackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(120)
        }
        leftSetButtonsStackView.addArrangedSubview(heartButton)
        heartButton.setImage(UIImage(named: "like"), for: .normal)
        leftSetButtonsStackView.addArrangedSubview(commentButton)
        commentButton.setImage(UIImage(named: "user"), for: .normal)
        leftSetButtonsStackView.addArrangedSubview(shareButton)
        shareButton.setImage(UIImage(named: "foto"), for: .normal)
        contentView.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        contentView.addSubview(markButton)
        markButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(5)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
            
        }
        markButton.setImage(UIImage(named: "mark"), for: .normal)
        
        layoutIfNeeded()
    }
    
    func config(countOfImages: Int, selectedImageIndex: Int = 0) {
        pageControl.numberOfPages = countOfImages
    }

    func updateCurrentPage(_ index: Int) {
        pageControl.currentPage = index
    }
}
