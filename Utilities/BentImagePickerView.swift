//
//  BentImagePickerView.swift
//  CastroLabsTakeHome
//
//  Created by Lorenzo Brown on 5/10/23.
//

import SwiftUI
import UIKit

struct BentImagePickerView: UIViewControllerRepresentable {

	var sourceType: UIImagePickerController.SourceType = .photoLibrary
	@Binding var image: Image?
	@Binding var isPresented: Bool

	func makeCoordinator() -> ImagePickerViewCoordinator {
		return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented)
	}

	func makeUIViewController(context: Context) -> UIImagePickerController {
		let pickerController = UIImagePickerController()
		pickerController.sourceType = sourceType
		pickerController.delegate = context.coordinator
		return pickerController
	}

	func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
		// Nothing to update here
	}

}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

	@Binding var image: Image?
	@Binding var isPresented: Bool

	init(image: Binding<Image?>, isPresented: Binding<Bool>) {
		self._image = image
		self._isPresented = isPresented
	}

	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			self.image = Image(uiImage: image)
		}
		self.isPresented = false
	}

	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		self.isPresented = false
	}

}

extension View {
	// This function changes our View to UIView, then calls another function
	// to convert the newly-made UIView to a UIImage.
	public func asUIImage() -> UIImage {
		let controller = UIHostingController(rootView: self)

		controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
		UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)

		let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
		controller.view.bounds = CGRect(origin: .zero, size: size)
		controller.view.sizeToFit()

		// here is the call to the function that converts UIView to UIImage: `.asUIImage()`
		let image = controller.view.asUIImage()
		controller.view.removeFromSuperview()
		return image
	}
}

extension UIView {
	// This is the function to convert UIView to UIImage
	public func asUIImage() -> UIImage {
		let renderer = UIGraphicsImageRenderer(bounds: bounds)
		return renderer.image { rendererContext in
			layer.render(in: rendererContext.cgContext)
		}
	}
}
