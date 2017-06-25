//
//  HomeTab.swift
//  TwoLine
//
//  Created by 麻生昌志 on 2017/05/29.
//  Copyright © 2017年 麻生昌志. All rights reserved.
//

import UIKit

struct Pages {
    var homeViewControllers:[UIViewController] = []
}

class PageCollectionViewController: UICollectionViewController {
    
    var pages:Pages = Pages(){
        didSet { self.collectionView?.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PageCollectionViewCell")
        
        let page1 = UIViewController()
        self.pages.homeViewControllers.append(page1)
        
        let page2 = UIViewController()
        page2.view.backgroundColor = UIColor.blue
        self.pages.homeViewControllers.append(page2)
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pages.homeViewControllers.count
    }
    
    override var collectionView = UICollectionViewCell(collectionView: UICollectionView, _: cellForItemAtIndexPath, indexPath: NSIndexPath) {
        var cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "PageCollectionViewCell", forIndexPath: IndexPath) as UICollectionViewCell
        let view = self.pages.homeViewControllers[indexPath.row].view
        cell.contentView.addSubview(view)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let pageViewRect = self.view.bounds
        return CGSize(width: pageViewRect.width, height: pageViewRect.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
}
