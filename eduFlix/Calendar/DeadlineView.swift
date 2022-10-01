//
//  DeadlineView.swift
//  eduFlix
//
//  Created by Reya on 24.04.22.
//

import SwiftUI

struct DeadlineView: View {
    let dateString:String
    //
    let addAction: () -> Void
    
    @Binding var title : String
    @Binding var isPresented:Bool
    
    var body: some View {
        ZStack {
            CustomShape(corners: [.topLeft,.topRight], radius: 30)
                    .fill(.white)
                .shadow(radius: 10)
            VStack {
                headerSection
    
                myTextField
                
                HStack(spacing:30) {
                    addDeadlineButton
                    cancelButton
                }
                
            }.padding()
        }.frame(height:UIScreen.main.bounds.height / 2.5)
            .padding(.vertical)
    }
}

extension DeadlineView {
    private var cancelButton: some View {
        Button {
            withAnimation(.easeInOut) {
                self.isPresented.toggle()
            }
            
        } label: {
            Capsule()
                .fill(.gray)
                .frame(width:UIScreen.main.bounds.width / 2.5,height:40)
                .overlay(
                    Text("Cancel")
                        .foregroundColor(.white)
                )
                .shadow(color: .gray, radius: 10, x: 0, y: 5)
        }
    }
    private var addDeadlineButton : some View {
        Button {
            addAction()
            title = ""
        } label: {
            Capsule()
                .fill(.orange)
                .frame(width:UIScreen.main.bounds.width / 2.5,height:40)
                .overlay(
                    Text("Add")
                        .foregroundColor(.white)
                )
                .shadow(color: .gray, radius: 10, x: 0, y: 5)
        }
    }
    
    private var headerSection: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation(.easeInOut) {
                            self.isPresented.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width:30)
                            .foregroundColor(.gray)
                            .opacity(0.7)
                    }

                }
                Spacer()
            }
            VStack(spacing:20) {
                Text("New Deadline")
                    .font(.system(size: 45))
                Text(dateString)
                    .font(.system(size: 20))
            }.foregroundColor(.orange)
        }
    }
    
    private var myTextField : some View {
        TextField("Enter title here...", text: $title)
            .padding()
            .background(
                Rectangle()
                    .strokeBorder(.gray)
            )
            .padding(30)
    }
}

struct NDeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        DeadlineView(dateString: "18th December 2021", addAction: {
            print("action pressed")
        }, title: .constant("Temp"), isPresented: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}


struct CustomShape : Shape {
    
    let corners: UIRectCorner
        let radius: CGFloat
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    
    
}

