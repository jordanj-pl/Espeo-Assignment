//
//  DocumentDetailsModel.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 24/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

struct DocumentDetailsEntity: Decodable {

    var id: Int
	var title: String
	var category: String
	var author: String
	var headerImg: String
	var thumbnailImg: String
	var created: String
	var text: String

}
