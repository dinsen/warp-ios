//
//  BoxView.swift
//  Finn
//
//  Created by Sajad Vishkai on 2024-02-08.
//

import SwiftUI
import Warp

struct BoxView: View {
    var body: some View {
        Form {
            createBoxView(basedOn: (hasLink, hasButton))
                .padding(.top)
                .padding(.bottom, 6)

            GroupBox(
                content: {
                    Picker("Pick your box style please", selection: $style.animation(.easeIn)) {
                        ForEach(Warp.BoxStyle.allCases, id: \.self) { style in
                            Text(style.styleName)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                }, label: {
                    Text("Style")
                }
            )

            GroupBox(
                content: {
                    TextField("Write the desired title", text: $boxTitle)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(
                                    Color.white,
                                    lineWidth: 1
                                )
                        }
                }, label: {
                    Text("Title")
                }
            )

            GroupBox(
                content: {
                    TextField("Write the desired subtitle", text: $boxSubtitle)
                        .padding(.all, 8)
                }, label: {
                    Text("Subtitle")
                }
            )

            GroupBox(
                content: {
                    let buttonStaticText = "link"

                    Toggle(isOn: $hasLink.defaultAnimation()) {
                        HStack {
                            let prependStaticText = !hasLink ? "Add": "Remove"

                            Text(prependStaticText + " " + buttonStaticText)

                            Spacer()
                        }
                    }
                    .padding()
                }, label: {
                    Text("Link")
                }
            )

            GroupBox(
                content: {
                    let buttonStaticText = "button"

                    Toggle(isOn: $hasButton.defaultAnimation()) {
                        HStack {
                            let prependStaticText = !hasButton ? "Add": "Remove"

                            Text(prependStaticText + " " + buttonStaticText)

                            Spacer()
                        }
                    }
                    .padding()
                }, label: {
                    Text("Button")
                }
            )
        }
    }

    @ViewBuilder
    private func createBoxView(basedOn state: (hasLink: Bool, hasButton: Bool)) -> some View {
        lazy var linkProvider: Warp.Box.ButtonConstructor = {
            (
                title: "Link",
                action: {
                    UIApplication.shared.open(URL(string: "https://github.com/warp-ds/warp-ios")!)
                }
            )
        }()

        lazy var buttonProvider: Warp.Box.ButtonConstructor = {
            (
                title: "Click me!",
                action: {
                    // no-op
                }
            )
        }()

        switch state {
            case (true, true):
                Warp.Box(
                    style: style,
                    title: boxTitle,
                    subtitle: boxSubtitle,
                    link: linkProvider,
                    button: buttonProvider
                )

            case (true, false):
                Warp.Box(
                    style: style,
                    title: boxTitle,
                    subtitle: boxSubtitle,
                    link: linkProvider,
                    button: nil
                )

            case (false, true):
                Warp.Box(
                    style: style,
                    title: boxTitle,
                    subtitle: boxSubtitle,
                    link: nil,
                    button: buttonProvider
                )

            case (false, false):
                Warp.Box(
                    style: style,
                    title: boxTitle,
                    subtitle: boxSubtitle,
                    link: nil,
                    button: nil
                )
        }
    }
}

extension Warp.BoxStyle: CaseIterable {
    public static var allCases: [Warp.BoxStyle] = [
        .neutral,
        .info,
        .bordered
    ]

    fileprivate var styleName: String {
        switch self {
            case .neutral:
                return "Neutral"

            case .info:
                return "Info"

            case .bordered:
                return "Bordered"
        }
    }
}

private extension Binding<Bool> {
    func defaultAnimation() -> Binding<Bool> {
        animation(.smooth)
    }
}

#Preview {
    BoxView()
}
