//
//  ToDoListItemView.swift
//  ToDoListApp
//
//  Created by Ameni Guedouar on 16.08.23.
//

import SwiftUI

struct ToDoListItemView: View {
    let item: ToDoListItem
    @StateObject var viewModel = ToDoListItemViewModel()

    var body: some View {
        HStack {
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .font(item.isDone ? .body.bold() : .body)
                    .strikethrough(item.isDone)
                    .onTapGesture {
                        viewModel.toggleIsDone(item: item)
                    }

                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))

            }


            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)

                    

            }

        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123", title: "Do the laundry", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: true))
    }
}
