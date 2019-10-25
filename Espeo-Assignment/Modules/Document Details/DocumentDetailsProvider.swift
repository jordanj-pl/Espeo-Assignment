//
//  DocumentDetailsProvider.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 24/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

protocol DocumentDetailsProvider : class {

	func retrieveDocumentDetails(id: Int)

}
