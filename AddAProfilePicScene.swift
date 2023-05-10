//
//  AddAProfilePicScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct AddAProfilePicScene: View {
	@State var selectedImage : Image?
	@State private var shouldPresentImagePicker = false
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>


	var body: some View {
		ZStack{
			VStack{
				TitleText("Add a profile pic")
				BodyText("Your profile pic is how others will get to know you, so use a face pic.")
				Spacer()
				if selectedImage != nil {
					ZStack{
						Circle()
							.fill(.gray)
							.frame(width: 200, height: 200)
						selectedImage!
							.resizable()
							.aspectRatio(contentMode: .fill)
							.frame(width: 200, height: 200)
							.clipShape(Circle())
					}

				} else {
					ZStack{
						Circle().fill(.gray).frame(width: 200, height: 200)
						Image("addPhoto").resizable().frame(width: 120, height: 120).foregroundColor(.black)
					}
				}
				Spacer()
				if selectedImage != nil {
					NavigationLink(destination: VerifyingSelfieScene()){
						LabelButtonBlue("Next")
					} }
				else {
					LabelButtonBlue("Open Camera Roll").onTapGesture {
						shouldPresentImagePicker.toggle()
					}
				}
			}.sheet(isPresented: $shouldPresentImagePicker) {
				BentImagePickerView(sourceType: .photoLibrary, image: $selectedImage, isPresented: self.$shouldPresentImagePicker)
			}.navigationBarBackButtonHidden(true)
				.navigationBarItems(leading: Button(action : {
					self.mode.wrappedValue.dismiss()
				}){
					Image(systemName: "chevron.left").foregroundColor(.white)
				})
				.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
		}
	}
}
struct AddAProfilePicScene_Previews: PreviewProvider {
    static var previews: some View {
        AddAProfilePicScene()
    }
}
