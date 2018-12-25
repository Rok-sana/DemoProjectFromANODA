//
//  PostDescriptionCell.swift
//  DemoProjectFromANODA
//
//  Created by admin on 12/24/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class PostDescriptionCell: UITableViewCell {
    
    var likedByattributesLabel: UILabel = {
        let attributesLabel = UILabel()
        attributesLabel.numberOfLines = 0
        attributesLabel.translatesAutoresizingMaskIntoConstraints = false
        return attributesLabel
    }()
    
    //===============================================================================
    
    var descriptionAttributesLabel: UILabel = {
        let attributesLabel = UILabel()
        attributesLabel.numberOfLines = 0
        attributesLabel.translatesAutoresizingMaskIntoConstraints = false
        return attributesLabel
    }()
    
    //===============================================================================
    var diffTimeLabel: UILabel = {
        let diffTimeLabel = UILabel()
        diffTimeLabel.numberOfLines = 1
        diffTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        diffTimeLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        diffTimeLabel.textColor = .lightGray
        return diffTimeLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func  setupUI(){
        contentView.addSubview(likedByattributesLabel)
        likedByattributesLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(5)
        }
        contentView.addSubview(descriptionAttributesLabel)
        descriptionAttributesLabel.snp.makeConstraints { (make) in
            make.top.equalTo(likedByattributesLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(5)
        }
        contentView.addSubview(diffTimeLabel)
        diffTimeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionAttributesLabel.snp.bottom).offset(3)
            make.leading.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().inset(3)
        }
        
    }
    
    func calculate(userLikedBy: [String]) -> String {
        var result = ""
        if userLikedBy.count > 3 {
            let firstThreeUser = "\(userLikedBy[0]), \(userLikedBy[1]), \(userLikedBy[2])"
            result = "\(firstThreeUser)  and  \(userLikedBy.count - 3) others"
        }
        return result
    }
    
    func config(likedText: [String], descriptionText:String,date: Int) {
        
        let liked = calculate(userLikedBy: likedText)
        
        let likeByAtt = NSAttributedString(string: "Liked by  ", attributes: [ .foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 13.0, weight: .regular)])
        
        let userAtt = NSAttributedString(string: liked, attributes: [ .foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 13.0, weight: .bold)])
        
        let  attributtedString = statusString(likeAttributes: likeByAtt, userAttributes: userAtt)
        likedByattributesLabel.attributedText = attributtedString
        descriptionAttributesLabel.font = UIFont.systemFont(ofSize: 13.0, weight: .regular)
        descriptionAttributesLabel.text = descriptionText
        let timeInterval = Double(date)
        let convertDate = Date(timeIntervalSince1970: timeInterval)
        if let timeStr = String.getDiffTime(olderDate: (convertDate), newerDate: Date()) {
            diffTimeLabel.text = timeStr
        }
    }
    
    func statusString(likeAttributes: NSAttributedString, userAttributes: NSAttributedString) -> NSMutableAttributedString {
        
        let attStr = NSMutableAttributedString(attributedString: likeAttributes)
        attStr.append(userAttributes)
        return attStr
    }
}
