//
//  EnterInviteCodeScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct EnterInviteCodeScene: View {
	@State private var inviteCodeValue:String = ""
    var body: some View {
		ZStack {
			Color.black
			VStack {
				TitleText("Enter your invite code")
				BodyText("Star requires an invitaiton from an existing community to get started")
				RegistrationTextInput(placeholder: "Enter your invite code...", value: $inviteCodeValue)
				BodyText("No invite? You can sign up to be notified when Star expands Community discovery in the future.")
				DefaultButton(title: "Next"){}
			}
		}.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
    }
}

struct EnterInviteCodeScene_Previews: PreviewProvider {
    static var previews: some View {
        EnterInviteCodeScene()
    }
}
