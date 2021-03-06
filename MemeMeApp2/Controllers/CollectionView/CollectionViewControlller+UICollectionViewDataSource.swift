//
//  CollectionViewControlller+UICollectionViewDataSource.swift
//  MemeMeApp2
//
//  Created by Joel Stevick on 4/26/22
//

import UIKit

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - protocol implementations
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
   
        return self.memes.getMemes().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionCell", for: indexPath) as? MemeCollectionViewCell
        let entry = self.memes.getMemes()[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell!.imageView.image = entry.meme.getImage()
      
        
        return cell!
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        
        print("selected")
        
        // de-select
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let entry = memes.getMemes()[indexPath.row]
        
        selectedMeme = entry.meme
        entryId = entry.id
        
        performSegue(withIdentifier: "MemeDetailVC", sender: self)
        
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
}
