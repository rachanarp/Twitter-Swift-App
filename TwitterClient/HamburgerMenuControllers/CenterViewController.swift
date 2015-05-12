//
//  CenterViewController.swift
//  SlideOutNavigation
//
//  Created by Rachana Bedekar on 05/11/2015.
//  Copyright (c) 2015 Rachana Bedekar. All rights reserved.
//

import UIKit

@objc
protocol CenterViewControllerDelegate {
  optional func toggleLeftPanel()
  optional func toggleRightPanel()
  optional func collapseSidePanels()
}

class CenterViewController: UIViewController {
  
  var delegate: CenterViewControllerDelegate?
  
  // MARK: Button actions
  
  @IBAction func leftMenuTapped(sender: AnyObject) {
    delegate?.toggleLeftPanel?()
  }
  
  @IBAction func rightMenuTapped(sender: AnyObject) {
    delegate?.toggleRightPanel?()
  }
  
}

extension CenterViewController: SidePanelViewControllerDelegate {
    func menuItemSelected(indexPath : NSIndexPath) {
    delegate?.collapseSidePanels?()
  }
}