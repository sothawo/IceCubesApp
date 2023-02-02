//
//  TestView.swift
//  IceCubesApp
//
//  Created by Peter-Josef Meisch on 02.02.23.
//

import Env
import SwiftUI

struct TestView: View {
  
  @State private var readerView = true
  @State private var hideOpenAI = true
  @State private var preferredBrowser = PreferredBrowser.safari
  
    var body: some View {
      NavigationStack {
        Form {
            Section("Other") {
              if !ProcessInfo.processInfo.isiOSAppOnMac {
                Picker(selection: $preferredBrowser) {
                  ForEach(PreferredBrowser.allCases, id: \.rawValue) { browser in
                    switch browser {
                    case .inAppSafari:
                      Text("settings.general.browser.in-app").tag(browser)
                    case .safari:
                      Text("settings.general.browser.system").tag(browser)
                    }
                  }
                } label: {
                  Label("settings.general.browser", systemImage: "network")
                }
                if(preferredBrowser == PreferredBrowser.inAppSafari) {
                  Toggle(isOn: $readerView) {
                    Label("In-App Browser Reader View", systemImage: "doc.plaintext")
                  }
                }
              }
              Toggle(isOn: $hideOpenAI) {
                Label("settings.other.hide-openai", systemImage: "faxmachine")
              }
            }
        }
        .scrollContentBackground(.hidden)
        .navigationTitle(Text("Settings"))
        .navigationBarTitleDisplayMode(.inline)
      }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
