import Foundation
import SwiftUI

extension Warp.Button {
    private static let secondaryType: Warp.ButtonType = .secondary

    /// <#Description#>
    static func createSecondary(
        title: String,
        icon: Image? = nil,
        action: @escaping () -> Void = {},
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = true,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: action,
            type: secondaryType,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }
}

private struct SecondaryButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Warp.Button.createSecondary(title: "Button")

            Warp.Button.createSecondary(title: "Disabled button", isEnabled: false)
        }
    }
}
