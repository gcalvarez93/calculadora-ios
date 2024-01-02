//
//  VerticalButtonStack.swift
//  CalculadoraiOS
//
//  Created by Gabriel Castro on 2/1/24.
//

import SwiftUI

struct VerticalButtonStack: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let data: [KeyboardButton]
    let columns: [GridItem]
    let width: CGFloat
    
    init(viewModel: ViewModel,
         data:[KeyboardButton],
         columns: [GridItem],
         width: CGFloat) {
        self.viewModel = viewModel
        self.data = data
        self.columns = columns
        self.width = width
    }
            
    var body: some View {
        LazyVGrid(columns: columns,
                  spacing: 12) {
            ForEach(data, id: \.self) { model in
                Button(action: {
                    viewModel.logic(key: model)
                }, label: {
                    if model.doubleWidth {
                        Rectangle()
                            .foregroundColor(model.backgroundColor)
                            .overlay(Text(model.title)
                                        .font(.largeTitle)
                                        .offset(x: 0 - (width * 0.22 * 0.5)))
                            .frame(width: width * 2 * 0.22,
                                   height: width * 0.22)
                    } else {
                        Text(model.title)
                            .font(.largeTitle)
                            .frame(width: width * 0.22,
                                   height: width * 0.22)
                    }
                })
                .foregroundColor(model.textColor)
                .background(model.backgroundColor)
                .cornerRadius(width * 0.25)
            }
        }
        .frame(width: width)
    }
}

struct VerticalButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VerticalButtonStack(
                viewModel: ViewModel(),
                data: Matrix.firstSectionData,
                columns: Matrix.firstSectionGrid(390 * 0.25),
                width: 390)
            .previewLayout(.sizeThatFits)

            VerticalButtonStack(
                viewModel: ViewModel(),
                data: Matrix.secondSectionData,
                columns: Matrix.secondSectionGrid(390 * 0.25),
                width: 390)
            .previewLayout(.sizeThatFits)
        }
    }
}
