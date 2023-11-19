//
//  SplashView.swift
//  Doctor-Appointment-swiftui
//
//  Created by Ahmed Yamany on 12/11/2023.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel = SplashViewModel()
    ///
    var body: some View {
        VStack {
            splashPagesView
            controlView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.doapMainBackground)
        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: viewModel.selectedPage)
        .fullScreenCover(isPresented: $viewModel.skip, content: { LoginView() })
        .task {
            do {
                let splashes = try await viewModel.getSplashes()
                viewModel.splashes = splashes
            } catch {
                // Handel Error Here
            }
        }
    }
    ///
    private var splashPagesView: some View {
        PagesView(viewModel: viewModel)
            .ignoresSafeArea()
    }
    ///
    private var controlView: some View {
        ControlView(viewModel: viewModel)
            .padding(.horizontal, 36)
            .frame(minHeight: UIScreen.main.bounds.height * 0.15)
    }
}
//
private struct PagesView: View {
    @ObservedObject var viewModel = SplashViewModel()
    ///
    var body: some View {
        TabView(selection: $viewModel.selectedPage) {
            ForEach(viewModel.splashes.indices, id: \.self) { index in
                let splash = viewModel.splashes[index]
                PageView(splash: splash)
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}
//
private struct PageView: View {
    let splash: SplashModel
    ///
    var body: some View {
        VStack {
            splashImage
            splashDetails
            Spacer()
        }
        .ignoresSafeArea()
    }
    ///
    private var splashImage: some View {
        Image(splash.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(maxHeight: .infinity)
    }
    ///
    private var splashDetails: some View {
        VStack(spacing: 16) {
            Text(splash.title)
                .font(.h3)
                .foregroundStyle(.doapMain)
            Text(splash.subTitle)
                .font(.regular)
                .foregroundStyle(.doap500)
                .multilineTextAlignment(.center)
        }
        .frame(minHeight: UIScreen.main.bounds.height * 0.1)
        .padding(.horizontal, 32)
    }
}
//
private struct ControlView: View {
    @ObservedObject var viewModel = SplashViewModel()
    ///
    var body: some View {
        VStack(spacing: 32) {
            PrimaryButton(title: L10n.Splash.Button.next) {
                viewModel.move()
            }
            ///
            PageControl(numberOfPages: viewModel.splashes.count, selectedPage: $viewModel.selectedPage)
            ///
            NormalButton(title: L10n.Splash.Button.skip) {
                viewModel.skip = true
            }
        }
        .padding(.horizontal, 36)
        .frame(minHeight: UIScreen.main.bounds.height * 0.15)
    }
}
//
#Preview {
    SplashView()
}
