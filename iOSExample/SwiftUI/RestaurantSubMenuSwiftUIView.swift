//
//  RestaurantSubMenuSwiftUIView.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 17/06/24.
//

import SwiftUI

struct RestaurantSubMenuSwiftUIViewLayout {
    enum Spacing {
        static let nanoSpacing: CGFloat = 8
        static let bigSpacing: CGFloat = 24
    }
    
    enum Insets {
        static let atomPadding: EdgeInsets = .init(top: 2, leading: 2, bottom: 2, trailing: 2)
        static let customPadding: EdgeInsets = .init(top: 80, leading: 0, bottom: 0, trailing: 0)
    }
    
    enum BorderRadius {
        static let nanoSpacing: CGFloat = 8
    }
}

struct RestaurantSubMenuSwiftUIView<ViewModel>: View where ViewModel: RestaurantSubMenuSwiftUIViewModeling {
    typealias Layout = RestaurantSubMenuSwiftUIViewLayout
    
    @State var backgroundColor: Color = .clear
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: Layout.Spacing.nanoSpacing) {
            VStack(spacing: Layout.Spacing.bigSpacing) {
                Text(viewModel.title)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(viewModel.description)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            
            ZStack {
                if let backgroundImage = viewModel.backgroundImage {
                    GeometryReader { proxy in
                        Image(uiImage: backgroundImage)
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: proxy.size.width, height: proxy.size.height)
                            .clipped()
                            .cornerRadius(Layout.BorderRadius.nanoSpacing)
                    }
                }
                
                VStack(spacing: Layout.Spacing.nanoSpacing) {
                    ForEach(viewModel.itemsViewModels) { itemViewModel in
                        RestaurantSubMenuItemSwiftUIView(viewModel: itemViewModel)
                    }
                }
                .padding(.top, Layout.Insets.customPadding.top)
                .padding(.leading, Layout.Insets.customPadding.leading)
                .padding(.trailing, Layout.Insets.customPadding.trailing)
                .padding(.bottom, Layout.Insets.customPadding.bottom)
            }
        }
        .padding(.top, Layout.Insets.atomPadding.top)
        .padding(.leading, Layout.Insets.atomPadding.leading)
        .padding(.trailing, Layout.Insets.atomPadding.trailing)
        .padding(.bottom, Layout.Insets.atomPadding.bottom)
        .background(backgroundColor)
    }
}

protocol RestaurantSubMenuSwiftUIViewModeling: ObservableObject {
    var title: String { get }
    var description: String { get }
    var backgroundImage: UIImage? { get }
    var itemsViewModels: [RestaurantSubMenuItemSwiftUIViewModel] { get }
}

class RestaurantSubMenuSwiftUIViewModel: RestaurantSubMenuSwiftUIViewModeling, Identifiable {
    let id: UUID = .init()
    @Published var title: String
    @Published var description: String
    @Published var backgroundImage: UIImage?
    @Published var itemsViewModels: [RestaurantSubMenuItemSwiftUIViewModel]
    
    init(title: String, description: String, backgroundImage: UIImage?, itemsViewModels: [RestaurantSubMenuItemSwiftUIViewModel]) {
        self.title = title
        self.description = description
        self.backgroundImage = backgroundImage
        self.itemsViewModels = itemsViewModels
    }
    
    init(response: RestauranteSubMenu) {
        self.title = response.title ?? .init()
        self.description = response.description ?? .init()
        self.backgroundImage = UIImage(named: response.backgroundImageName ?? .init())
        self.itemsViewModels = response.items?.enumerated().map {
            RestaurantSubMenuItemSwiftUIViewModel(response: $0.element, side: $0.offset%2 == 0 ? .right : .left )
        } ?? []
    }
}

#Preview {
    let viewModel = RestaurantSubMenuSwiftUIViewModel(
        title: "Teste title",
        description: "Teste description",
        backgroundImage: nil,
        itemsViewModels: []
    )
    return RestaurantSubMenuSwiftUIView(backgroundColor: .black, viewModel: viewModel)
}
