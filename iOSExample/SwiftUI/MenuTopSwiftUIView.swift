//
//  MenuTopSwiftUIView.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 17/06/24.
//

import SwiftUI

struct MenuTopSwiftUIViewLayout {
    enum Spacing {
        static let smallSpacing: CGFloat = 12
    }
    
    enum Size {
        static let mediumSize: CGSize = .init(width: 60, height: 60)
    }
    
    enum Insets {
        static let atomPadding: EdgeInsets = .init(top: 2, leading: 2, bottom: -2, trailing: -2)
    }
}

struct MenuTopSwiftUIView<ViewModel>: View where ViewModel: MenuTopSwiftUIViewModeling {
    typealias Layout = MenuTopSwiftUIViewLayout
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: Layout.Spacing.smallSpacing) {
            if let imageLogo = viewModel.imageLogo {
                Image(uiImage: imageLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: Layout.Size.mediumSize.width, height: Layout.Size.mediumSize.height)
            }
            Text(viewModel.description)
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            Text(viewModel.title)
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .padding(Layout.Insets.atomPadding)
        .background(Color.clear)
    }
}

protocol MenuTopSwiftUIViewModeling: ObservableObject {
    var title: String { get }
    var description: String { get }
    var imageLogo: UIImage? { get }
}

class MenuTopSwiftUIViewModel: ObservableObject, MenuTopSwiftUIViewModeling, Identifiable {
    let id: UUID = .init()
    @Published var title: String
    @Published var description: String
    @Published var imageLogo: UIImage?
    
    init(title: String, description: String, imageLogo: UIImage? = nil) {
        self.title = title
        self.description = description
        self.imageLogo = imageLogo
    }
    
    init(response: RestaurantMenuResponse) {
        title = response.title ?? .init()
        description = response.description ?? .init()
        imageLogo = UIImage(named: response.imageName ?? .init())
    }
}

#Preview {
    let response: RestaurantMenuResponse = RestaurantMenuResponse.mock
    let viewModel = MenuTopSwiftUIViewModel(response: response)
    return MenuTopSwiftUIView(viewModel: viewModel)
}
