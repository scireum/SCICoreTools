import UIKit
import Foundation

public extension UITableView {
    //workaround for not sticky headerviews
    //Source: https://stackoverflow.com/questions/1074006/is-it-possible-to-disable-floating-headers-in-uitableview-with-uitableviewstylep
    public func removeStickyHeader() {
        let dummyViewHeight = CGFloat(40)
        self.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: dummyViewHeight))
        self.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
    }

    public func setEmptyFooter(withSeperatorColor color: UIColor) {
        self.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 0.5))
        self.tableFooterView?.backgroundColor = color
    }
}
