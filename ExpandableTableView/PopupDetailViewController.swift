//
//  PopupDetailViewController.swift
//  ExpandableTableView
//
//  Created by Tsukuda Hiroshi on 2020/08/30.
//  Copyright © 2020 Tsukuda Hiroshi. All rights reserved.
//

import UIKit

class PopupDetailViewController: UIViewController {

   
    @IBOutlet weak var detailTextView: UILabel!
    var wordDetail = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let popUpView: UIView = self.view.viewWithTag(100)! as UIView
        detailTextView.text? = wordDetail
        popUpView.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onTapButtom(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        var tapLocation: CGPoint = CGPoint()
        // タッチイベントを取得する
        let touch = touches.first
        // タップした座標を取得する
        tapLocation = touch!.location(in: self.view)

        let popUpView: UIView = self.view.viewWithTag(100)! as UIView


        if !popUpView.frame.contains(tapLocation) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
