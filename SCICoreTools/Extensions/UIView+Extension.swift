import Foundation

public enum LayoutAnchor {
    case top
    case leading
    case trailing
    case bottom
    case left
    case right
}

public extension UIView {
    func hideKeyboardFromSuperViewWhenTappedAround() {
        let tabGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tabGesture.cancelsTouchesInView = false
        self.addGestureRecognizer(tabGesture)
    }

    @objc func dismissKeyboard() {
        self.superview?.endEditing(true)
    }

}


public extension UIView {

    fileprivate var bezierPathIdentifier:String { return "bezierPathBorderLayer" }

    fileprivate var bezierPathBorder:CAShapeLayer? {
        return (self.layer.sublayers?.filter({ (layer) -> Bool in
            return layer.name == self.bezierPathIdentifier && (layer as? CAShapeLayer) != nil
        }) as? [CAShapeLayer])?.first
    }

    func bezierPathBorder(_ color:UIColor = .white, width:CGFloat = 1) {

        var border = self.bezierPathBorder
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius:self.layer.cornerRadius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask

        if (border == nil) {
            border = CAShapeLayer()
            border!.name = self.bezierPathIdentifier
            self.layer.addSublayer(border!)
        }

        border!.frame = self.bounds
        let pathUsingCorrectInsetIfAny =
            UIBezierPath(roundedRect: border!.bounds, cornerRadius:self.layer.cornerRadius)

        border!.path = pathUsingCorrectInsetIfAny.cgPath
        border!.fillColor = UIColor.clear.cgColor
        border!.strokeColor = color.cgColor
        border!.lineWidth = width * 2
    }

    func removeBezierPathBorder() {
        self.layer.mask = nil
        self.bezierPathBorder?.removeFromSuperlayer()
    }

}

public extension UIView {
    func setShadow(color: UIColor = .black, opacity: Float = 0.3, offSet: CGSize = .zero, radius: CGFloat = 10, scale: Bool = true) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

public extension UIView {
    /**
     Embed a view in another view matching size of child to parent. Layouting is handled through autolayout.

     - parameters:
     - view: the view that gets embedded.
     */
    func embed(view: UIView, withConstant constant: CGFloat = 0) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: constant).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -constant).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -constant).isActive = true
    }

    func setConstraintsEqualTo(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    func setConstraintsEqualTo(view: UIView, forAnchorTypes anchorTypes: [LayoutAnchor]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        for anchor in anchorTypes {
            switch anchor {
            case .top:
                self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            case .leading, .left:
                self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            case .trailing, .right:
                self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            case .bottom:
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            }
        }
    }
}

