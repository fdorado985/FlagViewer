//
//  DetailViewController.swift
//  FlagViewer
//
//  Created by Juan Francisco Dorado Torres on 5/28/19.
//  Copyright © 2019 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  // MARK: - Outlets

  @IBOutlet var imageView: UIImageView!

  // MARK: - Public Properties

  var selectedImage: String?

  // MARK: - Computed Properties

  override var prefersHomeIndicatorAutoHidden: Bool {
    return navigationController?.hidesBarsOnTap ?? false
  }

  // MARK: - View Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    title = selectedImage
    navigationItem.largeTitleDisplayMode = .never
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

    if let imageToLoad = selectedImage {
      imageView.image = UIImage(named: imageToLoad)
    }

    imageView.layer.borderWidth = 1.0
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
  }

  // MARK: - Private Methods

  @objc private func shareTapped() {
    let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
  }
}
