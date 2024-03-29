//
//  ContentView.swift
//  Calculator
//
//  Created by Deep Thought on 2023/3/6.
//

import SwiftUI

let scale: CGFloat = UIScreen.main.bounds.width/414
struct ContentView: View {
    var body: some View{
        VStack(spacing:12){
            Spacer()
            Text("123454656576778866")
                .font(.system(size: 76))
                .minimumScaleFactor(0.5)
                .padding(.trailing,24)
                .lineLimit(1)
                .frame(minWidth: 0,maxWidth: .infinity,alignment: .trailing)
                .padding(.bottom)
            CalculatorButtonPad()
        }
        .scaleEffect(scale)
        
    }
 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
//            ContentView().previewDevice("iPhone SE")
        }
    }
}

struct CalculatorButton: View {
    let fontSize : CGFloat = 38
    let title : String
    let size : CGSize
    let backgroundColorName : String
    let isCommand : Bool
    let action : ()->Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(isCommand ? Color("commandText"): .white)
                .frame(width: size
                    .width,height: size.height)
                .background(Color(backgroundColorName))
                .cornerRadius(size.width/2)
                
        }
    }
}
struct CalculatorButtonRow: View {
    let row:[CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row,id: \.self) { item in
                CalculatorButton(title: item.title, size: item.size, backgroundColorName: item.backgroundColorName,isCommand: item.isCommand) {
                    print("Button:\(item.title)")
                }
            }
            
        }
            
    }
}
struct CalculatorButtonPad: View {
    let pad: [[CalculatorButtonItem]] = [
        [.command(.clear), .command(.flip),
         .command(.percent), .op(.divide)],
        [.digit(7), .digit(8), .digit(9), .op(.multiply)],
        [.digit(4), .digit(5), .digit(6), .op(.minus)],
        [.digit(1), .digit(2), .digit(3), .op(.plus)],
        [.digit(0), .dot, .op(.equal)]
    ]
    var body: some View {
        VStack(spacing:8){
            ForEach(pad,id:\.self) { row in
                CalculatorButtonRow(row: row)
            }
        }
    }
}
    
