//
//  TurnOnNotificationsScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct TurnOnNotificationsScene: View {
    var body: some View {
		ZStack{
			VStack{
				Image("notification").resizable()
					.frame(width: 120, height: 120)
					.clipShape(Circle())
				TitleText("Turn on notifications")
				BodyText("Star is a community messaging app.  For the best experience, turn on notifications so you don't miss messages")
				Spacer()
				DefaultButton(title: "Turn on Notifications"){}
				DefaultButton(title: "Skip for now"){}
			}.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
		}
    }
}

struct TurnOnNotificationsScene_Previews: PreviewProvider {
    static var previews: some View {
        TurnOnNotificationsScene()
    }
}
