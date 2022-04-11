//
//  TiendaDeTunaApp.swift
//  TiendaDeTuna
//
//  Created by MacMini on 2/16/22.
//

import SwiftUI
import Firebase

    
    class AppDelegate: NSObject, UIApplicationDelegate {
      func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
        { FirebaseApp.configure()
        print("SwiftU application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
        return true }

      func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
        {print("\(#function)")
        Auth.auth().setAPNSToken(deviceToken, type: .sandbox) }
      
      func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
        {print("\(#function)")
        if Auth.auth().canHandleNotification(notification)
            {completionHandler(.noData)
          return}}
      
      func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool
        { print("\(#function)")
        if Auth.auth().canHandle(url)
            { return true}
        return false} }

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews()
    { navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)}}
    
@main
struct TiendaDeTunaApp: App {
    var order = OrderViewModel()
    var items = [TunaModel]()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init()
    { let navBarAppearance = UINavigationBarAppearance()
navBarAppearance.titleTextAttributes = [.font : UIFont(name: "GillSans", size: 20)!]
navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemBlue ]
navBarAppearance.largeTitleTextAttributes = [.font : UIFont(name: "GillSans", size: 40)!, .foregroundColor: UIColor.systemBlue  ]
navBarAppearance.titleTextAttributes =  [ .foregroundColor: UIColor.systemBlue ]
  UINavigationBar.appearance().standardAppearance = navBarAppearance
   UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
   UINavigationBar.appearance().compactAppearance = navBarAppearance   }

    var body: some Scene {
        WindowGroup {
            GridView(items:items)
            .environmentObject(order)
            
//           ContentView2()
            
              }}}
