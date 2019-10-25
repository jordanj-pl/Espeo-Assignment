//
//  DocumentsListOutput.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 23/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

struct DocumentsListItem {
	public let id: Int
	public let title: String
	public let photo: URL

	public init(_ id: Int, _ title: String, _ photo: URL) {
		self.id = id
		self.title = title
		self.photo = photo
	}
}

struct DocumentsList {
	let categories: Dictionary<String, Array<DocumentsListItem>>
	let sectionTitles: Array<String>

}

protocol DocumentsListOutput : class {

	func receivedDocumentsList(items: DocumentsList)
	func receiveError()//TODO

}
