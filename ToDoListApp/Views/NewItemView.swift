//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by Ameni Guedouar on 16.08.23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool

    var body: some View {
        
        
        NavigationView {
            VStack{
            Form {
                    TextField("Title", text: $viewModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    ZStack(alignment: .leading) {
                        if viewModel.note.isEmpty {
                                       VStack {
                                            Text("Note...")
                                               .padding(.top, 10)
                                                .padding(.leading, 6)
                                                .opacity(0.3)
                                           Spacer()
                                       }
                                    }
                                        TextEditor(text: $viewModel.note)
                                            .frame(minHeight: 50, maxHeight: 100)
                                    
                                }

                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                }
            

            }
            
            

            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer."))
            }
      
        .navigationTitle("Add Note")
            
                .toolbar
            {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save", action: {
                            if viewModel.canSave {
                                                 viewModel.save()
                                                 newItemPresented = false
                                             }
                                                 else {
                                                     viewModel.showAlert = true
                                                 }
                        })
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", action: {
                            newItemPresented = false
                        })
                    }
                
                
                }

    
        }

            }

    
}



struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
        }))
    }
}
