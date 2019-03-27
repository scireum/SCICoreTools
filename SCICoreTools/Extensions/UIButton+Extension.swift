import UIKit

private var pTouchAreaEdgeInsets: UIEdgeInsets = .zero

extension UIButton {

    /**
     Helper var to increase touch area of a button
     Useage: button.touchAreaEdgeInsets = UIEdgeInsets(top: -16, left: -16, bottom: -16, right: -16)
     */
    public var touchAreaEdgeInsets: UIEdgeInsets {
        get {
            if let value = objc_getAssociatedObject(self, &pTouchAreaEdgeInsets) as? NSValue {
                var edgeInsets: UIEdgeInsets = .zero
                value.getValue(&edgeInsets)
                return edgeInsets
            }
            else {
                return .zero
            }
        }
        set(newValue) {
            var newValueCopy = newValue
            let objCType = NSValue(uiEdgeInsets: .zero).objCType
            let value = NSValue(&newValueCopy, withObjCType: objCType)
            objc_setAssociatedObject(self, &pTouchAreaEdgeInsets, value, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if (self.touchAreaEdgeInsets == .zero || !self.isEnabled || self.isHidden) {
            return super.point(inside: point, with: event)
        }
        let hitFrame = self.bounds.inset(by: self.touchAreaEdgeInsets)

        return hitFrame.contains(point)
    }
}
