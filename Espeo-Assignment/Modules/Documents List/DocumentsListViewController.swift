//
//  DocumentsListView.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 23/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import UIKit
import SDWebImage

class DocumentsListViewController: UITableViewController, DocumentsListView {
	public var eventHandler: DocumentsListEventHandler!

	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.estimatedRowHeight = 100
		
		eventHandler.viewLoaded()
	}

	func displayList() {
		self.tableView.reloadData()
	}

//MARK: Data Source

	override func numberOfSections(in tableView: UITableView) -> Int {
		return eventHandler.askForNumberOfSections()
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return eventHandler.askForTitleOfSection(section)
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return eventHandler.askForNumberOfRowsInSection(section)
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell: DocumentsListItemCell = tableView.dequeueReusableCell(withIdentifier: "DocumentItemCell", for: indexPath) as! DocumentsListItemCell

		let cellData = eventHandler.askForDataOfCell(indexPath.section, indexPath.row)

		cell.titleLabel?.text = cellData.title
		cell.thumbView?.sd_setImage(with: cellData.photoURL, completed: nil)

		return cell
	}

//MARK: Delegate

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		eventHandler.itemClicked(row: indexPath.row, section: indexPath.section)
	}

}
