//
//  LetsGetGoingScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct LetsGetGoingScene: View {
    var body: some View {
		ZStack{
			AppColors.background
			VStack {
				Spacer()
				TitleText("Let's get going!")
				HStack{
					Image("queerComic")
						.resizable()
						.frame(width: 80, height: 80)
						.cornerRadius(16)

					VStack(alignment: .leading) {
						BodyText("Queer League Comics")
						BodyText("81 Members")
					}


				}
				.padding()
				.background(AppColors.secondary)
				.cornerRadius(16)

				BodyText("We're going to save this for now and get you set up with a Star profile first.")

				Spacer()
				Spacer() 
				DefaultButton(title: "Next"){}
			}
			.padding()

		}.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
    }
}

struct LetsGetGoingScene_Previews: PreviewProvider {
    static var previews: some View {
        LetsGetGoingScene()
    }
}


