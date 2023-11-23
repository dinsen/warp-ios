import SwiftUI

extension Warp {
    public enum Typography {
        case display
        case title1
        case title2
        case title3
        case title4
        case title5
        case title6
        case preamble
        case body
        case bodyStrong
        case caption
        case captionStrong
        case detail
        case detailStrong
    }
}

extension Warp.Typography {
    public var font: Font {
        let size: CGFloat

        switch self {
            case .display:
                size = 48.0

            case .title1:
                size = 34.0

            case .title2:
                size = 28.0

            case .title3:
                size = 22.0

            case .title4:
                size = 16.0

            case .title5:
                size = 14.0

            case .title6:
                size = 12.0

            case .preamble:
                size = 20.0

            case .body:
                size = 16.0

            case .bodyStrong:
                size = 16.0

            case .caption:
                size = 14.0

            case .captionStrong:
                size = 14.0

            case .detail:
                size = 12.0

            case .detailStrong:
                size = 12.0
        }

        let fontStyle: Font.TextStyle

        switch self {
            case .display:
                fontStyle = .largeTitle

            case .title1:
                fontStyle = .largeTitle

            case .title2:
                fontStyle = .title

            case .title3:
                fontStyle = .title2

            case .title4:
                fontStyle = .callout

            case .title5:
                fontStyle = .footnote

            case .title6:
                fontStyle = .caption

            case .preamble:
                fontStyle = .title3

            case .body:
                fontStyle = .callout

            case .bodyStrong:
                fontStyle = .callout

            case .caption:
                fontStyle = .footnote

            case .captionStrong:
                fontStyle = .footnote

            case .detail:
                fontStyle = .caption

            case .detailStrong:
                fontStyle = .caption
        }

        switch self {
            case .display:
                return createMediumBoldFont(for: size, with: fontStyle)

            case .title1:
                return createMediumBoldFont(for: size, with: fontStyle)

            case .title2:
                return createMediumBoldFont(for: size, with: fontStyle)

            case .title3:
                return createMediumBoldFont(for: size, with: fontStyle)

            case .title4:
                return createMediumBoldFont(for: size, with: fontStyle)

            case .title5:
                return createMediumBoldFont(for: size, with: fontStyle)

            case .title6:
                return createMediumBoldFont(for: size, with: fontStyle)

            case .preamble:
                return createLightRegularFont(for: size, with: fontStyle)

            case .body:
                return createLightRegularFont(for: size, with: fontStyle)

            case .bodyStrong:
                return createMediumBoldFont(for: size, with: fontStyle)

            case .caption:
                return createLightRegularFont(for: size, with: fontStyle)

            case .captionStrong:
                return createMediumBoldFont(for: size, with: fontStyle)

            case .detail:
                return createLightRegularFont(for: size, with: fontStyle)

            case .detailStrong:
                return createMediumBoldFont(for: size, with: fontStyle)
        }
    }
}

extension Warp.Typography {
    private var isFinnApp: Bool {
        Warp.Config.warpTheme == .finn
    }

    private func createFont(from fontStrategy: FontStrategyInterface) -> Font {
        return .custom(
            fontStrategy.font.name,
            size: fontStrategy.size,
            relativeTo: fontStrategy.style
        )
    }

    private func createMediumBoldFont(for size: CGFloat, with fontStyle: Font.TextStyle) -> Font {
        if isFinnApp {
            return createFont(from: FinnMediumFont(size: size, style: fontStyle))
        } else {
            return createFont(from: ToriBoldFont(size: size, style: fontStyle))
        }
    }

    private func createLightRegularFont(for size: CGFloat, with fontStyle: Font.TextStyle) -> Font {
        if isFinnApp {
            return createFont(from: FinnLightFont(size: size, style: fontStyle))
        } else {
            return createFont(from: ToriRegularFont(size: size, style: fontStyle))
        }
    }
}
