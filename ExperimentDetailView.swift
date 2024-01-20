//
//  ExperimentDetailView.swift
//  AstralArms
//
//  Created by Testuser on 20/01/24.
//

import Foundation
import SwiftUI
import FirebaseFirestore

struct ExperimentDetailView: View {
    let experimentName: String
    @State private var experimentDetails: ExperimentDetails?

    var body: some View {
        VStack {
            if let details = experimentDetails {
                ZStack{
                    Color(Navy).ignoresSafeArea()
                    VStack{
                        Spacer()
                        Text("Experiment Name: \(details.expName)").font(Font.custom("Nexa-Heavy",size:30)).padding(.trailing)
                        Spacer()
                        Text("Organisation: \(details.expOrganisation)").font(Font.custom("Nexa-ExtraLight",size:20)).padding(.trailing)
                        Spacer()
                        Text("Materials: \(details.expMaterials)").font(Font.custom("Nexa-ExtraLight",size:20)).padding(.trailing)
                        Spacer()
                        Text("Procedure: \(details.expProcedure)").font(Font.custom("Nexa-ExtraLight",size:20)).padding(.trailing)
                        Spacer()
                        Text("Precautions: \(details.expPrecautions)").font(Font.custom("Nexa-ExtraLight",size:20)).padding(.trailing)
                        Spacer()
                    }.foregroundColor(.white).frame(width:350,height:850)
                }
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            fetchExperimentDetails()
        }
    }

    private func fetchExperimentDetails() {
        let db = Firestore.firestore()
        db.collection("Experiments")
          .whereField("expName", isEqualTo: experimentName)
          .getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }
            
            let experiments = querySnapshot?.documents.compactMap { document -> ExperimentDetails? in
                try? document.data(as: ExperimentDetails.self)
            }
            self.experimentDetails = experiments?.first
        }
    }
}

struct ExperimentDetails: Identifiable, Codable {
    var id: String?
    var expName: String
    var expDuration: String
    var expOrganisation:String
    var expProcedure: String
    var expMaterials: String
    var expPrecautions:String
   
}

