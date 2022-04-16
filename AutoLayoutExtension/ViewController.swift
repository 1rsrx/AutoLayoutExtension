//
//  ViewController.swift
//  AutoLayoutExtension
//
//  Created by Hikaru Kuroda on 2022/04/16.
//

import UIKit

class ViewController: UIViewController {

    let v1 = UIView()
    let v2 = UIView()
    let v3 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        v1.backgroundColor = .blue
        v2.backgroundColor = .yellow
        v3.backgroundColor = .red

        // v1を親Viewいっぱいに広げる
        view.addSubview(v1)
        v1.al.superView.fill()

        // v2を親Viewの上下中央に配置
        view.addSubview(v2)
        v2.al.setSize(height: 100, width: 100)
        v2.al.superView.setCenterX()
        v2.al.superView.setCenterY()

        // v3をv2の10右に配置
        v1.addSubview(v3)
        v3.al.setWidth(equalTo: v2.widthAnchor)
        v3.al.setHeight(equalTo: v2.heightAnchor, multiplier: 2)
        v3.al.setTop(equalTo: v2.topAnchor, constraint: -10)
        v3.al.setLeft(equalTo: v2.rightAnchor)
    }
}
