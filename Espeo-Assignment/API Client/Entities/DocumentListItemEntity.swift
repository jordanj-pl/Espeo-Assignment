//
//  DocumentModel.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 23/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

struct DocumentListItemEntity : Decodable {

	var id: Int
	var title: String
	var category: String
	var thumbnailImg: String
}
