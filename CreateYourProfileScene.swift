//
//  CreateYourProfileScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI


struct CreateYourProfileScene: View {
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>

	@State private var name:String = ""
	@State private var showingPronounsSheet = false
	var allPronouns = ["He/Him", "She/Her", "They/Them", "Ze/Zir", "Ze/Hir", "Xe/Xem", "Any Pronouns"]
	@State var preferredPronouns:[String] = []
	var body: some View {
		ZStack{
			VStack{
				TitleText("Create your profile").padding(.vertical)
				BodyText("This is how others see you on Star, so share what you're comfortable with")
				VStack(alignment: .leading, spacing: 0){
					BodyText("Name")
					RegistrationTextInput(placeholder: "Name", value: $name)
				}.padding(.vertical)

				VStack(alignment: .leading, spacing: 0){
					BodyText("Pronouns")
					RegistrationTextInput(placeholder: preferredPronouns.count == 0 ? "Pronouns" : preferredPronouns.joined(separator: ", "), value: $name)
						.disabled(true).onTapGesture {
						showingPronounsSheet.toggle()
					}
				}.padding(.vertical)
				VStack(alignment: .leading, spacing: 0){
					BodyText("Location")
					RegistrationTextInput(placeholder: "Location", value: $name)
				}.padding(.vertical)
				Spacer()
				NavigationLink(destination: AddAProfilePicScene()){
					LabelButtonBlue("Next")
				}

			}.navigationBarBackButtonHidden(true)
				.navigationBarItems(leading: Button(action : {
					self.mode.wrappedValue.dismiss()
				}){
					Image(systemName: "chevron.left").foregroundColor(.white)
				})
				.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
		}.sheet(isPresented: $showingPronounsSheet){ PronounsSheet(preferredPronouns: $preferredPronouns, allPronouns: allPronouns).presentationDetents([.medium, .large])
				.presentationDragIndicator(.hidden)
		}
	}
}
struct CreateYourProfileScene_Previews: PreviewProvider {
    static var previews: some View {
        CreateYourProfileScene()
    }
}
