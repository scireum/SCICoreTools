import Foundation

public func CGSizeMake(_ width: CGFloat, _ height: CGFloat) -> CGSize {
    return CGSize(width: width, height: height)
}

public extension CGSize {
    init(_ width: CGFloat, _ height: CGFloat) {
        self.init(width: width, height: height)
    }
}
