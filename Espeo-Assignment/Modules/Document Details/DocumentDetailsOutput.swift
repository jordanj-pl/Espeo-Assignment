//
//  DocumentDetailsOutput.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 24/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

struct DocumentDetails {
	public let id: Int
	public let title: String
	public let author: String
	public let category: String
	public let creationDate: Date
	public let photoUrl: URL
	public let description: Data
}

protocol DocumentDetailsOutput : class {

	func receiveDocumentDetails(_ details: DocumentDetails)
	func receiveError()//TODO

}
