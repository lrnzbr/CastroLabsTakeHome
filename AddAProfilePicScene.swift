//
//  AddAProfilePicScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct AddAProfilePicScene: View {
    var body: some View {
		ZStack{
			VStack{
				TitleText("Add a profile pic")
				BodyText("Your profile pic is how others will get to know you, so use a face pic.")
				Spacer()
				ZStack{
					Circle().fill(.gray).frame(width: 200, height: 200)
					Image(systemName: "photo").resizable().frame(width: 120, height: 120).foregroundColor(.black)
				}
				Spacer()
				DefaultButton(title:"Open Camera Roll"){}
			}
		}.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
    }
}

struct AddAProfilePicScene_Previews: PreviewProvider {
    static var previews: some View {
        AddAProfilePicScene()
    }
}
