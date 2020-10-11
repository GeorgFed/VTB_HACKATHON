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
    var image: UIImage?
    
    @IBAction func snapBtnTapped(_ sender: Any) {
        // didTapCameraView()
        cameraManager.capturePictureWithCompletion({ result in
            switch result {
                case .failure:
                    print("Failed")
                    // error handling
                case .success(let content):
                    self.image = content.asImage;
                    self.performSegue(withIdentifier: Identifier.toPopupVC, sender: nil)
                    print("Success")
            }
        })

    }
    
    override func viewDidLoad() {
        cameraManager.addPreviewLayerToView(self.cameraView)
        cameraManager.cameraOutputQuality = .medium
        cameraManager.writeFilesToPhoneLibrary = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is PopupVC {
            let vc = segue.destination as? PopupVC
            vc!.imageToProcess = self.image
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
