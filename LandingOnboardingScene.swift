//
//  LandingOnboardingScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct LandingOnboardingScene: View {
	var body: some View {
		NavigationView{
			ZStack{

				VStack {
					TitleText("Bent")
					Spacer()
					BodyText("Find Your Queer Communities")
					Spacer()
					Spacer()
					HStack(spacing: 0){CaptionText("By signing up, I agree I'm 18 or older, and to the")}
					HStack(spacing: 0){
						CaptionText("Terms of Use").underline()
						CaptionText(" & ")
						CaptionText("Privacy Policy").underline()

					}
					NavigationLink(destination: EnterInviteCodeScene()) {
						LabelButtonBlue("Sign up")
					}
					.padding()
					LabelButtonTransparent("Log in")

				}
			}.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
		}
	}
}

struct LandingOnboardingScene_Previews: PreviewProvider {
    static var previews: some View {
        LandingOnboardingScene()
    }
}
