//
//  LeftViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit

@objc
protocol SidePanelViewControllerDelegate {
  func menuItemSelected(indexPath: NSIndexPath)
}

class SidePanelViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var delegate: SidePanelViewControllerDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.reloadData()
  }
  
}
