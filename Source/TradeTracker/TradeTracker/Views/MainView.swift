//
//  MainView.swift
//  TradeTracker
//
//  Created by John M Cruz on 10/9/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                DashboardView()
            }
            .badge(2)


            Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
                TradesView()
            }


            Tab("Account", systemImage: "person.crop.circle.fill") {
                AccountView()
            }
            .badge("!")
        }
    }
}

#Preview {
    MainView()
}
