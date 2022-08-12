//
//  GraphView.swift
//  LetsWalkHealthKit_Exp
//
//  Created by Shak Feizi on 8/12/22.
//

import SwiftUI

struct GraphView: View {
    let steps: [Step]
    
    var totalSteps: Int {
        steps.map { $0.count }.reduce(0, +)
    }
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter
    }()
    
    var body: some View {
        VStack {
            HStack(alignment: .lastTextBaseline) {
                ForEach(self.steps, id: \.id) { step in
                    let height = Swift.min(step.count/20, 300)
                    VStack {
                        Text("\(step.count)")
                            .font(.caption)
                            .foregroundColor(.white)
                        Rectangle()
                            .fill(step.count > 1000 ? .green : .red)
                        .frame(width: 20, height: CGFloat(height))
                        Text("\(step.date, formatter: Self.dateFormatter)")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
            }
            Text("Total Steps: \(self.totalSteps)")
                .padding(.top, 100)
                .foregroundColor(.white)
                .opacity(0.5)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
        .cornerRadius(15)
        .padding(15)
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        let steps = [
            Step(count: 3452, date: Date()),
            Step(count: 523, date: Date()),
            Step(count: 5223, date: Date()),
            Step(count: 3841, date: Date()),
            Step(count: 12555, date: Date())
        ]
        GraphView(steps: steps)
    }
}
