//
//  ActivityIndicatorView.swift
//  Contacts
//
//  Created by packovv on 26.08.2022.
//

import UIKit

final class ActivityIndicatorView: UIActivityIndicatorView {

    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        activityIndicator.style = .large
        return activityIndicator
    }()
    
    func setupActivityIndicator(_ view: UIView) {
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
    }
    
    func startActivityIndicator(_ view: UIView) {
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func stopActivityIndicator(_ view: UIView) {
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
}
