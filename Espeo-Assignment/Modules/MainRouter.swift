//
//  MainRouter.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 23/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import UIKit

class MainRouter {

	public var navController: UINavigationController!
	let apiClient = APIClient()

	public func startMainFlow() {
		let mainView: DocumentsListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DocumentsList")

		let presenter = DocumentsListPresenter()
		presenter.view = mainView
		presenter.router = self

		mainView.eventHandler = presenter

		let interactor = DocumentsListInteractor(apiClient: apiClient)
		interactor.output = presenter

		presenter.provider = interactor

		navController.viewControllers = [mainView]
	}

	public func displayDocumentDetails(_ id: Int) {
		let view: DocumentDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DocumentDetails")

		let presenter = DocumentDetailsPresenter(documentId: id)
		presenter.view = view
		presenter.router = self

		view.eventHandler = presenter

		let interactor = DocumentDetailsInteractor(apiClient: apiClient)
		interactor.output = presenter

		presenter.provider = interactor

		navController.pushViewController(view, animated: true)
	}

	public func goBack() {
		navController.popViewController(animated: true)
	}

}
