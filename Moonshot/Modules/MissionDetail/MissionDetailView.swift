//
//  MissionDetailView.swift
//  Moonshot
//
//  Created by ebpearls on 26/12/2022.
//

import SwiftUI

struct MissionDetailView: View {
    // MARK: properties
    @ObservedObject var viewModel: MissionDetailViewModel
    
    // MARK: body
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Image(viewModel.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.6)
                        .padding(.top)
                    
                    VStack(alignment: .leading) {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(viewModel.mission.description)
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.lightBackground)
                            .padding(.vertical)
                        
                        Text("Crew Members")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.crewMember, id: \.role) { crew in
                                let astronaut = crew.astronaut
                                NavigationLink {
                                    AstronautDetailView(viewModel: AstronautDetailViewModel(astronaut: astronaut))
                                } label: {
                                    HStack {
                                        Image(astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(Capsule())
                                            .overlay(
                                                Capsule()
                                                    .strokeBorder(.white, lineWidth: 1)
                                            )
                                        
                                        VStack(alignment: .leading) {
                                            Text(astronaut.name)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            
                                            Text(crew.role)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(viewModel.mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

struct MissionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let missions: [Mission] = Bundle.main.decode(.missions)
        MissionDetailView(viewModel: MissionDetailViewModel(mission: missions[1]))
            .preferredColorScheme(.dark)
    }
}
