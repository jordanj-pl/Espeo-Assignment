//
//  DocumentsListEventHandler.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 23/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

protocol DocumentsListEventHandler: class {

	func viewLoaded()

	func itemClicked(row: Int, section: Int)

	func askForNumberOfSections() -> Int
	func askForTitleOfSection(_ section: Int) -> String
	func askForNumberOfRowsInSection(_ section: Int) -> Int
	func askForDataOfCell(_ section: Int, _ row: Int) -> (title: String, photoURL: URL)

}
