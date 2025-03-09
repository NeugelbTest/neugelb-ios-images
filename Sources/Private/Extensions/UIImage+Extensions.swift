import UIKit

extension UIImage {

    func tinted(with color: UIColor, isOpaque: Bool = false) -> UIImage? {
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: size, format: format).image { _ in
            color.set()
            withRenderingMode(.alwaysTemplate).draw(at: .zero)
        }
    }

    func withInset(_ insets: UIEdgeInsets) -> UIImage? {
      let cgSize = CGSize(
        width: size.width + insets.left * scale + insets.right * scale,
        height: size.height + insets.top * scale + insets.bottom * scale
      )

      UIGraphicsBeginImageContextWithOptions(cgSize, false, scale)
      defer { UIGraphicsEndImageContext() }

      let origin = CGPoint(x: insets.left * scale, y: insets.top * scale)
      self.draw(at: origin)

      return UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(renderingMode)
    }

}
