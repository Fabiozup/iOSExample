//
//  RestaurantSubMenuItemSwiftUIView.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 17/06/24.
//

import SwiftUI

struct RestaurantSubMenuItemSwiftUIViewLayout {
    enum Spacing {
        static let nanoSpacing: CGFloat = 8
    }
    
    enum Size {
        static let mediumSize: CGSize = .init(width: 50, height: 50)
    }
    
    enum Insets {
        static let smallPadding: EdgeInsets = .init(top: 12, leading: 12, bottom: 12, trailing: 12)
    }
    
    enum BorderRadius {
        static let nanoSpacing: CGFloat = 8
    }
}

struct RestaurantSubMenuItemSwiftUIView<ViewModel>: View where ViewModel: RestaurantSubMenuItemSwiftUIViewModeling {
    
    typealias Layout = RestaurantSubMenuItemSwiftUIViewLayout
    
    @State var backgroundColor: Color = .clear
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack(spacing: Layout.Spacing.nanoSpacing) {
            if viewModel.side == .left {
                imageContentView
                nameLabel
                    .multilineTextAlignment(.leading)
                Spacer()
            } else {
                Spacer()
                nameLabel
                    .multilineTextAlignment(.trailing)
                imageContentView
            }
        }
        .padding(Layout.Insets.smallPadding)
        .background(backgroundColor)
        .cornerRadius(Layout.BorderRadius.nanoSpacing)
    }
    
    private var nameLabel: some View {
        Text(viewModel.name)
            .font(.system(size: 25, weight: .bold))
            .foregroundColor(.white)
            .lineLimit(2)
            .minimumScaleFactor(0.5)
    }
    
    private var imageContentView: some View {
        ZStack {
            Color.white
                .cornerRadius(Layout.BorderRadius.nanoSpacing)
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: Layout.Size.mediumSize.width, height: Layout.Size.mediumSize.height)
                    .clipped()
            }
        }
        .frame(width: Layout.Size.mediumSize.width, height: Layout.Size.mediumSize.height)
    }
}

protocol RestaurantSubMenuItemSwiftUIViewModeling: ObservableObject {
    var name: String { get }
    var image: UIImage? { get }
    var side: RestaurantSubMenuItemSwiftUIViewModel.Side { get }
}

class RestaurantSubMenuItemSwiftUIViewModel: RestaurantSubMenuItemSwiftUIViewModeling, Identifiable {
    let id: UUID = .init()
    @Published var name: String
    @Published var image: UIImage?
    @Published var side: Side
    
    init(name: String, image: UIImage?, side: Side) {
        self.name = name
        self.image = image
        self.side = side
    }
    
    init(response: RestauranteSubMenuItem, side: Side) {
        self.name = response.name ?? .init()
        self.image = UIImage(named: response.imageName ?? .init())
        self.side = side
    }
    
    enum Side {
        case left
        case right
    }
}

#Preview {
    let item = RestaurantSubMenuItemSwiftUIViewModel(
        name: "Teste",
        image: nil,
        side: .left
    )
    return RestaurantSubMenuItemSwiftUIView(backgroundColor: .black, viewModel: item)
}
