//
//  DocumentDetailsView.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 24/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

protocol DocumentDetailsView : class {

	func setTitle(_ title: String)
	func setAuthor(_ author: String)
	func setCategory(_ category: String)
	func setCreationDate(_ date: String)
	func setImage(_ imageURL: URL)
	func setDescription(_ description: NSAttributedString)
	func setPhotoLoadingIndicator(active: Bool)
	func showErrorMsg(title: String, msg: String, dismissBtn: String)


}
