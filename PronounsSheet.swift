//
//  PronounsSheet.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI


final class PronounsSheetViewModel: ObservableObject {
	@Published var assignedNumber = 0

	func getNumberAssignmentForPronoun(pronoun:String, preferredPronouns:[String])->Int {
		if !preferredPronouns.contains(pronoun){
			return assignedNumber
		} else {
			return preferredPronouns.firstIndex(of: pronoun)! + 1
		}
	}

	func addNewPronouns(pronoun:String, preferredPronouns:inout [String]){
		if preferredPronouns.contains(pronoun){
			preferredPronouns.removeAll { $0 == pronoun }
			assignedNumber -= 1
			return
		}
		if preferredPronouns.count >= 3 {
			return
		}
		preferredPronouns.append(pronoun)
		assignedNumber += 1
		return
	}
}


struct PronounsSheet: View {
	@StateObject var viewModel = PronounsSheetViewModel()
	@Binding var preferredPronouns:[String]
	var allPronouns:[String]


	var body: some View {
		ZStack{
			VStack {
				TitleText("Pronouns")
				BodyText("Add up to 3 pronouns so people know how to refer to you in the chat.")
				BodyText("CHAT PREVIEW")

				// CHAT PREVIEW
				HStack{
					Image(systemName: "face.smiling")

					VStack {
						HStack {
							BodyText("Cruz")
							BodyText("Your Pronouns...")
						}
						BodyText("hey y'all, i'm new here").padding([.horizontal])
							.background(Capsule())
					}
				}
				.padding()
				.background(.gray)
				.cornerRadius(8)

				// PRONOUN RADIO BUTTONS

				VStack(spacing: 0) {
					ForEach(allPronouns, id: \.self) { pronoun in
						PronounViewContainer(pronounTitle: pronoun, isSelected: $preferredPronouns.wrappedValue.contains( pronoun), assignedNumber: viewModel.getNumberAssignmentForPronoun(pronoun: pronoun, preferredPronouns: preferredPronouns)).onTapGesture {
							viewModel.addNewPronouns(pronoun: pronoun, preferredPronouns: &preferredPronouns)
						}
						}
					}
			}.frame(maxHeight: .infinity)


			}.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
		}
	}


//struct PronounsSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        PronounsSheet()
//    }
//}


struct PronounRadioButton: View {
	var number:String = ""
	//@Binding var isSelected:Bool
	var isSelected:Bool

	var body: some View {
		ZStack{
			if isSelected{
				ZStack{
					Circle().fill(.blue).frame(width: 30, height: 30)
					BodyText(number)
				}
			} else {
				Circle()
					.strokeBorder(.gray, lineWidth: 2)
					.frame(width: 30, height: 30)
			}
		}
	}
}

struct PronounViewContainer : View {
	var pronounTitle:String
	var isSelected:Bool
	var assignedNumber: Int
	var body : some View {
		HStack {
			BodyText(pronounTitle)
			Spacer()
			PronounRadioButton(number: String(assignedNumber), isSelected: isSelected)
		}.padding()

	}
}
