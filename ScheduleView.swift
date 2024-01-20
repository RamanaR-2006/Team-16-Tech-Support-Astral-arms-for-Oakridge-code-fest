//
//  ScheduleView.swift
//  AstralArms
//
//  Created by Testuser on 20/01/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage

struct ScheduleView: View {
    @State var userName: String = ""
    @State var userLocation: String = ""
    @State var userExperiment:String = "Cation Analysis"
    @State var date: Date = Date()
    @ObservedObject var viewModel = ExperimentViewModel()
    let experiments = ["Apple", "Banana", "Cherry"]
    var body: some View {
        
        
        ZStack{
            Color(Navy).ignoresSafeArea()
            Rectangle().frame(width:390,height:710).cornerRadius(40).foregroundColor(.white).padding(50)
            
            ScrollView{
                Spacer()
                Text("Schedule Experiment").font(Font.custom("Nexa-Heavy",size:30))
                Spacer()
                HStack {
                    Rectangle().cornerRadius(30)
                        .frame(width:300,height:50)
                        .foregroundColor(Color(Navy))
                }
                .padding()
                .overlay(TextField("", text: $userName,prompt: Text("Your Name")
                    .foregroundColor(.white)).foregroundColor(.white).padding(.leading, 30.0).font(Font.custom("Nexa-ExtraLight",size:20)))
                Spacer()
                HStack {
                    Rectangle().cornerRadius(30)
                        .frame(width:300,height:50)
                        .foregroundColor(Color(Navy))
                }
                .padding()
                .overlay(TextField("", text: $userLocation,prompt: Text("Your Location")
                    .foregroundColor(.white)).foregroundColor(.white).padding(.leading, 30.0).font(Font.custom("Nexa-ExtraLight",size:20)))
                
                Spacer()
                HStack{
                    Spacer()
                    Text("Select Experiment").font(Font.custom("Nexa-ExtraLight", size: 19))
                    Spacer()
                    ZStack{
                        Rectangle().foregroundColor(Navy).frame(width:110,height:50).cornerRadius(30)
                        Picker("Select an experiment", selection: $userExperiment) {
                            ForEach(viewModel.experimentNames, id: \.self) {
                                Text($0)
                            }
                            }
                    .onAppear{
                        viewModel.resetExperiments()
                        viewModel.fetchExperimentNames()}.background(Color(Navy))
                        
                    }
                    Spacer()
                }.frame(width:300)
                Spacer()
                DatePicker(
                        "Start Date",
                        selection: $date,
                        displayedComponents: [.date]
                ).datePickerStyle(.graphical).frame(width:350,height:300)
                Spacer()
                Rectangle().frame(width:170,height:60).cornerRadius(40).foregroundColor(.blue).overlay(
                    Button(action: {
                        scheduleExperiment()
                        
                    }, label: {
                        Text("Schedule").foregroundColor(.white).font(Font.custom("Nexa-Heavy",size:22))
                    }))
                
                Spacer()
            }.frame(width:390,height:670)
        }
        
    }
    
    private func scheduleExperiment() {
            
            // Construct the product data
            let userExpData: [String: Any] = [
                "userName": self.userName,
                "userLocation": self.userLocation,
                "userExperiment": self.userExperiment,
                "date": self.date,
                
            ]
            
            // Upload product data to Firestore
            let db = Firestore.firestore()
            db.collection("ScheduledExperiments").addDocument(data: userExpData) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    resetForm()
                }
            }
        }
    
    private func resetForm() {
        self.userName = ""
        self.userLocation = ""
        self.userExperiment = ""
        self.date = Date()
    }
        
}

#Preview {
    ScheduleView()
}
