import FirebaseFirestore
import Combine

class ExperimentViewModel: ObservableObject {
    @Published var scheduledExperiments = [ScheduledExperiment]()
    @Published var experimentNames: [String] = []
    private var db = Firestore.firestore()

    init() {
        fetchData()
        fetchExperimentNames()
    }

    func fetchData() {
        db.collection("ScheduledExperiments").addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error fetching documents: \(error.localizedDescription)")
                return
            }

            self.scheduledExperiments = querySnapshot?.documents.compactMap { document -> ScheduledExperiment? in
                try? document.data(as: ScheduledExperiment.self)
            } ?? []
        }
    }
    
    func fetchExperimentNames() {
            let db = Firestore.firestore()
            db.collection("Experiments").getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        if let expName = document.data()["expName"] as? String {
                            self.experimentNames.append(expName)
                        }
                    }
                                    }
            }
        }
    
    func resetExperiments(){
        experimentNames = []
    }
}
