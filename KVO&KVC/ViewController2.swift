//
//  ViewController2.swift
//  KVO&KVC
//
//  Created by Anil Kumar on 25/06/19.
//  Copyright © 2019 AIT. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

  public lazy var startOver: UIButton = {
    $0.setTitle("Back", for: .normal)
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.setTitleColor(.black, for: .normal)
    $0.backgroundColor = UIColor(red:0.92, green:0.94, blue:0.95, alpha:1.0)
    return $0
  }(UIButton())
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = UIColor.white
      
      startOver.addTarget(self, action: #selector(getCall), for: .touchUpInside)
      
      view.addSubview(startOver)
      
      startOver.translatesAutoresizingMaskIntoConstraints = false
      startOver.widthAnchor.constraint(equalToConstant: view.frame.size.width/2).isActive = true
      startOver.heightAnchor.constraint(equalToConstant: 40).isActive = true
      startOver.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0).isActive = true
      startOver.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 0).isActive = true
      
      dep.name = "Mani"
      dep.surname = "Basto"
      
    }
    

  @objc func getCall(){
    navigationController?.popViewController(animated: true)
  }
  
}
