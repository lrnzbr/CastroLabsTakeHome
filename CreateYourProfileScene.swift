//
//  CreateYourProfileScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct CreateYourProfileScene: View {
	@State private var name:String = ""
    var body: some View {
		ZStack{
			VStack{
				TitleText("Create your profile")
				BodyText("This is how others see you on Star, so share what you're comfortable with")
				VStack(alignment: .leading, spacing: 0){
					BodyText("Name")
					RegistrationTextInput(placeholder: "Name", value: $name)
				}

				VStack(alignment: .leading, spacing: 0){
					BodyText("Pronouns")
					RegistrationTextInput(placeholder: "Pronouns", value: $name)
				}
				VStack(alignment: .leading, spacing: 0){
					BodyText("Location")
					RegistrationTextInput(placeholder: "Location", value: $name)
				}
				Spacer()
				DefaultButton(title: "Next"){}

			}.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
		}
    }
}

struct CreateYourProfileScene_Previews: PreviewProvider {
    static var previews: some View {
        CreateYourProfileScene()
    }
}
