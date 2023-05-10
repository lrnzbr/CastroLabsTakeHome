//
//  VerifyingSelfieScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct VerifyingSelfieScene: View {
	var isVerifying:Bool = false
    var body: some View {
		ZStack {
			VStack {

				TitleText(isVerifying ? "Verifying": "Verified!")
				BodyText(isVerifying ? "This should just take a second" : "Your profile's almost ready.")

				Spacer()
				if !isVerifying {
					DefaultButton(title: "Next"){}
				}
			}

		}.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
    }
}

struct VerifyingSelfieScene_Previews: PreviewProvider {
    static var previews: some View {
        VerifyingSelfieScene()
    }
}
