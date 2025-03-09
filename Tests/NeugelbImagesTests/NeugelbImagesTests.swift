import Testing
import SwiftUI
@testable import NeugelbImages

struct ImageAssetTests {
    
    @Test
    func test_asset_names() {
        #expect(ImageAsset.calendar.name == "ic_calendar")
        #expect(ImageAsset.clock.name == "ic_clock")
        #expect(ImageAsset.loading.name == "ic_loading")
        #expect(ImageAsset.search.name == "ic_search")
        #expect(ImageAsset.ticket.name == "ic_ticket")
        #expect(ImageAsset.star.name == "ic_star")
        #expect(ImageAsset.imageLoading.name == "img_Loading")
        #expect(ImageAsset.imagePlaceholder.name == "img_placeholder")
    }
    
    @Test
    func test_UIImage_retrieval() {
        let asset = ImageAsset.calendar
        let image = asset.uiImage
        #expect(image != nil, "UIImage should not be nil")
    }
    
    @Test
    func test_UIImage_with_tint_color() {
        let asset = ImageAsset.clock
        let tinted = asset.uiImage(tintColor: .red)
        #expect(tinted != nil, "UIImage with tint color should not be nil")
    }
    
    @Test
    func test_UIImage_with_rendering_mode() {
        let asset = ImageAsset.ticket
        let renderedImage = asset.uiImage(renderingMode: .alwaysTemplate)
        #expect(renderedImage != nil, "UIImage with rendering mode should not be nil")
    }
    
    @Test
    func test_UIImage_Wwith_insets() {
        let asset = ImageAsset.imagePlaceholder
        let insetImage = asset.uiImage(tintColor: .blue, inset: 10)
        #expect(insetImage != nil, "UIImage with insets should not be nil")
    }
}
