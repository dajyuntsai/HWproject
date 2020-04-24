//
//  SecondViewController.swift
//  HWproject
//
//  Created by Hueijyun  on 2020/4/24.
//  Copyright © 2020 Hueijyun . All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var box: [Box] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        getData(url: urlString)
        
    }
    
    @IBOutlet var secondCollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return box.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? imageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.idLabel.text = String(box[indexPath.row].id)
        cell.titleLabel.text = box[indexPath.row].title
        if indexPath.row % 2 == 0 {
            cell.colorImageView.backgroundColor = .red
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width - 1)/4
        print(width)
        let size = CGSize(width: width, height: width )
        return size
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    let urlString = "https://jsonplaceholder.typicode.com/photos"
    
    func getData(url : String){

        let session = URLSession(configuration: .default)

        let request = URLRequest(url: URL(string: url)!)

        let task = session.dataTask(with: request) {(data ,response, error) in
            
            let decoder = JSONDecoder()

            if let loadData = data {
                
                do{

//                    let json = try JSONSerialization.jsonObject(with: loadData, options: .allowFragments)

                    let responseData = try decoder.decode([Box].self , from: loadData)
                    //print(responseData)
                    self.box = responseData
                    
                    DispatchQueue.main.async {
                        self.secondCollectionView.reloadData()
                    }

                } catch {
                    print(error)
                }
            }

        }

        task.resume()


    }
    
     
    
    
    
}
