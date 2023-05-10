//
//  SelfieVerificationScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct SelfieVerificationScene: View {
    var body: some View {
		ZStack {
			VStack {
				TitleText("Verify with a selfie")
				BodyText("To keep Star safe, everyone must verify that their identity before joining.  This photo won't be used on your profile.")
				ZStack {
					Circle().fill(Color.gray).frame(width: 200)
					Image("selfie").resizable().frame(width: 120, height: 120)
				}
				Spacer()
				//DefaultButton(title: "Take a selfie"){}
			}
		}.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
    }
}

struct SelfieVerificationScene_Previews: PreviewProvider {
    static var previews: some View {
        SelfieVerificationScene()
    }
}
