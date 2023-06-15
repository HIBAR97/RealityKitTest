//
//  ARView.swift
//  RealityKitTest
//
//  Created by Kim Andrew on 2023/06/15.
//

import SwiftUI
import RealityKit

struct ARview: UIViewRepresentable {
   
    @ObservedObject var Num : Count
    
    func makeUIView(context : Context) -> ARView {
        return ARView(frame: .zero)
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        updateCnt(uiView: uiView)
    }
    
    private func updateCnt(uiView: ARView){
        uiView.scene.anchors.removeAll()
        
        let anchor = AnchorEntity()
        
        //가져온 숫자를 3D로 만듦
        //절대값으로 만들도록 abs()사용
        let num = MeshResource.generateText("\(abs(Num.Counter))", extrusionDepth: 0.1, font: .systemFont(ofSize: 1, weight: .bold))
        
        let textColor : UIColor
        
        //숫자에 따라 색상이 변화
        switch Num.Counter {
            case let n where n < 0:
                textColor = .red
            case let n where n > 0:
                textColor = .blue
            default:
                textColor = .black
        }
        
        //생성될 엔티티의 모양을 선언
        let shader = SimpleMaterial(color: textColor, roughness: 5, isMetallic: true)
        
        //엔티티를 생성
        let Entity = ModelEntity(mesh: num, materials: [shader])
        
        //위치를 지정 위로 올림
        Entity.position.z -= 1
        Entity.setParent(anchor)
        //스크린에 엔티티를 적용합니다.
        uiView.scene.addAnchor(anchor)
    }
}
