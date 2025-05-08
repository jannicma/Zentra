//
//  DoubleEdit.swift
//  Zentra
//
//  Created by Jannic Marcon on 08.05.2025.
//

import SwiftUI
import Foundation

struct LabeledNumberField: View {
    let label: String
    @Binding var value: Double
    let labelWidth: Float

    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
        HStack {
            Text(label + ":")
                .frame(width: CGFloat(labelWidth), alignment: .leading)

            TextField("", value: $value, formatter: numberFormatter)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
        }
    }
}


#Preview {
    @Previewable @State var sampleAmount: Double = 123.45
    return LabeledNumberField(label: "Amount", value: $sampleAmount, labelWidth: 80)
}
