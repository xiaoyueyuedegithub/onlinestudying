//
//  FirstViewController.swift
//  demo
//
//  Created by Jiehao Zhang on 2020/2/29.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func mooc(_ sender: UIButton) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "mooc")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}

