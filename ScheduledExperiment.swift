//
//  Experiment.swift
//  AstralArms
//
//  Created by Testuser on 20/01/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseStorage

/*struct ScheduledExperiment: Identifiable{
    var id:String
    var userName: String
    var userLocation: String
    var userExperiment :String
    var date: Date = Date()
    
    
    init(from document: QueryDocumentSnapshot) {
            let data = document.data()
            self.id = document.documentID
            self.userName = data["expName"] as? String ?? ""
            self.userLocation = data["expOrganisation"] as? String ?? ""
            self.userExperiment = data["expDuration"] as? String ?? ""
            self.date = (data["productTime"] as? Timestamp)?.dateValue() ?? Date()
            
        }
}*/


struct ScheduledExperiment: Identifiable, Codable {
    @DocumentID var id: String?
    var date: Date
    var userName: String
    var userLocation: String
    var userExperiment: String
}


