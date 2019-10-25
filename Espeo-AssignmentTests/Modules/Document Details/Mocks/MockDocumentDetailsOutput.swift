//
//  MockDocumentDetailsOutput.swift
//  Espeo-AssignmentTests
//
//  Created by Jordan Jasinski on 25/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

@testable import Espeo_Assignment

class MockDocumentDetailsOutput : DocumentDetailsOutput {

	public var documentDetails: DocumentDetails?
	public var receiveDocumentDetailsCalled: Bool = false
	func receiveDocumentDetails(_ details: DocumentDetails) {
		receiveDocumentDetailsCalled = true
		documentDetails = details
	}

	public var receiveErrorCalled: Bool = false
	func receiveError() {
		receiveErrorCalled = true
	}

}

