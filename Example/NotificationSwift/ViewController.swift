//
//  ViewController.swift
//  NotificationSwift
//
//  Created by IsaacDouglas on 09/02/2020.
//  Copyright (c) 2020 IsaacDouglas. All rights reserved.
//

import UIKit
import NotificationSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let info = Info(identifier: "identifier",
                        categoryIdentifier: "category",
                        title: "Title",
                        body: "Subtitle",
                        time: 10)
        NotificationHandler.shared.notificationWith(info: info, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
