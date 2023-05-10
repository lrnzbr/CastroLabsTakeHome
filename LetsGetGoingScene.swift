//
//  LetsGetGoingScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct LetsGetGoingScene: View {
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
		ZStack{
			AppColors.background
			VStack {
				Spacer()
				VStack(alignment: .leading){
					TitleText("Let's get going!")

					HStack{
						Image("queerComic")
							.resizable()
							.frame(width: 96, height: 96)
							.cornerRadius(16)

						VStack(alignment: .leading) {
							BodyText("Queer League Comics")
							BodyText("81 Members")
						}


					}
					.padding()
					.background(Color(hex:"2C2C2E"))
					.cornerRadius(16)
				}
				BodyText("We're going to save this for now and get you set up with a Star profile first.")
					.padding()
					.multilineTextAlignment(.center)

				Spacer()
				Spacer() 
				NavigationLink(destination: CreateYourAccountScene()){
					LabelButtonBlue("Next")
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

struct LetsGetGoingScene_Previews: PreviewProvider {
    static var previews: some View {
        LetsGetGoingScene()
    }
}


