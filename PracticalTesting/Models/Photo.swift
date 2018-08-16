//
//  Photo.swift
//  PracticalTesting
//
//  Created by Seyfeddin Bassarac on 25/01/2018.
//  Copyright © 2018 ThreadCo. All rights reserved.
//

import Foundation
import ObjectMapper

class Photo: Mappable {

    var photoWidth: String?
    var photoHeight: String?
    var dateTaken: Date!
    var url: URL!
    var identifier: String!
    var title: String!
    var owner: String!
    var license: String!

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        identifier <- map["id"]
        title <- map["title"]
        photoWidth <- map["width_h"]
        photoHeight <- map["height_h"]
        dateTaken <- (map["datetaken"], CustomDateFormatTransform(formatString: "yyyy-MM-dd HH:mm:ss"))
        url <- (map["url_h"], URLTransform())
        owner <- map["ownername"]
        license <- map["license"]
    }
}
