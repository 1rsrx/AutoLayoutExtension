//
//  AutoLayout.swift
//  AutoLayoutExtension
//
//  Created by Hikaru Kuroda on 2022/04/17.
//

import Foundation
import UIKit

public protocol AutoLayoutProtocol {
    associatedtype CompatibleType
    var al: CompatibleType { get }
}

public final class AutoLayout<Base> {
    let base: Base

    public init(_ base: Base) {
        self.base = base

        if (type(of: self.base) == UIView.self) {
            let view = self.base as! UIView
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

public extension AutoLayoutProtocol {
    var al: AutoLayout<Self> {
        return AutoLayout(self)
    }
}

extension UIView: AutoLayoutProtocol { }

extension AutoLayout where Base == UIView {

    func setTop(equalTo yAnchor: NSLayoutYAxisAnchor, constraint: CGFloat = 0) {
        base.topAnchor.constraint(equalTo: yAnchor, constant: constraint).isActive = true
    }

    func setRight(equalTo xAnchor: NSLayoutXAxisAnchor, constraint: CGFloat = 0) {
        base.rightAnchor.constraint(equalTo: xAnchor, constant: constraint).isActive = true
    }

    func setBottom(equalTo xAnchor: NSLayoutYAxisAnchor, constraint: CGFloat = 0) {
        base.bottomAnchor.constraint(equalTo: xAnchor, constant: constraint).isActive = true
    }

    func setLeft(equalTo xAnchor: NSLayoutXAxisAnchor, constraint: CGFloat = 0) {
        base.leftAnchor.constraint(equalTo: xAnchor, constant: constraint).isActive = true
    }

    func setCenterX(equalTo xAnchor: NSLayoutXAxisAnchor, constraint: CGFloat = 0) {
        base.centerXAnchor.constraint(equalTo: xAnchor, constant: constraint).isActive = true
    }

    func setCenterY(equalTo yAnchor: NSLayoutYAxisAnchor, constraint: CGFloat = 0) {
        base.centerYAnchor.constraint(equalTo: yAnchor, constant: constraint).isActive = true
    }

    func setSize(height: CGFloat = 0, width: CGFloat = 0) {
        base.heightAnchor.constraint(equalToConstant: height).isActive = true
        base.widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    func setHeight(equalTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constraint: CGFloat = 0) {
        base.heightAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constraint).isActive = true
    }

    func setWidth(equalTo anchor: NSLayoutDimension, multiplier: CGFloat = 1, constraint: CGFloat = 0) {
        base.widthAnchor.constraint(equalTo: anchor, multiplier: multiplier, constant: constraint).isActive = true
    }

    func set(top: CGFloat? = nil, right: CGFloat? = nil,
                       bottom: CGFloat? = nil, left: CGFloat? = nil,
                       height: CGFloat? = nil, width: CGFloat? = nil) {

        guard let superView = base.superview else { return }

        if let top = top {
            base.topAnchor.constraint(equalTo: superView.topAnchor, constant: top).isActive = true
        }

        if let right = right {
            base.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: right).isActive = true
        }

        if let bottom = bottom {
            base.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottom).isActive = true
        }

        if let left = left {
            base.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: left).isActive = true
        }

        if let height = height {
            base.heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        if let width = width {
            base.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
}
