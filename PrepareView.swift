//
//  PrepareView.swift
//  AstralArms
//
//  Created by Testuser on 20/01/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct PrepareView: View {
    @ObservedObject var viewModel = ExperimentViewModel()

    var body: some View {
        ZStack{
            
            NavigationView{
                
                List(viewModel.scheduledExperiments) { experiment in
                    NavigationLink(destination: ExperimentDetailView(experimentName: experiment.userExperiment)) {
                        VStack(alignment: .leading) {
                            Text("User: \(experiment.userName)").font(Font.custom("Nexa-ExtraLight",size:20))
                            Text("Experiment: \(experiment.userExperiment)")
                            Text("Date: \(experiment.date, formatter: itemFormatter)")
                            Text("Location: \(experiment.userLocation)")
                            
                        }
                    }
                }.navigationTitle(Text("Scheduled").font(.subheadline))
            }.background(Color(Navy))
        }
    }
    
    

        private var itemFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = .short
            return formatter
        }
        }

#Preview {
    PrepareView()
}


