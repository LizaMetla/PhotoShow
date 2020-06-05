//
//  PhotosCollectionViewController.swift
//  PhotoShow
//
//  Created by Елизавета Метла on 6/5/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

 
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 15
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
    
        cell.backgroundColor = .black
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

}

//с протоколом - конфигурация таблицы через layout 
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //фиксирование значения на ряд изображений
        let itemsPerRow: CGFloat = 2
        //расстояние между изображениями, те в нашем случае 3 (2 картинки + расстояние между ними = 3)
        let paddingWidth = 20*(itemsPerRow + 1)
        
        //вычитаем ширину ненужных частей
        let availableWidth = collectionView.frame.width - paddingWidth
        
        //ширина конкретного объекта
        let widthPerItem = availableWidth / itemsPerRow
        
         return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //расстояние между границами экрана , отступ от секции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets (top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return 20
    }
}
