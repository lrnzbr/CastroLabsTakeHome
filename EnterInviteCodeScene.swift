//
//  EnterInviteCodeScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct EnterInviteCodeScene: View {
	@State private var inviteCodeValue:String = ""
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>
	
	var body: some View {
		ZStack {
			Color.black
			VStack {
				TitleText("Enter your invite code").padding(.vertical)
				BodyText("Star requires an invitaiton from an existing community to get started").multilineTextAlignment(.center)
				RegistrationTextInput(placeholder: "Enter your invite code...", value: $inviteCodeValue)
				HStack(spacing:0){
					CaptionText("No invite? You can ")
					CaptionText("sign up to be notified").underline()
				}
				CaptionText("when Star expands Community discovery in the future.").multilineTextAlignment(.center)
				Spacer()
				if inviteCodeValue.count > 6 {
					NavigationLink(destination: LetsGetGoingScene() ){ LabelButtonBlue("Next") }
				} else {
					LabelButtonBlue("Next", isDisabled: true)
				}
			}
		}.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: Button(action : {
				self.mode.wrappedValue.dismiss()
			}){
				Image(systemName: "chevron.left").foregroundColor(.white)
			})
			.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
	}
}

struct EnterInviteCodeScene_Previews: PreviewProvider {
    static var previews: some View {
        EnterInviteCodeScene()
    }
}
