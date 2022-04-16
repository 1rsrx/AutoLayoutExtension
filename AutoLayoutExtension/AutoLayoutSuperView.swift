//
//  AutoLayoutSuperView.swift
//  AutoLayoutExtension
//
//  Created by Hikaru Kuroda on 2022/04/17.
//

import Foundation
import UIKit

public protocol AutoLayoutSuperViewProtocol {
    associatedtype CompatibleType
    var superView: CompatibleType { get }
}

public final class AutoLayoutSuperView<Base> {
    private let base: Base

    public init(_ base: Base) {
        self.base = base
    }
}

public extension AutoLayoutSuperViewProtocol {
    var superView: AutoLayoutSuperView<Self> {
        return AutoLayoutSuperView(self)
    }
}

extension AutoLayout: AutoLayoutSuperViewProtocol { }

extension AutoLayoutSuperView where Base == AutoLayout<UIView> {

    func set(top: CGFloat? = nil, right: CGFloat? = nil,
                       bottom: CGFloat? = nil, left: CGFloat? = nil,
                       height: CGFloat? = nil, width: CGFloat? = nil) {
        guard let superView = base.base.superview else { return }

        if let top = top {
            base.base.topAnchor.constraint(equalTo: superView.topAnchor, constant: top).isActive = true
        }

        if let right = right {
            base.base.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: right).isActive = true
        }

        if let bottom = bottom {
            base.base.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: bottom).isActive = true
        }

        if let left = left {
            base.base.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: left).isActive = true
        }

        if let height = height {
            base.base.heightAnchor.constraint(equalToConstant: height).isActive = true
        }

        if let width = width {
            base.base.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }

    func setCenterX(_ constraint: CGFloat = 0) {
        guard let superView = base.base.superview else { return }

        base.base.centerXAnchor.constraint(equalTo: superView.centerXAnchor, constant: constraint).isActive = true
    }

    func setCenterY(_ constraint: CGFloat = 0) {
        guard let superView = base.base.superview else { return }

        base.base.centerYAnchor.constraint(equalTo: superView.centerYAnchor, constant: constraint).isActive = true
    }

    func fill() {
        guard let superView = base.base.superview else { return }

        base.base.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        base.base.rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
        base.base.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        base.base.leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
    }


    func fillSafeArea() {
        guard let superView = base.base.superview else { return }

        base.base.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor).isActive = true
        base.base.rightAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.rightAnchor).isActive = true
        base.base.bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        base.base.leftAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leftAnchor).isActive = true
    }

    func fillSafeAreaExcludedBottom() {
        guard let superView = base.base.superview else { return }

        base.base.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor).isActive = true
        base.base.rightAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.rightAnchor).isActive = true
        base.base.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        base.base.leftAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leftAnchor).isActive = true
    }
}
