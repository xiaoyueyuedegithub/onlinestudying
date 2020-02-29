//
//  Mooc.swift
//  demo
//
//  Created by Jiehao Zhang on 2020/2/29.
//  Copyright © 2020 Jiehao Zhang. All rights reserved.
//

import UIKit
import WebKit

class Mooc: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(URLRequest(url: URL(string: "https://www.icourse163.org")!))
        // Do any additional setup after loading the view.
    }
    
}
