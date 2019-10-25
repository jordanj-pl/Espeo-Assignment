
//
//  DocumentDetailsViewController.swift
//  Espeo-Assignment
//
//  Created by Jordan Jasinski on 24/10/2019.
//  Copyright © 2019 skyisthelimit.aero. All rights reserved.
//

import UIKit
import SDWebImage

class DocumentDetailsViewController: UIViewController, DocumentDetailsView {

	@IBOutlet unowned var titleLabel: UILabel!
	@IBOutlet unowned var authorLabel: UILabel!
	@IBOutlet unowned var categoryLabel: UILabel!
	@IBOutlet unowned var creationDateLabel: UILabel!
	@IBOutlet unowned var headerImageView: UIImageView!
	@IBOutlet unowned var descriptionView: UITextView!
	@IBOutlet unowned var photoLoadingIndicator: UIActivityIndicatorView!

	public var eventHandler: DocumentDetailsEventHandler!

	override func viewDidLoad() {
		super.viewDidLoad()

		eventHandler.viewLoaded()
	}

//MARK: View setters
	func setTitle(_ title: String) {
		titleLabel.text = title
	}

	func setAuthor(_ author: String) {
		authorLabel.text = author
	}

	func setCategory(_ category: String) {
		categoryLabel.text = category
	}

	func setCreationDate(_ date: String) {
		creationDateLabel.text = date
	}

	func setImage(_ imageURL: URL) {
		headerImageView.sd_setImage(with: imageURL, completed: nil)
	}

	func setPhotoLoadingIndicator(active: Bool) {
		active ? photoLoadingIndicator.startAnimating() : photoLoadingIndicator.stopAnimating()
	}

	func setDescription(_ description: NSAttributedString) {
		descriptionView.attributedText = description
	}

	func showErrorMsg(title: String, msg: String, dismissBtn: String) {
		let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: dismissBtn, style: .cancel, handler: { [unowned self] (action: UIAlertAction) in
			self.eventHandler.didDismissError()
		}))
		present(alert, animated: true, completion: nil)
	}

}
