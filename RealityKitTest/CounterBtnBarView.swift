//
//  CounterBtnBarView.swift
//  RealityKitTest
//
//  Created by Kim Andrew on 2023/06/15.
//

import SwiftUI

//화면 아래 사용될 -,리셋,+ 버튼
struct CounterBtnBarView: View {
    
    //Count class 안에 있는 변수 가져옴
    var cnt : Count
    
    var body: some View {
        
        HStack{
            
            //- 버튼
            Button {
                cnt.Counter -= 1
                print("- Tapped => \(cnt.Counter)")
            } label: {
                Image(systemName: "minus")
            }
            
            Spacer()
                .frame(width: 100)
            
            //리셋 버튼
            Button {
                cnt.Counter = 0
                print("Reset => \(cnt.Counter)")
            } label: {
                Image(systemName: "0.circle")
            }
            
            Spacer()
                .frame(width: 100)
            
            //+ 버튼
            Button {
                cnt.Counter += 1
                print("+ Tapped => \(cnt.Counter)")
            } label: {
                Image(systemName: "plus")
            }
        }
        .font(.system(size: 30))
        //Screen의 너비를 가져오는데 이렇게하면 visionOS HIG에 맞지 않음
        .frame(width: UIScreen.main.bounds.width,  height: 80)
    }
}

