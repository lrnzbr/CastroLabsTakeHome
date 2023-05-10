//
//  CustomComponents.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct AppColors {
	static let primary = Color.white
	static let text = Color.white
	static let secondary = Color.gray
	static let background = Color.black
	//static let secondaryBackground = Color("Light Purple Gradient End")
	//static let feedBackground = Color("Medium Gray")
	static let subtext = Color("Dark Gray")
	static let warning = Color("Red")
	static let click = Color("Blue")

	//MUUD Colors
//	static let happiness = Color("Happiness Purple")
//	static let surprise = Color("Surprise Orange")
//	static let sadness = Color("Sadness Blue")
//	static let dislike = Color("Dislike Green")
//	static let fear = Color("Fear Yellow")
//	static let anger = Color("Anger Red")

	//Gradients
	static let lightPurpleGradient = LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(red: 1, green: 1, blue: 1, opacity: 1), location: 0), Gradient.Stop(color: Color(red: 0.9019607901573181, green: 0.8784313797950745, blue: 0.9647058844566345, opacity: 1), location: 1)]), startPoint: UnitPoint(x: 0.5, y: -3.0616171314629196e-17), endPoint: UnitPoint(x: 0.5, y: 0.9999999999999999))

}

enum AppFont {

	static let header       = Font.custom(Montserrat.medium.weight,    size: 24)
	static let title        = Font.custom(Montserrat.semiBold.weight,         size: 24)
	static let body         = Font.custom(Montserrat.regular.weight,       size: 16)
	static let body2        = Font.custom(Montserrat.medium.weight,      size: 16)
	static let smallText     = Font.custom(Montserrat.regular.weight,      size: 14)
	static let textField    = Font.custom(Montserrat.regular.weight,      size: 16)
	static let dangerText    = Font.custom(Montserrat.semiBold.weight,      size: 14)
	static let buttonText = Font.custom(Montserrat.bold.weight, size: 18)

	static let formTitleText = Font.custom(Montserrat.semiBold.weight, size: 16)
	static let extraSmallText     = Font.custom(Montserrat.regular.weight,      size: 12)

	static let moodTitleText = Font.custom(Montserrat.semiBold.weight,      size: 14)
	static let wellnessInterestText = Font.custom(Montserrat.bold.weight,      size: 16)
	static let forgotPasswordText = Font.custom(Montserrat.semiBold.weight,      size: 16)

	static var custom: (Montserrat, CGFloat) -> Font = { (weight, size) in
		return Font.custom(weight.weight, size: size)
	}
}

enum Montserrat: String {

	case black        = "Montserrat-Black"
	case extraBold    = "Montserrat-ExtraBold"
	case bold         = "Montserrat-Bold"
	case semiBold     = "Montserrat-SemiBold"
	case medium       = "Montserrat-Medium"
	case regular      = "Montserrat-Regular"
	case light        = "Montserrat-Light"
	case extraLight   = "Montserrat-ExtraLight"
	case thin         = "Montserrat-Thin"

	var weight: String { return self.rawValue }
}



struct TitleText: View {
	let input: String

	init(_ input: String) {
		self.input = input
	}
	var body: some View {
		Text(input)
			.foregroundColor(.white)
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
	}
}

struct ButtonText: View {
	let input: String

	init(_ input: String) {
		self.input = input
	}
	var body: some View {
		Text(input)
	}
}


struct DefaultButton: View {
	var title: String
	var clicked: (() -> Void)
	var body: some View {
		Button(action: clicked ){
			ButtonText(title)
				.frame(maxWidth: .infinity)

		}
		.buttonStyle(DarkButtonStyle())
	}
}

struct DarkButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.padding()
			.background(.blue)
			.foregroundColor(.white)
			.clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
			.background(
				RoundedRectangle(cornerRadius: 25)
					.fill(Color.white)
					.shadow(color: .gray, radius: 2, x: 0, y: 2)
			)
	}
}



struct RegistrationTextInput: View {
	var placeholder: String
	@Binding var value:String
	var body: some View {
		TextField(placeholder, text: $value)
			.textFieldStyle(RegistrationTextFieldStyle())
			.font(AppFont.textField)
			.foregroundColor(AppColors.subtext)
			.padding()
	}
}

struct RegistrationTextFieldStyle: TextFieldStyle {
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.padding(8)
			.background(
				ZStack{
					RoundedRectangle(cornerRadius: 8, style: .continuous)
						.fill(AppColors.secondary)
					RoundedRectangle(cornerRadius: 8, style: .continuous)
						.strokeBorder(AppColors.primary, lineWidth: 1)

				}
			)
	}

}

struct RegistrationDateSelectorInput: View {
	@Binding var dateChosen:Date

	var body: some View {

		HStack() {
			DatePicker(selection: $dateChosen, in: ...Date(), displayedComponents: .date) {

			}.frame(alignment: .leading)
			Image(systemName: "calendar").foregroundColor(AppColors.background)
		}.frame(maxWidth: .infinity)
			.padding(16)
			.background(
				RoundedRectangle(cornerRadius: 8, style: .continuous)
					.stroke(AppColors.primary, lineWidth: 1)
			).padding()
	}
}
