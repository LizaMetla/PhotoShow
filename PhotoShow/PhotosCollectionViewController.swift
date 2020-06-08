//
//  PhotosCollectionViewController.swift
//  PhotoShow
//
//  Created by Елизавета Метла on 6/5/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    
    let photos = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15",]
    //фиксирование значения на ряд изображений
    let itemsPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //1 способ задания положения ячеек (лучший)
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 70, height: 70)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
//        layout.scrollDirection = .vertical
//
//        //полоса ,чтобы убрать скролл (полоску) , чтобы видеть наше расположение
//        collectionView.showsVerticalScrollIndicator = false
    }

    //проверка на нажатие и переход по сигвею
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "photoPickSegue" {
            
            //проверка контроллера до которого добираюсь
            let showPhotoVC = segue.destination as! ShowPhotoViewController
            //убеждаемся , что можем добраться до выбранной ячейки
            let cell = sender as! PhotoCell
            //показ фотографии на новом контроллере
            showPhotoVC.image = cell.dogImageView.image
        }
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
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
    
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.dogImageView.image = image

        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

}


//2 способ через протокол, более моторный

//с протоколом - конфигурация таблицы через layout 
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        //расстояние между изображениями, те в нашем случае 3 (2 картинки + расстояние между ними = 3)
        //sectionInserts.left - константа которая хранит в себе значения, чтобы мы не изменяли всё
        
        let paddingWidth = sectionInserts.left * ( itemsPerRow + 1)

        //вычитаем ширину ненужных частей
        let availableWidth = collectionView.frame.width - paddingWidth

        //ширина конкретного объекта
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    //расстояние между границами экрана , отступ от секции
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         return sectionInserts.left
    }
}
