//
//  GridDemoView.swift
//  Moonshot
//
//  Created by ebpearls on 23/12/2022.
//

import SwiftUI

struct GridDemoView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView() {
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Grid \($0)")
                }
            }
        }
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Grid \($0)")
                }
            }
        }
    }
}

struct GridDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GridDemoView()
    }
}
