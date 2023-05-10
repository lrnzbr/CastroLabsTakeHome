//
//  VerifyingSelfieScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct VerifyingSelfieScene: View {
	@State var isVerifying:Bool = true
    var body: some View {
		ZStack {
			VStack {

				TitleText(isVerifying ? "Verifying": "Verified!")
				BodyText(isVerifying ? "This should just take a second" : "Your profile's almost ready.")

				Spacer()
				if isVerifying{
					ProgressView().progressViewStyle(.circular)
				}
				Spacer()


				if !isVerifying {
					NavigationLink(destination: TurnOnNotificationsScene()){
						LabelButtonBlue("Next")
					}
				}
			}.frame(maxWidth: .infinity)

		}.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
			.navigationBarBackButtonHidden(true)
			.onTapGesture {
				isVerifying.toggle()
			}
    }
}

struct VerifyingSelfieScene_Previews: PreviewProvider {
    static var previews: some View {
        VerifyingSelfieScene()
    }
}
