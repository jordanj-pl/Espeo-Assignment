//
//  APIClient.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 23/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import Foundation

typealias FailureHandler = (_ error: Error) -> Void
typealias DocumentsListSuccessHandler = (_ documents: DocumentsListEntity) -> Void
typealias DocumentDetailsSuccessHandler = (_ documents: DocumentDetailsEntity) -> Void

class APIClient : NSObject, URLSessionDelegate {
	private let iProtocol = "http"
	private let hostname = "0.0.0.0"
	private let port = 8080
	private let documentsListPath = "api/v1/documents/"

	private let operationQueue: OperationQueue = OperationQueue()
	private var urlSession: URLSession!

	override init() {
		super.init()

		let config = URLSessionConfiguration.default
		urlSession = URLSession(configuration: config, delegate: self, delegateQueue: operationQueue)
	}

	private func urlByAddingPath(path: String) -> URL? {
		var url: URL? = URL(string: iProtocol + "://" + hostname + ":" + String(port))
		url = url?.appendingPathComponent(path)
		return url
	}

	public func retrieveDocumentsList(success: @escaping DocumentsListSuccessHandler, failure: @escaping FailureHandler) {
		guard let url = urlByAddingPath(path: documentsListPath) else {
			//TODO handle error
			return
		}

		urlSession.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in

			if let error = error {
				failure(error)
				return
			}

			guard let response = response else {
				//TODO
				return
			}

			guard let data = data else {
				//TODO
				return
			}

			if response is HTTPURLResponse {
				let response: HTTPURLResponse = response as! HTTPURLResponse
				if response.statusCode != 200 {
					//TODO
					return
				}

				let jsonDecoder = JSONDecoder.init()

				do {
					let model = try jsonDecoder.decode(DocumentsListEntity.self, from: data)
					success(model)
					return
				} catch let e {
					failure(e)
					return
				}

			}


		}.resume()
	}

	public func retrieveDocument(id: Int, success: @escaping DocumentDetailsSuccessHandler, failure: @escaping FailureHandler) {
		let path = documentsListPath + String(id)
		guard let url = urlByAddingPath(path: path) else {
			//TODO handle error
			return
		}

		urlSession.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in

			if let error = error {
				failure(error)
				return
			}

			guard let response = response else {
				//TODO
				return
			}

			guard let data = data else {
				//TODO
				return
			}

			if response is HTTPURLResponse {
				let response: HTTPURLResponse = response as! HTTPURLResponse
				if response.statusCode != 200 {
					//TODO
					return
				}

				let jsonDecoder = JSONDecoder.init()

				do {
					let model = try jsonDecoder.decode(DocumentDetailsEntity.self, from: data)
					success(model)
					return
				} catch let e {
					failure(e)
					return
				}

			}

		}.resume()


	}

}
