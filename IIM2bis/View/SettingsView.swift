//
//  SettingsView.swift
//  IIM2bis
//
//  Created by Djino Dissingar on 14/04/2023.
//

import SwiftUI

struct SettingsView: View {
    @StateObject var userVm : UserViewModel
    var body: some View {
        Text(userVm.user?.mail ?? "")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(userVm: UserViewModel(id: FirebaseManager().getId()))
    }
}
