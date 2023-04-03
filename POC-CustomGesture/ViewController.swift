//
//  ViewController.swift
//  POC-CustomGesture
//
//  Created by Luiz Sena on 29/03/23.
//

import UIKit

class ViewController: UIViewController {

    private let theView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    private let theImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Vector 1")
        return view
    }()

    var thunderRecognizer: ThunderGestureRecognizer!
    var checkRecognizer: CheckGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        thunderRecognizer = ThunderGestureRecognizer(target: self, action: #selector(circled))
        checkRecognizer = CheckGestureRecognizer(target: self, action: #selector(circled))

        view.backgroundColor = .systemMint
        view.addSubview(theView)
        view.addSubview(theImageView)
        view.addGestureRecognizer(thunderRecognizer)
        view.addGestureRecognizer(checkRecognizer)

        setContraits()
    }

    @objc func circled(_ c: UIGestureRecognizer) {
        if c.state == .ended {
            theView.backgroundColor = UIColor.random()
      }
    }

    func setContraits() {
        NSLayoutConstraint.activate([
            theView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            theView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            theView.heightAnchor.constraint(equalToConstant: 100),
            theView.widthAnchor.constraint(equalToConstant: 100),

            theImageView.widthAnchor.constraint(equalToConstant: 200),
            theImageView.heightAnchor.constraint(equalToConstant: 200),
            theImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            theImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
