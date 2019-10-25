//
//  FakeAPIClient.swift
//  Espeo-AssignmentTests
//
//  Created by Jordan Jasinski on 25/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

@testable import Espeo_Assignment

class FakeAPIClient: APIClient {

	public let existingDocumentId = 1
	public let nonexistingDocumentId = 2

    override func retrieveDocument(id: Int, success: @escaping DocumentDetailsSuccessHandler, failure: @escaping FailureHandler) {

		if(id == nonexistingDocumentId) {
			let error = MockError()
			failure(error)
		}

		if(id == existingDocumentId) {
			let doc = DocumentDetailsEntity(id: existingDocumentId, title: "Fake Document", category: "Some Category", author: "Author", headerImg: "http://img.com/a.png", thumbnailImg: "http://img.com/b.png", created: "2019-10-24T20:11:56.260392", text: "<p>qwerty</p></p>azerty</p>")
			success(doc)
		}
	}
}
