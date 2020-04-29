//
//  DetailViewController.swift
//  HWproject
//
//  Created by Hueijyun  on 2020/4/26.
//  Copyright © 2020 Hueijyun . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var box: [Box] = []
    var colorId = ""
    var colorTitle = ""
    var colorImage = ""
    var fetchImage = FetchImage()
    
    @IBOutlet var detailTableView: UITableView!
    
    @IBOutlet var colorImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.separatorStyle = .none
        
        fetchImage.loadImage(urlString: colorImage) { (image) in
            DispatchQueue.main.async {
                self.colorImageView.image = image
            }
            
        }
                // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
        if indexPath.row == 0 {
            cell.TitleLabel.text = "id："
            cell.ContentLabel.text = colorId
        } else if indexPath.row == 1 {
            cell.TitleLabel.text = "Title："
            cell.ContentLabel.text = colorTitle
        }
        
        return cell
    }
    

}
