//
//  AboutMeViewController.swift
//  Contacts
//
//  Created by packovv on 30.08.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        setGradient()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            view.addSubview(imageView)
            imageView.layer.cornerRadius = 10
            imageView.snp.makeConstraints { maker in
                maker.width.equalTo(350)
                maker.height.equalTo(350)
                maker.centerX.equalToSuperview()
                maker.top.equalToSuperview().inset(120)
            }
            return imageView
        }()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        let nameLabel: UILabel = {
            let nameLabel = UILabel()
            view.addSubview(nameLabel)
            nameLabel.snp.makeConstraints { maker in
                maker.width.equalTo(100)
                maker.height.equalTo(20)
                maker.centerX.equalToSuperview()
                maker.top.equalTo(imageView).inset(360)
                maker.right.equalToSuperview().inset(20)
            }
            return nameLabel
        }()
        
        let hobbyLabel: UILabel = {
            let hobbyLabel = UILabel()
            view.addSubview(hobbyLabel)
            hobbyLabel.snp.makeConstraints { maker in
                maker.width.equalTo(100)
                maker.height.equalTo(20)
                maker.centerX.equalToSuperview()
                maker.top.equalTo(nameLabel).inset(30)
                maker.right.equalToSuperview().inset(20)
            }
            return hobbyLabel
        }()
        
        let workLabel: UILabel = {
            let workLabel = UILabel()
            view.addSubview(workLabel)
            workLabel.snp.makeConstraints { maker in
                maker.width.equalTo(100)
                maker.height.equalTo(20)
                maker.centerX.equalToSuperview()
                maker.top.equalTo(hobbyLabel).inset(30)
                maker.right.equalToSuperview().inset(20)
            }
            return workLabel
        }()
        
        imageView.image = UIImage(named: "me")
        nameLabel.text = "Name: Pavel"
        hobbyLabel.text = "Hobby: yes"
        workLabel.text = "Job: looking for"
    }
    
    private func setGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.white.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }

}
