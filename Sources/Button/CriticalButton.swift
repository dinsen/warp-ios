import Foundation
import SwiftUI

extension Warp.Button {
    /// <#Description#>
    static func createCritical(
        title: String,
        icon: String? = nil,
        action: @escaping () -> Void,
        size: Warp.ButtonSize = .big,
        isEnabled: Bool = false,
        fullWidth: Bool = false
    ) -> Warp.Button {
        Warp.Button(
            title: title,
            icon: icon,
            action: action,
            type: .critical,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }
}

public struct CriticalButton: View {
    /// <#Description#>
    let title: String

    /// <#Description#>
    let icon: String?

    /// <#Description#>
    let action: () -> Void

    /// <#Description#>
    let size: Warp.ButtonSize

    /// <#Description#>
    let isEnabled: Bool

    /// <#Description#>
    let fullWidth: Bool

    public init(
        title: String,
        icon: String?,
        action: @escaping () -> Void,
        size: Warp.ButtonSize,
        isEnabled: Bool,
        fullWidth: Bool
    ) {
        self.title = title
        self.icon = icon
        self.action = action
        self.size = size
        self.isEnabled = isEnabled
        self.fullWidth = fullWidth
    }

    public var body: some View {
        Warp.Button.createCritical(
            title: title,
            icon: icon,
            action: action,
            size: size,
            isEnabled: isEnabled,
            fullWidth: fullWidth
        )
    }
}

private struct CriticalButtonPreview: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 8) {
            Warp.Button.createCritical(title: "Button", action: {})

            Warp.Button.createCritical(title: "Disabled button", action: {}, isEnabled: false)
        }
    }
}
