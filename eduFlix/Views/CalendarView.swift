//
//  CalendarView.swift
//  eduFlix
//
//  Created by Reya on 23.04.22.
//

import SwiftUI

struct CalendarView: View {
    @State private var showingSt = false
    @StateObject var vm = CalendarVM()
    @StateObject var cm : CalendarCoreVM = CalendarCoreVM()
    @State var sheetShown:Bool = false
    @State var weatherSheet : Bool = false
    @State var title:String = ""
    
    
    
    
    private var gridColumns = [GridItem(.fixed(40),spacing: 0),
                               GridItem(.fixed(40),spacing: 0),
                               GridItem(.fixed(40),spacing: 0),
                               GridItem(.fixed(40),spacing: 0),
                               GridItem(.fixed(40),spacing: 0),
                               GridItem(.fixed(40),spacing: 0),
                               GridItem(.fixed(40),spacing: 0),
    ]
    
    var body: some View {
        NavigationView {
        GeometryReader { geo in
            ZStack {
                VStack {
                    ZStack {
                        Color("heroColor")
                            .overlay(
                                Image("2")
                                    .resizable()
                                    .frame(width:300,height:250)
                                    .offset(x: 0, y: -30)
                            )
                        
                        VStack {
                            Spacer()
                            HStack {
                                VStack(alignment:.leading,spacing:20){
                                    Text("Welcome back \nSam!")
                                        .textCase(.uppercase)
                                    Text("Ready to study?")
                                        .font(.footnote)
                                }.padding(.all,30)
                                
                                Spacer()
                            }.foregroundColor(.white)
                        }
                    }.frame(height:geo.size.height / 2.5)
                    

                    VStack {
                        HStack {
                            Spacer()
                            
                
                            Button {
                                weatherSheet.toggle()
                                //cm.addDeadline(title: "Test2", date: Date.now)
                            } label: {
                            Image(systemName: "cloud.sun.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.gray)
                                .frame(height:25)
                            } .sheet(isPresented: $weatherSheet) {
                                WeatherView()
                            }
                            Image("calendarIcon")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.orange)
                                .frame(height:25)
                            
                            Image( "filterIcon")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.orange)
                                .frame(height:25)
                            
                            Image( "search")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.orange)
                                .frame(height:25)
                            
                        }.padding(.bottom)
                        kalendarGrid
                    }.padding(.horizontal)
                    
                    
                    if !vm.getDayMonthYearString().isEmpty {
                        ScrollView {
                            Text(vm.getDayMonthYearString())
                                .foregroundColor(.orange)
                            Text("Deadlines")
                            Image(systemName: "exclamationmark")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.red)
                                .frame(height:25)
                            
                            VStack {
                                ForEach(cm.calendarCoreItems.filter({ dl in
                                    dl.date == vm.selectedD
                                })) { item in
                                    HStack {
                                        Circle()
                                            .fill()
                                            .frame(width:5,height:5)
                                        Text(item.heading ?? "")
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:5)
                                            .foregroundColor(.pink)
                                    }
                                }
                            }
                            
                            
                        }
                    }
                    
                    
                    Spacer()
                }.edgesIgnoringSafeArea(.top)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            sheetShown.toggle()
                            //cm.addDeadline(title: "Test2", date: Date.now)
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width:geo.size.width/7)
                                .foregroundColor(Color("heroColor"))
                        }

                    }.padding()
                        .foregroundColor(.blue)
                        //.navigationTitle("calendar")
                    
                    
                }
                
                if sheetShown {
                    VStack {
                        Spacer()
                        DeadlineView(dateString: vm.getDayMonthYearString(), addAction: {
                            cm.addDeadline(title: title, date: vm.selectedD)
                        }, title: $title, isPresented: $sheetShown)
                    }.transition(.move(edge: .bottom))
                }
                
            }
        }

        
        }
    }
}

extension CalendarView {

    private var kalendarGrid : some View {
        
        
        VStack(alignment:.trailing) {
            HStack(spacing:0){
                HStack {
                    Text(vm.getMonthYearString())
                        .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
                    
                }.frame(width:280)
                    .padding(.bottom)
                HStack(spacing:20) {
                    Button {
                        vm.moveDate(past: true)
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(height:17)
                            .foregroundColor(.black)
                    }
                    
                    Button {
                        vm.moveDate(past: false)
                    } label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(height:17)
                            .foregroundColor(.black)
                    }
                }
            }
            LazyVGrid(columns: gridColumns,spacing: 0) {
                Group {
                    Text("Mo")
                        .fontWeight(.bold)
                    Text("Tu")
                        .fontWeight(.bold)
                    Text("We")
                        .fontWeight(.bold)
                    Text("Th")
                        .fontWeight(.bold)
                    Text("Fr")
                        .fontWeight(.bold)
                    Text("Sa")
                        .fontWeight(.bold)
                    Text("Su")
                        .fontWeight(.bold)
                }
                    .padding(.bottom)
                    .font(.system(size: 14))
                
                ForEach(vm.calendar) { it in
                    Button {
                        vm.selectDate(item: it)
                    } label: {
                        Rectangle()
                            .strokeBorder(.gray)
                            .opacity(0.4)
                            .background(
                                Text("\(it.weekDay)")
                                    .fontWeight(vm.isCurrentMonth(item1: it) ? .bold : .regular)
                                    .opacity(vm.isCurrentMonth(item1: it) ? 1 : 0.5)
                                    .foregroundColor(it.isSelected ? .white : .black)
                                    .font(.caption)
                            )
                            .background(
                                Rectangle()
                                    .fill(.blue)
                                    .opacity(it.isSelected ? 1 : 0)
                            )
                            .frame(height:40)
                    }
                }
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}



