//
//  DetailViewController.swift
//  PrototypeCells
//
//  Created by Connor Goddard on 17/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // CG - Use detailItem to handle timing issues between segue loading.
    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
                
        // Update the user interface for the detail item. if let detail = self.detailItem {
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail
            }
        }
    }

}
