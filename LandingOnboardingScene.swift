//
//  LandingOnboardingScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct LandingOnboardingScene: View {
    var body: some View {
		ZStack{
			
			VStack {
				TitleText("Bent")
				Spacer()
				BodyText("Find Your Queer Communities")
				Spacer()
				Spacer()
				BodyText("By signing up, I agree I'm 18 or odler, and to the Terms of Use & Privacy Policy")
				DefaultButton(title: "Sign up"){}
				DefaultButton(title: "Log in"){}
			}
		}.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))

	}
}

struct LandingOnboardingScene_Previews: PreviewProvider {
    static var previews: some View {
        LandingOnboardingScene()
    }
}
