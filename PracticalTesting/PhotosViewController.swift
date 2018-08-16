//
//  ViewController.swift
//  PracticalTesting
//
//  Created by Seyfeddin Bassarac on 25/01/2018.
//  Copyright © 2018 ThreadCo. All rights reserved.
//

import UIKit
import ObjectMapper
import SwiftyJSON
import Kingfisher

class PhotosViewController: UIViewController {

    var photos: [Photo] = []

    @IBOutlet weak var tableView: UITableView!

    private var settingsBarItem: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        settingsBarItem = UIBarButtonItem(image: #imageLiteral(resourceName: "settingsIcon"), style: .plain, target: self, action: #selector(settingsTapped(sender:)))
        settingsBarItem.tintColor = UIColor.darkGray

        navigationItem.rightBarButtonItem = settingsBarItem

        settingsBarItem.isEnabled = false

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 308

        self.title = "Interesting Photos"

        FlickrNetwork.request(target: .interestingPhotos, success: { JSON in
            self.photos = Mapper<Photo>().mapArray(JSONArray: JSON["photos"]["photo"].arrayObject! as! [[String : Any]])
            self.tableView.reloadData()

            self.settingsBarItem.isEnabled = true

        }, error: { errorString, statusCode in

        }) { error in
            
        }

    }

    @objc fileprivate func settingsTapped(sender: UIBarButtonItem) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension PhotosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTableViewCell", for: indexPath) as! PhotoTableViewCell

        let photo = photos[indexPath.row]

        cell.nameLabel.text = photo.title
        cell.ownerNameLabel.text = photo.owner

        cell.photoImageView.kf.setImage(with: photo.url)

        if photo.license == "4" {
            cell.licenseImageView.isHidden = false
        } else {
            cell.licenseImageView.isHidden = true
        }

        return cell
    }
}

