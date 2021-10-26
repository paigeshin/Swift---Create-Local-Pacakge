//
//  ContentView.swift
//  paige_local_pacakge
//
//  Created by innertainment00 on 2021/10/26.
//

import SwiftUI
import CalculatorCore

struct ContentView: View {
    @State var number1 = ""
    @State var op = "+"
    @State var number2 = ""

    var body: some View {
        VStack {
            TextField("Number 1", text: $number1)
                .keyboardType(.numberPad)
                .padding(10)
                .cornerRadius(5)
            Picker("Operator", selection: $op) {
                ForEach(["+", "-", "*", "/"], id: \.self) { op in
                    Text(op)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            TextField("Number 2", text: $number2)
                .keyboardType(.numberPad)
                .padding(10)
                .cornerRadius(5)
            Divider()
            Text("Result: " + result)
                .padding(10)
        }
        .padding(20)
    }

    var result: String {
        guard let num1 = Double(number1) else {
            return number1 + " is not a valid number"
        }
        guard let num2 = Double(number2) else {
           return number2 + " is not a valid number"
        }
        // Force unwrap the operator for now,
        // as we can be sure that we only added known ones
        let op = Operator(rawValue: self.op)!
        let result = calculate(number1: num1, op: op, number2: num2)
        return result.description
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
