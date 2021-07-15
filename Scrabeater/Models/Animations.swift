//
//  Animations.swift
//  Scrabeater
//
//  Created by Hamzah Gopaul on 14/09/2020.
//  Copyright © 2020 Hamzah Gopaul. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

struct Animations {
    var loading : NVActivityIndicatorView = NVActivityIndicatorView(frame: .zero, type: .ballRotateChase, color: .white, padding: 0)

    mutating func startLoadingBar(yourView view: UIView) {
        loading.translatesAutoresizingMaskIntoConstraints = false
          view.addSubview(loading)
          NSLayoutConstraint.activate([
              loading.widthAnchor.constraint(equalToConstant: 90),
              loading.heightAnchor.constraint(equalToConstant: 90),
              loading.centerYAnchor.constraint(equalTo: view.centerYAnchor),
              loading.centerXAnchor.constraint(equalTo: view.centerXAnchor)
          ])
          loading.startAnimating()
    }

}
