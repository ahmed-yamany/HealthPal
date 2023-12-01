//
//  CircleShapeView.swift
//  Doctor-Appointment
//
//  Created by Ahmed Yamany on 24/11/2023.
//

import UIKit

class CircleShapeView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        update()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        update()
    }
    private func update() {
        let shapeLayer = createShapeLayer()
        self.layer.addSublayer(shapeLayer)
    }
    private func createShapeLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = backgroundColor?.cgColor
        backgroundColor = .clear
        shapeLayer.lineWidth = 1
        ///
        let path = createShapePath()
        shapeLayer.path = path.cgPath
        return shapeLayer
    }
    private func createShapePath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.midX, y: bounds.midY))
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                    radius: bounds.height / 2,
                    startAngle: 0, endAngle: 90,
                    clockwise: true)
        path.close()
        return path
    }
}
