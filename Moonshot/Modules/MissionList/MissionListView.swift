//
//  MissionListView.swift
//  Moonshot
//
//  Created by ebpearls on 26/12/2022.
//

import SwiftUI

struct MissionListView: View {
    // MARK: properties
    @ObservedObject var viewModel: MissionListViewModel
    
    private let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    // MARK: body
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.missions) { mission in
                        NavigationLink {
                            MissionDetailView(viewModel: MissionDetailViewModel(mission: mission))
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(mission.formattedDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
        .onAppear {
            viewModel.getMissions()
        }
    }
}

struct MissionListView_Previews: PreviewProvider {
    static var previews: some View {
        MissionListView(viewModel: MissionListViewModel())
    }
}
