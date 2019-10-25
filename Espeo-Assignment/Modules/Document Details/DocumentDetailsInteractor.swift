//
//  DocumentDetailsInteractor.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 24/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

class DocumentDetailsInteractor : DocumentDetailsProvider {

	public unowned var output: DocumentDetailsOutput!

	let apiClient: APIClient

	init(apiClient: APIClient) {
		self.apiClient = apiClient
	}

	func retrieveDocumentDetails(id: Int) {
		apiClient.retrieveDocument(id: id, success: { [unowned self] (model: DocumentDetailsEntity) in

			guard let photoUrl = URL(string: model.headerImg) else {
				self.output.receiveError()
				return
			}

			let df = DateFormatter()
			df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSS"

			guard let date = df.date(from: model.created) else {
				self.output.receiveError()
				return
			}

			guard let description = model.text.data(using: .utf8) else {
				self.output.receiveError()
				return
			}

			let documentDetails = DocumentDetails(id: model.id, title: model.title, author: model.author, category: model.category, creationDate: date, photoUrl: photoUrl, description: description)

			self.output.receiveDocumentDetails(documentDetails)
		}) { [unowned self] (error: Error) in
			//TODO add error as parameter
			self.output.receiveError()
		}
	}

	

}
