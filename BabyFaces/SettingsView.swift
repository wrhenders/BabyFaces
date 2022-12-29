//
//  SettingsView.swift
//  BabyFaces
//
//  Created by Ryan Henderson on 12/29/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var settings: SettingsModel
    var body: some View {
        List {
            Section(header: Text("Settings")) {
                Toggle("Sound on", isOn: $settings.soundOn)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            SettingsView(settings: .constant(SettingsModel()))
        }
    }
}
