//
//  DocumentsListPresenter.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 23/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

class DocumentsListPresenter : DocumentsListEventHandler, DocumentsListOutput {

	public unowned var view: DocumentsListView!
	public var provider: DocumentsListProvider!
	public unowned var router: MainRouter!

	private var items: DocumentsList?

//MARK: Event Handler
	func viewLoaded() {
		provider.retrieveListOfDocuments()
	}

	func itemClicked(row: Int, section: Int) {
		let t = items?.sectionTitles[section]
		guard let title = t else {
			return
		}

		if let item = items?.categories[title]?[row] {
			router.displayDocumentDetails(item.id)
		}
	}

	func askForNumberOfSections() -> Int {
		return items?.categories.count ?? 0
	}

	func askForTitleOfSection(_ section: Int) -> String {
		return items?.sectionTitles[section] ?? ""
	}

	func askForNumberOfRowsInSection(_ section: Int) -> Int {
		let t = items?.sectionTitles[section]
		guard let title = t else {
			return 0
		}

		return items?.categories[title]?.count ?? 0
	}

	func askForDataOfCell(_ section: Int, _ row: Int) -> (title: String, photoURL: URL) {
		let t = items?.sectionTitles[section]
		guard let title = t else {
			return (title: "Data unavailable", photoURL: URL(string: "http://localhost")!)
		}

		if let item = items?.categories[title]?[row] {
			return (title: item.title, photoURL: item.photo)
		}

		return (title: "Data unavailable", photoURL: URL(string: "http://localhost")!)
	}


//MARK: Output
	func receivedDocumentsList(items: DocumentsList) {
		self.items = items

		DispatchQueue.main.async {
			self.view.displayList()
		}
	}

	func receiveError() {
		//TODO
	}


}
