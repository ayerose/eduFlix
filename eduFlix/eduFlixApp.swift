//
//  eduFlixApp.swift
//  eduFlix
//
//  Created by Reya on 09.04.22.
//

import SwiftUI


@main


struct eduFlixApp: App {
    
    
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
        
    @State var selection: Tab = .home
    
    var body: some Scene {
        WindowGroup {

            if(isLoggedIn) {
                TabView(selection: $selection) {
                    
                    HomeView(selection: $selection)
                        .tabItem {
                            Label("Home", systemImage: "house")
                            Text("Home")
                        }.tag(Tab.home)
                    
                    NavigationView { ToDoFinalView() }
                    .tabItem {
                        Label("ToDos", systemImage: "checklist")
                        Text("Discover")
                    }
                    .tag(Tab.todos)
                    
                    NavigationView { NotesView() }
                    .environmentObject(ImageData())
                    .tabItem {
                        Label("Notes", systemImage: "note.text")
                        //   .environmentObject(imagaData())
                    }
                    .tag(Tab.notes
                    )
                    NavigationView { ProfileView()}
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                    .tag(Tab.profile)
                    
                    NavigationView { ContentView(card: Card.example) }
                    
                    .tabItem { Label("Flashcards", systemImage: "menucard") }
                    .tag(Tab.flashcards)
                    .navigationBarHidden(true)
                   
                    
                    .onAppear {
                            AppDelegate.orientationLock = UIInterfaceOrientationMask.landscapeLeft
                            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                            UINavigationController.attemptRotationToDeviceOrientation()
                        }
                        .onDisappear {
                            DispatchQueue.main.async {
                                AppDelegate.orientationLock = UIInterfaceOrientationMask.portrait
                                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                                UINavigationController.attemptRotationToDeviceOrientation()
                            }
                        }
                }
                .accentColor(.orange)
                

            } else {
                LoginView()
            }
        }
        
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.portrait

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return eduFlix.AppDelegate.orientationLock
    }
    
   
}
