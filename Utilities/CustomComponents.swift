//
//  CustomComponents.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI
//MARK: COLORS
struct AppColors {
	static let primary = Color.white
	static let text = Color.white
	static let secondary = Color.gray
	static let background = Color.black
}

//MARK: TEXT LABELS

struct TitleText: View {
	let input: String

	init(_ input: String) {
		self.input = input
	}
	var body: some View {
		Text(input)
			.foregroundColor(.white)
			.font(.system(size: 34, weight: .heavy))
	}
}

struct BodyText: View {
	let input: String

	init(_ input: String) {
		self.input = input
	}
	var body: some View {
		Text(input)
			.foregroundColor(.white)
			.font(.system(size: 17, weight: .medium))
	}
}

struct CaptionText: View {
	let input: String

	init(_ input: String) {
		self.input = input
	}
	var body: some View {
		Text(input)
			.foregroundColor(.gray)
			.font(.system(size: 13, weight: .light))
	}
}

struct FormLabelText: View {
	let input: String

	init(_ input: String) {
		self.input = input
	}
	var body: some View {
		Text(input)
			.foregroundColor(.white)
			.font(.system(size: 17, weight: .heavy))
	}
}
//MARK: BUTTONS

//Buttons with no action
struct LabelButtonBlue : View {
	var isDisabled:Bool

	let input: String

	init(_ input: String, isDisabled:Bool = false) {
		self.input = input
		self.isDisabled = isDisabled
	}
	var body: some View {

			ZStack {
				Text(input)
					.foregroundColor(.white)
					.font(.system(size: 17, weight: .medium))
			}
			.padding()
			.frame(maxWidth: .infinity)
			.background(.blue)
			.cornerRadius(14)
			.opacity(isDisabled ? 0.6 : 1 )

		}
}

struct LabelButtonTransparent : View {
	let input: String

	init(_ input: String) {
		self.input = input
	}
	var body: some View {

			ZStack {
				Text(input)
					.foregroundColor(.blue)
					.font(.system(size: 17, weight: .medium))
			}
			.cornerRadius(14)
		}


}




//MARK: TEXTFIELDS

struct RegistrationTextInput: View {
	var placeholder: String
	@Binding var value:String
	var body: some View {
		ZStack{
			Rectangle()
				//.background(Color(hex: "1C1C1E"))
				.cornerRadius(12)
				.foregroundColor(Color(hex: "1C1C1E"))


				.frame(maxWidth: .infinity, maxHeight: 60)
			TextField(placeholder, text: $value)
				.foregroundColor(.white)
				.padding()

		}

	}
}


struct RegistrationDateSelectorInput: View {
	@Binding var dateChosen:Date

	var body: some View {
		ZStack() {
			DatePicker(selection: $dateChosen, in: ...Date(), displayedComponents: .date) {

			}.frame(alignment: .leading)
				///.datePickerStyle(.wheel)

			Image(systemName: "calendar").foregroundColor(AppColors.background)
		}.frame(maxWidth: .infinity)
			.padding(16)
			.background(
				RoundedRectangle(cornerRadius: 8, style: .continuous)
					.stroke(AppColors.primary, lineWidth: 1)
			).padding()
	}
}
