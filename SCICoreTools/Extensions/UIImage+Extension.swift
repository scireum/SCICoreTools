import UIKit
import ImageIO


public extension UIImage {
    /**
     Returns a rotated image so that the imageOrientation is UIImageOrientation.up
     */
    func normalized() -> UIImage {
        if (imageOrientation == .up) {
            return self
        }

        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        draw(in: rect)

        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return normalizedImage
    }
}

public extension UIImage {
    /**
     Scales an UIImage to the given size.
     */
    func scaled(toSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }

    /**
     Scales an UIImage to the given width keeping the aspect ratio.
     */
    func scaledKeepingAspect(toWidth newWidth: CGFloat) -> UIImage {
        let newHeight = size.height*newWidth/size.width
        return scaled(toSize: CGSize(width: newWidth, height: newHeight))
    }

    /**
     Scales an UIImage to the given height keeping the aspect ratio.
     */
    func scaledKeepingAspect(toHeight newHeight: CGFloat) -> UIImage {
        let newWidth = size.width*newHeight/size.height
        return scaled(toSize: CGSize(width: newWidth, height: newHeight))
    }
}
