//
//  AstronautDetailView.swift
//  Moonshot
//
//  Created by ebpearls on 26/12/2022.
//

import SwiftUI

struct AstronautDetailView: View {
    // MARK: properties
    @ObservedObject var viewModel: AstronautDetailViewModel
    
    // MARK: body
    var body: some View {
        ScrollView {
            VStack {
                Image(viewModel.astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(viewModel.astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(viewModel.astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let astronauts: [String: Astronaut] = Bundle.main.decode(.astronauts)
        if let astronaut = astronauts["grissom"] {
            AstronautDetailView(viewModel: AstronautDetailViewModel(astronaut: astronaut))
                .preferredColorScheme(.dark)
        }
    }
}
