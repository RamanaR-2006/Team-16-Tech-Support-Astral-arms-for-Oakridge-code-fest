//
//  ContentView.swift
//  AstralArms
//
//  Created by Testuser on 20/01/24.
//

import SwiftUI


public let Navy = Color(red: 15/255, green: 32/255, blue: 99/255)
public let LightBlue = Color(red: 26/255, green: 226/255, blue: 233/255)
public let Pluie = Color(red: 100/255, green: 119/255, blue: 108/255)

struct ContentView: View {
    var body: some View {
        TabView{
            
            AddView().tabItem {
                Label("Add Experiment", systemImage: "plus")
            }
            
            PrepareView().tabItem {
                Label("Prepare Experiment", systemImage: "pencil.and.list.clipboard")
                
            }
            
            ScheduleView().tabItem {
                Label("Schedule Experiment", systemImage: "calendar")
                
            }
            
            
        }
    }
}
    
    #Preview {
        ContentView()
    }

