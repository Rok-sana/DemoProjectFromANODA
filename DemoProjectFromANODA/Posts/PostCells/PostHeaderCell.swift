//
//  PostHeaderCell.swift
//  DemoProjectFromANODA
//
//  Created by admin on 12/24/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SnapKit

class PostHeaderCell: UITableViewCell {
    
    var topStackView: UIStackView = {
        let topStackView = UIStackView()
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.axis = .horizontal
        topStackView.layoutMargins.left = 5.0
        topStackView.isLayoutMarginsRelativeArrangement = true
        topStackView.spacing = 5.0
        topStackView.alignment = .center
        topStackView.distribution = .fill
        return topStackView
    }()
    
    //===================================================================================
    
    var userPhotoProfile: UIImageView = {
        let userPhotoProfile = UIImageView()
        userPhotoProfile.contentMode = .scaleAspectFill
        userPhotoProfile.layer.borderColor = UIColor.lightGray.cgColor
        userPhotoProfile.layer.borderWidth = 1.5
        return userPhotoProfile
        
    }()
    //===================================================================================
    var insideStackView: UIStackView = {
        let insideStackView = UIStackView()
        insideStackView.translatesAutoresizingMaskIntoConstraints = false
        insideStackView.axis = .vertical
        insideStackView.spacing = -5.0
        insideStackView.alignment = .leading
        return insideStackView
    }()
    
    //===================================================================================
    var nameLabel: UILabel = {
        let addressLabel = UILabel()
        addressLabel .lineBreakMode = .byWordWrapping
        addressLabel .textAlignment = .left
        addressLabel .numberOfLines = 0
        addressLabel .translatesAutoresizingMaskIntoConstraints = false
        addressLabel .font = UIFont(name: "SFProText-Regular", size: 15)
        addressLabel.textColor = .lightGray
        return addressLabel
    }()
    
    //====================================================================================
    
    var locationButton: UIButton = {
        let locationButton = UIButton()
        locationButton.setTitleColor(.gray, for: .normal)
        return locationButton
    }()
    
    //====================================================================================
    
    var settingButton: UIButton = {
        let  settingButton = UIButton()
        settingButton.imageView?.contentMode = .center
        return settingButton
    }()
    
    //================================================================================
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(topStackView)
        topStackView.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        topStackView.addArrangedSubview(userPhotoProfile)
        userPhotoProfile.snp.makeConstraints { (make) in
            make.width.equalTo(30.0)
            make.height.equalTo(30.0)
        }
        
        topStackView.addArrangedSubview(insideStackView)
        insideStackView.addArrangedSubview(nameLabel)
        insideStackView.addArrangedSubview(locationButton)
        contentView.addSubview(settingButton)
        settingButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(5)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview()
        }
        layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        userPhotoProfile.layer.cornerRadius = userPhotoProfile.frame.height/2.0
        userPhotoProfile.layer.masksToBounds = true
        
    }
    
    func config(userPhotoProfile:String?,name: String, location: String ){
        guard let userPhoto = userPhotoProfile  else { return self.userPhotoProfile.backgroundColor = .blue}
        self.userPhotoProfile.sd_setImage(with: URL(string: userPhoto), completed: nil)
        self.nameLabel.text = name
        self.nameLabel.textColor = .black
        self.nameLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        let locAttrStr = NSAttributedString(string: location, attributes: [ .foregroundColor: UIColor.gray, .font: UIFont.systemFont(ofSize: 13, weight: .light)])
        self.locationButton.setAttributedTitle(locAttrStr, for: .normal)
        settingButton.setImage(UIImage(named: "setting"), for: .normal)
    }
}

