//
//  PostImageCell.swift
//  DemoProjectFromANODA
//
//  Created by admin on 12/24/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

protocol PostImageCellDelegate: class {
    func postImageCell(_ cell: PostImageCell, didSelect imageIndex: Int)
}

class PostImageCell: UITableViewCell {
    
    weak var delegate: PostImageCellDelegate?
    var imagesURL:[String] = []
    
    var imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imageCollectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "imageCell")
        imageCollectionView.backgroundColor = .white 
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        contentView.addSubview(imageCollectionView)
        imageCollectionView.snp.makeConstraints { (make) -> Void in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func config(with imagesURL:[String], delegate: PostImageCellDelegate) {
        self.imagesURL = imagesURL
        self.imageCollectionView.reloadData()
        self.delegate = delegate
    }
    
}

extension PostImageCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as? ImageCollectionViewCell else {fatalError()}
        let strImageURL = self.imagesURL[indexPath.row]
          cell.imageView.sd_setImage(with: URL(string: strImageURL), completed: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.frame.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        delegate?.postImageCell(self, didSelect: Int(offSet + horizontalCenter) / Int(width))
    }
}
