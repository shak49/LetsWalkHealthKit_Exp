//
//  ContentView.swift
//  LetsWalkHealthKit_Exp
//
//  Created by Shak Feizi on 8/11/22.
//

import SwiftUI
import HealthKit


struct ContentView: View {
    private var healthStore: HealthStore?
    @State private var steps: [Step] = []
    
    init() {
        healthStore = HealthStore()
    }
    
    var body: some View {
        NavigationView {
            List(self.steps, id: \.id) { step in
                VStack(alignment: .leading) {
                    Text("\(step.count)")
                    Text(step.date, style: .date)
                        .opacity(0.5)
                }
            }
            .listStyle(.plain)
            .navigationBarTitle(Text("Steps"))
        }
            .onAppear {
                if let healthStore = healthStore {
                    healthStore.requestAuthorization { success in
                        if success {
                            healthStore.calculateSteps { statisticsCollection in
                                if let statisticsCollection = statisticsCollection {
                                    updateUIFromStatistics(from: statisticsCollection)
                                }
                            }
                        }
                    }
                }
            }
    }
    
    private func updateUIFromStatistics(from statisticsCollection: HKStatisticsCollection) {
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let endDate = Date()
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            let step = Step(count: Int(count ?? 0.0), date: statistics.startDate)
            self.steps.append(step)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
