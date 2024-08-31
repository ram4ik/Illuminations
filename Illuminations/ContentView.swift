//
//  ContentView.swift
//  Illuminations
//
//  Created by test on 8/31/24.
//

import SwiftUI

@Observable
class Illumination {
    var isOn: Bool = false
}

struct MyView: View {
    @Bindable var lightBackground: Illumination
    var body: some View {
        VStack {
            Spacer()
            Toggle(isOn: $lightBackground.isOn) {
                Text("Lights")
            }.fixedSize()
        }
    }
}

struct ContentView: View {
    @State private var light = Illumination()
    var body: some View {
        VStack {
            MyView(lightBackground: light)
            if light.isOn {
                Text("On")
            } else {
                Text("Off")
                    .colorInvert()
            }
            Divider()
            Text("Example of bindable var")
                .foregroundStyle(light.isOn ? .primary : Color.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(light.isOn ? Color.white : Color.blue)
    }
}

#Preview {
    ContentView()
}
