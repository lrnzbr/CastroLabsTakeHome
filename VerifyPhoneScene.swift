//
//  VerifyPhoneScene.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/9/23.
//

import SwiftUI

struct VerifyPhoneScene: View {
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>

	var body: some View {
		ZStack{
			VStack{
				TitleText("Verify your phone").padding(.vertical)
				BodyText("Please enter the code we sent to +1 (123) 456-7890 ").padding(.vertical)
				VerificationCodeNumbers()

				NavigationLink(destination: CreateYourProfileScene()){
					LabelButtonTransparent("Resend Code")
				}
				Spacer()

			}.frame(maxWidth: .infinity)
		}.navigationBarBackButtonHidden(true)
			.navigationBarItems(leading: Button(action : {
				self.mode.wrappedValue.dismiss()
			}){
				Image(systemName: "chevron.left").foregroundColor(.white)
			})
			.background(Color.black.edgesIgnoringSafeArea([.top, .bottom]))
	}
}

struct VerifyPhoneScene_Previews: PreviewProvider {
    static var previews: some View {
        VerifyPhoneScene()
    }
}


class VerificationCodeNumbersViewModel: ObservableObject {

	@Published var otpField = "" {
		didSet {
			guard otpField.count <= 6,
				  otpField.last?.isNumber ?? true else {
				otpField = oldValue
				return
			}
		}
	}
	var otp1: String {
		guard otpField.count >= 1 else {
			return ""
		}
		return String(Array(otpField)[0])
	}
	var otp2: String {
		guard otpField.count >= 2 else {
			return ""
		}
		return String(Array(otpField)[1])
	}
	var otp3: String {
		guard otpField.count >= 3 else {
			return ""
		}
		return String(Array(otpField)[2])
	}
	var otp4: String {
		guard otpField.count >= 4 else {
			return ""
		}
		return String(Array(otpField)[3])
	}

	var otp5: String {
		guard otpField.count >= 5 else {
			return ""
		}
		return String(Array(otpField)[4])
	}

	var otp6: String {
		guard otpField.count >= 6 else {
			return ""
		}
		return String(Array(otpField)[5])
	}

	@Published var borderColor: Color = .black
	@Published var isTextFieldDisabled = false
	var successCompletionHandler: (()->())?

	@Published var showResendText = false

}

struct VerificationCodeNumbers: View {

	@StateObject var viewModel = VerificationCodeNumbersViewModel()
	@State var isFocused = false

	let textBoxWidth = UIScreen.main.bounds.width / 8
	let textBoxHeight = UIScreen.main.bounds.width / 8
	let spaceBetweenBoxes: CGFloat = 10
	let paddingOfBox: CGFloat = 1
	var textFieldOriginalWidth: CGFloat {
		(textBoxWidth*6)+(spaceBetweenBoxes*3)+((paddingOfBox*2)*3)
	}

	var body: some View {

		VStack {

			ZStack {

				HStack (spacing: spaceBetweenBoxes){

					otpText(text: viewModel.otp1)
					otpText(text: viewModel.otp2)
					otpText(text: viewModel.otp3)
					otpText(text: viewModel.otp4)
					otpText(text: viewModel.otp5)
					otpText(text: viewModel.otp6)
				}


				TextField("", text: $viewModel.otpField)
					.frame(width: isFocused ? 0 : textFieldOriginalWidth, height: textBoxHeight)
					.disabled(viewModel.isTextFieldDisabled)
					.textContentType(.oneTimeCode)
					.foregroundColor(.clear)
					.accentColor(.clear)
					.background(Color.clear)
					.keyboardType(.numberPad)
			}
		}
	}

	private func otpText(text: String) -> some View {

		return Text(text)
			.font(.title)
			.frame(width: textBoxWidth, height: textBoxHeight)
			.background(VStack{
				Spacer()
				RoundedRectangle(cornerRadius: 1)
					.frame(height: 0.5)

			}.background(.gray)
				.cornerRadius(16))
			.padding(paddingOfBox)
	}
}
