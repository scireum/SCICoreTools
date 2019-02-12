import Foundation

public func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ widht: CGFloat, _ height: CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: widht, height: height)
}

public extension CGRect {
    init(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) {
        self.init(x: x, y: y, width: width, height: height)
    }
}
