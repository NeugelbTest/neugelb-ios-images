import SwiftUI
import UIKit

public enum ImageAsset {

    nonisolated(unsafe) public static var onError: ((String) -> Void)?

    public static var calendar: Asset { Asset(name: "ic_calendar") }
    public static var clock: Asset { Asset(name: "ic_clock") }
    public static var loading: Asset { Asset(name: "ic_loading") }
    public static var search: Asset { Asset(name: "ic_search") }
    public static var ticket: Asset { Asset(name: "ic_ticket") }
    public static var star: Asset { Asset(name: "ic_star") }
    public static var left: Asset { Asset(name: "ic_left") }
    public static var close: Asset { Asset(name: "ic_close") }
    public static var imageLoading: Asset { Asset(name: "img_loading") }
    public static var imagePlaceholder: Asset { Asset(name: "img_placeholder") }

}

// MARK: - Image Asset

public extension ImageAsset {

    struct Asset: Hashable {

        let name: String

        public var uiImage: UIImage {
            guard let result = UIImage(named: name, in: .module, with: nil) else {
                ImageAsset.onError?("Could not find image named \(name) in assets")
                return UIImage()
            }
            return result
        }

        public var image: Image {
            .init(name, bundle: .module)
        }

        public func uiImage(tintColor: UIColor, isOpaque: Bool) -> UIImage? {
            uiImage.tinted(with: tintColor, isOpaque: isOpaque)
        }

        public func uiImage(tintColor: UIColor) -> UIImage {
            uiImage.withTintColor(tintColor, renderingMode: .alwaysOriginal)
        }

        public func uiImage(tintColor: UIColor, inset: CGFloat) -> UIImage {
            uiImage(
                tintColor: tintColor,
                insets: .init(top: inset, left: inset, bottom: inset, right: inset)
            )
        }

        public func uiImage(tintColor: UIColor, insets: UIEdgeInsets) -> UIImage {
            guard let image = UIImage(named: name, in: .module, with: nil)?.withTintColor(tintColor, renderingMode: .alwaysOriginal) else {
                ImageAsset.onError?("Could not find image named \(name) in assets")
                return UIImage()
            }
            if let insettedImage = image.withInset(insets) {
                return insettedImage
            } else {
                ImageAsset.onError?("Could not create insetted image from asset named \(name)")
                return image
            }
        }

        public func uiImage(renderingMode: UIImage.RenderingMode) -> UIImage {
            uiImage.withRenderingMode(renderingMode)
        }

    }

}
