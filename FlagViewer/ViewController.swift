//
//  ViewController.swift
//  FlagViewer
//
//  Created by Juan Francisco Dorado Torres on 5/28/19.
//  Copyright © 2019 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  // MARK: - Private Properties

  private var flags = [String]()

  // MARK: - View cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Flag Viewer"
    navigationController?.navigationBar.prefersLargeTitles = true

    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    let items = try! fm.contentsOfDirectory(atPath: path)

    for item in items {
      if item.hasSuffix(".png") {
        flags.append(item)
        flags.sort()
      }
    }
  }
}

// MARK: - Table View Delegates

extension ViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return flags.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
    cell.textLabel?.text = flags[indexPath.row]
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
      vc.selectedImage = flags[indexPath.row]
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}

