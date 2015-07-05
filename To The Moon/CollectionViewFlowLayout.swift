//
//  CollectionViewFlowLayout.swift
//  To The Moon
//
//  Created by Jes Buusmann on 05/07/15.
//  Copyright © 2015 Christoffer Buusmann. All rights reserved.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {

    override func prepareLayout() {
        itemSize = CGSizeMake(collectionView!.frame.width, collectionView!.frame.height)
    }
}
