//
//  DocumentDetailsInteractorTests.swift
//  Espeo-AssignmentTests
//
//  Created by Jordan Jasinski on 25/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import XCTest

@testable import Espeo_Assignment

class DocumentDetailsInteractorTests : XCTestCase {

	let fakeAPIClient = FakeAPIClient()
	var mockOutput: MockDocumentDetailsOutput!
	var interactor: DocumentDetailsInteractor!

	override func setUp() {
		interactor = DocumentDetailsInteractor(apiClient: fakeAPIClient)
		mockOutput = MockDocumentDetailsOutput()
		interactor.output = mockOutput
	}

	func test_retrieveExistingDocument() {
		//Given
		let documentId = fakeAPIClient.existingDocumentId

		//When
		interactor.retrieveDocumentDetails(id: documentId)

		//Then
		XCTAssertTrue(mockOutput.receiveDocumentDetailsCalled)
		XCTAssertFalse(mockOutput.receiveErrorCalled)
		XCTAssertNotNil(mockOutput.documentDetails)
	}

	func test_retrieveNonexistingDocument() {
		//Given
		let documentId = fakeAPIClient.nonexistingDocumentId

		//When
		interactor.retrieveDocumentDetails(id: documentId)

		//Then
		XCTAssertFalse(mockOutput.receiveDocumentDetailsCalled)
		XCTAssertTrue(mockOutput.receiveErrorCalled)
	}

}
