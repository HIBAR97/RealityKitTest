//
//  ContentView.swift
//  RealityKitTest
//
//  Created by Kim Andrew on 2023/06/15.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    
    var counterNum = Count()
    
    var body: some View {
        
        //기본 컨테이너
//        ARViewContainer().edgesIgnoringSafeArea(.all)
        
        ZStack{
            ARview(Num: counterNum)
            VStack{
                Spacer()
                //메뉴바 소환
                CounterBtnBarView(cnt: counterNum)
            }
        }
        //전체화면처럼 보이기 위해 세이프에리어는 제외합니다.
        .edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
