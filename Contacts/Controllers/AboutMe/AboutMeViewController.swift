//
//  AboutMeViewController.swift
//  Contacts
//
//  Created by packovv on 30.08.2022.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    private var photoName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        randomPhoto()
        setupUI()
    }
    
    private func setupUI() {
        setGradient()
        
        let _: UIView = {
            let viewImage = UIView()
            viewImage.backgroundColor = .white
            viewImage.layer.cornerRadius = 20
            view.addSubview(viewImage)
            viewImage.snp.makeConstraints { maker in
                maker.width.equalTo(280)
                maker.height.equalTo(370)
                maker.centerX.equalToSuperview()
                maker.top.equalToSuperview().inset(130)
            }
            return viewImage
        }()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            view.addSubview(imageView)
            imageView.snp.makeConstraints { maker in
                maker.width.equalTo(280)
                maker.height.equalTo(350)
                maker.centerX.equalToSuperview()
                maker.top.equalToSuperview().inset(140)
            }
            return imageView
        }()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        let _: UIView = {
            let textView = UIView()
            textView.backgroundColor = .white
            view.addSubview(textView)
            textView.snp.makeConstraints { maker in
                maker.height.equalTo(90)
//                maker.centerX.equalToSuperview()
                maker.top.equalTo(imageView).inset(365)
                maker.right.equalToSuperview().inset(16)
                maker.left.equalToSuperview().inset(16)
            }
            textView.layer.cornerRadius = 20
            return textView
        }()
        
        let nameLabel: UILabel = {
            let nameLabel = UILabel()
            view.addSubview(nameLabel)
            nameLabel.snp.makeConstraints { maker in
                maker.width.equalTo(100)
                maker.height.equalTo(20)
                maker.centerX.equalToSuperview()
                maker.top.equalTo(imageView).inset(370)
                maker.right.equalToSuperview().inset(30)
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
                maker.right.equalToSuperview().inset(30)
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
                maker.right.equalToSuperview().inset(30)
            }
            return workLabel
        }()
        
        imageView.image = UIImage(named: photoName)
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
    
    private func randomPhoto() {
        let random = Int.random(in: 0...1)
        
        switch random {
        case 0:
            photoName = "me"
        case 1:
            photoName = "me2"
        default:
            print("Error: \(#function)")
        }
    }

}


