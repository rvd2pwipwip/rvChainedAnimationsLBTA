//
//  ViewController.swift
//  rvChainedAnimationsLBTA
//
//  Created by Herve Desrosiers on 2020-02-03.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setStackView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    @objc fileprivate func handleTap() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -40, y: 0)
        }) { (_) in // don't use bool
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
            }) { (_) in
                
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.bodyLabel.transform = CGAffineTransform(translationX: -40, y: 0)
        }) { (_) in // don't use bool
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
            }) { (_) in
                
            }
        }
    }
    
    private let titleLabel: UILabel = {
        let tl = UILabel()
        tl.text = "Welcome to Stingray Qello"
        tl.numberOfLines = 0
        tl.font = UIFont(name: "Futura", size: 36)
        return tl
    }()

    private let bodyLabel: UILabel = {
        let bl = UILabel()
        bl.numberOfLines = 0
        bl.text = "Transform any screen into a live concert experience. Watch the largest selection of On Demand, full-length concert films, and music documentaries."
        return bl
    }()

    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .equalCentering
        return sv
    }()

    private func setStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(bodyLabel)
        stackView.spacing = 10
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100), // L & R padding of 50
        ])
    }
}
