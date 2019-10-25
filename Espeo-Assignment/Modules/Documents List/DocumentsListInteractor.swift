//
//  DocumentsListInteractor.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 23/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

class DocumentsListInteractor : DocumentsListProvider {

	public unowned var output: DocumentsListOutput!

	let apiClient: APIClient

	init(apiClient: APIClient) {
		self.apiClient = apiClient
	}

	func retrieveListOfDocuments() {

		apiClient.retrieveDocumentsList(success: { [unowned self] (model: DocumentsListEntity) in
			print(model)

			var list: [String : [DocumentsListItem]] = [:]
			var titles: [String] = []

			for listItem in model.documents {
				print(listItem)

				let item = DocumentsListItem(listItem.id, listItem.title, URL(string: listItem.thumbnailImg)!)

				if list[listItem.category] == nil {
					list[listItem.category] = []
					titles.append(listItem.category)
				}

				list[listItem.category]?.append(item)
			}

			let documentsList = DocumentsList(categories: list, sectionTitles: titles)
			self.output.receivedDocumentsList(items: documentsList)
		}) { [unowned self] (error: Error) in
			//TODO add error msg/struct
			self.output.receiveError()
		}
	}


}
