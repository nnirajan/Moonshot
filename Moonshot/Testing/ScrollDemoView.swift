//
//  ScrollDemoView.swift
//  Moonshot
//
//  Created by ebpearls on 22/12/2022.
//

import SwiftUI

struct CustomTextView: View {
    var text: String
    
    init(text: String) {
        print("Creating Custom Text View \(text)")
        self.text = text
    }
    
    var body: some View {
        Text(text)
    }
}

struct ScrollDemoView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomTextView(text: "Item \($0)")
                        .font(.title)
                 }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollDemoView()
    }
}
