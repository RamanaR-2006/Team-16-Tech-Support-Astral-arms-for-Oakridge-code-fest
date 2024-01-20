//
//  ExperimentVideoView.swift
//  AstralArms
//
//  Created by Testuser on 20/01/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct ExperimentVideoView: View{
    var body: some View{
        ZStack{
            Color(Navy).ignoresSafeArea()
            VStack{
                Spacer()
                Text("Your Experiment!").font(Font.custom("Nexa-Heavy",size:30)).foregroundColor(.white)
                Spacer()
                WebView(url: URL(string: "http://10.212.65.69:5000/video")!)
                    .frame(width:400,height:400)
                Spacer()
                ZStack{
                    Rectangle().frame(width:370,height:210).cornerRadius(30).foregroundColor(.white)
                    VStack{
                        Text("Procedure").font(Font.custom("Nexa-Heavy",size:20)).foregroundColor(Color(Navy))
                        Text("1. Prepare a 0.1M solution of NaHCO3 in a 50cc beaker").font(Font.custom("Nexa-Heavy",size:18)).foregroundColor(.black)
                        Text("2. Take a 2cm3 sample of it in a test tube and add Universal Indicator").font(Font.custom("Nexa-Heavy",size:18)).foregroundColor(.black)
                        Text("3. Add Acetic acid drop by drop and record observations").font(Font.custom("Nexa-Heavy",size:18)).foregroundColor(.black)
                    }.frame(width:360,height:200)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ExperimentVideoView()
}

