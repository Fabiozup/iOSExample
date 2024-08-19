//
//  RestaurantMenuSwiftUIView.swift
//  iOSExample
//
//  Created by Fabio Moreira Duarte on 17/06/24.
//

import SwiftUI

struct RestaurantMenuSwiftUIViewLayout {
    enum Spacing {
        static let bigSpacing: CGFloat = 50
    }
    
    enum Insets {
        static let contentPadding: EdgeInsets = .init(top: 10, leading: 20, bottom: 5, trailing: 20)
    }
}

struct RestaurantMenuSwiftUIView<ViewModel>: View where ViewModel: RestaurantMenuSwiftUIViewModeling {
    typealias Layout = RestaurantMenuSwiftUIViewLayout
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: Layout.Spacing.bigSpacing) {
                MenuTopSwiftUIView(viewModel: viewModel.menuTopViewModel)
                ForEach(viewModel.subMenuViewModels) { subMenuViewModel in
                    RestaurantSubMenuSwiftUIView(viewModel: subMenuViewModel)
                }
            }
            .padding(Layout.Insets.contentPadding)
        }
        .background(Color.black)
    }
}

protocol RestaurantMenuSwiftUIViewModeling: ObservableObject {
    var menuTopViewModel: MenuTopSwiftUIViewModel { get }
    var subMenuViewModels: [RestaurantSubMenuSwiftUIViewModel] { get }
}

class RestaurantMenuSwiftUIViewModel: RestaurantMenuSwiftUIViewModeling, Identifiable {
    let id: UUID = .init()
    
    @Published var menuTopViewModel: MenuTopSwiftUIViewModel
    @Published var subMenuViewModels: [RestaurantSubMenuSwiftUIViewModel]
    
    init(response: RestaurantMenuResponse) {
        menuTopViewModel = MenuTopSwiftUIViewModel(response: response)
        subMenuViewModels = response.subMenus?.map {
            RestaurantSubMenuSwiftUIViewModel(response: $0)
        } ?? []
    }
    
    init() {
        self.menuTopViewModel = MenuTopSwiftUIViewModel(title: .init(), description: .init())
        self.subMenuViewModels = []
    }
    
    func setup(response: RestaurantMenuResponse) {
        menuTopViewModel = MenuTopSwiftUIViewModel(response: response)
        subMenuViewModels = response.subMenus?.map {
            RestaurantSubMenuSwiftUIViewModel(response: $0)
        } ?? []
    }
}

#Preview {
    let response: RestaurantMenuResponse = RestaurantMenuResponse.mock
    let viewModel = RestaurantMenuSwiftUIViewModel(response: response)
    return RestaurantMenuSwiftUIView(viewModel: viewModel)
}
