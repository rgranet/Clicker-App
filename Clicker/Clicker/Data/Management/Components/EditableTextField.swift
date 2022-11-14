//
//  EditableTextField.swift
//  Clicker
//
//  Created by Ruben Granet on 02/08/2022.
//

import SwiftUI

struct EditableTextField: View {
    let label:String
    @Binding var editedText:String
    @State private var isEditable = true
    var body: some View {
        HStack {
            if isEditable {
                TextField(label, text: $editedText)
                    .frame(width: 300.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Image(systemName: "checkmark.square.fill")
                    .onTapGesture {
                        isEditable.toggle()
                    }
            } else {
                Text(editedText)
                    .frame(width: 300.0)
                Image(systemName: "square.and.pencil")
                    .onTapGesture {
                        isEditable.toggle()
                    }
            }
        }
    }
}

struct EditableTextField_Previews: PreviewProvider {
    static var previews: some View {
        EditableTextField(label: "Pseudo", editedText: .constant("Test"))
            .previewLayout(.sizeThatFits)
        
    }
}
