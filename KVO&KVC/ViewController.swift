//
//  ViewController.swift
//  KVO&KVC
//
//  Created by Anil Kumar on 25/06/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import UIKit

let dep = DependencyTest()

class ViewController: UIViewController {
  
  public lazy var startOver: UIButton = {
    $0.setTitle("StartOver", for: .normal)
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.setTitleColor(.black, for: .normal)
    $0.backgroundColor = UIColor(red:0.92, green:0.94, blue:0.95, alpha:1.0)
    return $0
  }(UIButton())
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    startOver.addTarget(self, action: #selector(getCall), for: .touchUpInside)
    
    view.addSubview(startOver)
    startOver.translatesAutoresizingMaskIntoConstraints = false
    startOver.widthAnchor.constraint(equalToConstant: view.frame.size.width/2).isActive = true
    startOver.heightAnchor.constraint(equalToConstant: 40).isActive = true
    startOver.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0).isActive = true
    startOver.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 0).isActive = true
    
    
    dep.addObserver(self, forKeyPath: #keyPath(DependencyTest.fullName), options: [.new, .old], context: nil)
    dep.name = "bob"
    dep.surname = "gril"
  }
  
 
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    print(keyPath)
    print(change?[.newKey])
    print(change?[.oldKey])
  }
  
  @objc func getCall(){
      let vc = ViewController2()
     navigationController?.pushViewController(vc, animated: true)
  }
  
  

}

@objcMembers
class DependencyTest: NSObject {
  dynamic var fullName: String = ""
  var name = "" {
    didSet {
      fullName = name + " " + surname
    }
  }
  var surname = "" {
    didSet {
      fullName = name + " " + surname
    }
  }
}
