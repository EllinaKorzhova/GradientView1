//
//  ViewController.swift
//  first project
//
//  Created by Эллина Коржова on 3.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var gradientView = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientView.layer.cornerRadius = 12
        gradientView.backgroundColor = .systemIndigo
        view.addSubview(gradientView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientView.frame = .init(x: 100, y: gradientView.frame.origin.y, width: 120, height: 120)
        gradientView.center.y = view.frame.height / 2
    }
    
}
    class View: UIView {
        
        let gradientLayer = CAGradientLayer()
        init(){
            
            super.init(frame: .zero)
            backgroundColor = .systemIndigo
            layer.cornerRadius = 12
            layer.cornerCurve = .continuous
            
            layer.shadowOpacity = 0.5
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = .init(width: .zero, height: 12)
            layer.shadowRadius = 12
            
            gradientLayer.startPoint = .init(x: 0, y: 0)
            gradientLayer.startPoint = .init(x: 1, y: 0.5)
            gradientLayer.colors = [UIColor.systemIndigo.withAlphaComponent(0.1), UIColor.orange.cgColor]
            layer.addSublayer(gradientLayer)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSublayers(of layer: CALayer) {
            super.layoutSublayers(of: layer)
            if layer == self.layer {
                gradientLayer.frame = bounds
                gradientLayer.cornerRadius = layer.cornerRadius
            }
        }
    }

