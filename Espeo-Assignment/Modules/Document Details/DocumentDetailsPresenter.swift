//
//  DocumentDetailsPresenter.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 24/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

class DocumentDetailsPresenter : DocumentDetailsEventHandler, DocumentDetailsOutput {

	let documentId: Int

	public unowned var view: DocumentDetailsView!
	public var provider: DocumentDetailsProvider!
	public unowned var router: MainRouter!

	init(documentId: Int) {
		self.documentId = documentId
	}

//MARK: Event Handler
	func viewLoaded() {
		provider.retrieveDocumentDetails(id: documentId)
	}

	func photoLoaded() {
		DispatchQueue.main.async {
			self.view.setPhotoLoadingIndicator(active: false)
		}
	}

	func didDismissError() {
		router.goBack()
	}

//MARK: Output
	func receiveDocumentDetails(_ details: DocumentDetails) {

		let df = DateFormatter()
		df.dateStyle = .full

		var formattedDescription: NSAttributedString!

		do {
			formattedDescription = try NSAttributedString(data: details.description, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
		} catch {
			DispatchQueue.main.async {
				self.view.showErrorMsg(title: NSLocalizedString("Error", comment: "Error"), msg: NSLocalizedString("Cannot load document details.", comment: "Cannot load document details."), dismissBtn: NSLocalizedString("OK", comment: "OK"))

			}
			return
		}

		DispatchQueue.main.async {
			self.view.setTitle(details.title)
			self.view.setAuthor(details.author)
			self.view.setCategory(details.category)
			self.view.setDescription(formattedDescription)
			self.view.setImage(details.photoUrl)
			self.view.setCreationDate(df.string(from: details.creationDate))
			self.view.setPhotoLoadingIndicator(active: true)
		}
	}

	func receiveError() {
		DispatchQueue.main.async {
			self.view.showErrorMsg(title: NSLocalizedString("Error", comment: "Error"), msg: NSLocalizedString("Cannot load document details.", comment: "Cannot load document details."), dismissBtn: NSLocalizedString("OK", comment: "OK"))
		}
	}

}
