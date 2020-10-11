//
//  CameraVC.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 10.10.2020.
//

import UIKit
import AVFoundation
import CameraManager

class CameraVC: UIViewController {

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var snapButton: UIButton!
    @IBOutlet weak var messageLbl: UILabel!
    
    let cameraManager = CameraManager()
    var imageToProcess: UIImage?
    
    var model: String?
    var prob: Double?
    
    var make: String?
    var make_model: String?
    var minPrice: Int?
    var maxPrice: Int?
    var imageURL: String?
    
    @IBAction func snapBtnTapped(_ sender: Any) {
        // didTapCameraView()
        cameraManager.capturePictureWithCompletion({ result in
            switch result {
                case .failure:
                    print("Failed")
                    // error handling
                case .success(let content):
                    self.imageToProcess = content.asImage;
                    self.fetchData {
                        print("here")
                        if self.prob! >= 0.3 {
                            self.getCarInfo {
                                self.showPopup()
                            }
                        } else {
                            print("Unable to recognize")
                        }
                    }
                    print("Success")
            }
        })

    }
    
    func fetchData(handler: @escaping () -> ()) {
        // let imageData:NSData = imageToProcess!.pngData()! as NSData
        // let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters).replacingOccurrences(of: "\n", with: "", options: .literal, range: nil)
        imageToProcess = imageToProcess!.resized(withPercentage: 0.2)
        let imageData = imageToProcess?.jpegData(compressionQuality: 1)
        let imageBase64String = imageData?.base64EncodedString()
        // print(imageBase64String!)
        DataSource.shared.getCar(carPhotoB64: imageBase64String!) { (model, prob) in
            self.model = model
            self.prob = prob
            handler()
        }
    }
    
    func getCarInfo(handler: @escaping () -> ()) {
        guard let model = model else {
            return
        }
        
        DataSource.shared.searchCar(model: model) { (make, make_model, minPrice, maxPrice, imageURL) in
            self.make = make
            self.make_model = make_model
            self.minPrice = minPrice
            self.maxPrice = maxPrice
            self.imageURL = imageURL
            handler()
        }
    }
    
    func showPopup() {
        
        self.performSegue(withIdentifier: Identifier.toPopupVC, sender: nil)
    }
    
    override func viewDidLoad() {
        
        cameraManager.addPreviewLayerToView(self.cameraView)
        cameraManager.cameraOutputQuality = .high
        cameraManager.shouldRespondToOrientationChanges = false
        cameraManager.writeFilesToPhoneLibrary = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is PopupVC {
            let vc = segue.destination as? PopupVC
            vc!.imageToProcess = self.imageToProcess
            vc!.model = model
            vc!.prob = prob
            vc!.make = make
            vc!.make_model = make_model
            vc!.minPrice = minPrice
            vc!.maxPrice = maxPrice
            vc!.imageURL = imageURL
        }
    }
}

    /*
    var images = [UIImage]()

    var captureSession: AVCaptureSession!
    var cameraOutput: AVCapturePhotoOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startCamera()
    }

    func startCamera() {
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        cameraOutput = AVCapturePhotoOutput()

        if let device = AVCaptureDevice.default(for: .video),
           let input = try? AVCaptureDeviceInput(device: device) {
            if (captureSession.canAddInput(input)) {
                captureSession.addInput(input)
                if (captureSession.canAddOutput(cameraOutput)) {
                    captureSession.addOutput(cameraOutput)
                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                    previewLayer.frame = cameraView.bounds
                    cameraView.layer.addSublayer(previewLayer)
                    captureSession.startRunning()
                }
            } else {
                print("issue here : captureSesssion.canAddInput")
            }
        } else {
            print("some problem here")
        }
    }
    */

    /*
    @objc func didTapCameraView() {
        let currentSettings = getSettings()
        performSegue(withIdentifier: Identifier.toPopupVC, sender: nil)
        /*
         let currentSettings = getSettings()
         cameraOutput.capturePhoto(with: currentSettings, delegate: self)
         */
    }
    
    func getSettings() -> AVCapturePhotoSettings {
        let settings = AVCapturePhotoSettings()
        settings.previewPhotoFormat = settings.embeddedThumbnailPhotoFormat
        return settings
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is PopupVC {
            let vc = segue.destination as? PopupVC
            // MARK: - PASS IMAGE
        }
    }
}

extension CameraVC : AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {

        if let error = error {
            print("error occured : \(error)")
        }

        if let dataImage = photo.fileDataRepresentation() {
            print(UIImage(data: dataImage)?.size as Any)

            let dataProvider = CGDataProvider(data: dataImage as CFData)
            let cgImageRef: CGImage! = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: .defaultIntent)
            let image = UIImage(cgImage: cgImageRef, scale: 1.0, orientation: UIImage.Orientation.right)

            /**
               save image in array / do whatever you want to do with the image here
            */
            self.images.append(image)

        } else {
            print("some error here")
        }
    }
}
*/
extension UIImage {
    func resized(withPercentage percentage: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
    func resized(toWidth width: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
}
