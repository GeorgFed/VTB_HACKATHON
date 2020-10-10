//
//  CameraVC.swift
//  VTB_HACKATHON_iOS
//
//  Created by Georg on 10.10.2020.
//

import UIKit
import AVFoundation

class CameraVC: UIViewController {

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var snapButton: UIButton!
    @IBOutlet weak var messageLbl: UILabel!
    
    // MARK: - AV
    var captureSession: AVCaptureSession!
    var cameraOutput: AVCapturePhotoOutput!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    var photoData: Data?
    
    @IBOutlet weak var betaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previewLayer.frame = cameraView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /*
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapCameraView))
        tap.numberOfTapsRequired = 1
        */
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        
        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera!)
            if captureSession.canAddInput(input) == true {
                captureSession.addInput(input)
            }
            
            cameraOutput = AVCapturePhotoOutput()
            if captureSession.canAddOutput(cameraOutput) == true {
                captureSession.addOutput(cameraOutput!)
            }
            
            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.videoGravity = AVLayerVideoGravity.resizeAspect
            previewLayer.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
            
            cameraView.layer.addSublayer(previewLayer!)
            // cameraView.addGestureRecognizer(tap)
            captureSession.startRunning()
        } catch {
            // MARK: - Camera Error Handling
            debugPrint(error)
        }
    }
    
    @IBAction func snapBtnTapped(_ sender: Any) {
        didTapCameraView()
    }
    
    @objc func didTapCameraView() {
        let settings = AVCapturePhotoSettings()
        settings.previewPhotoFormat = settings.embeddedThumbnailPhotoFormat
        // cameraOutput.capturePhoto(with: settings, delegate: self)
        
        performSegue(withIdentifier: Identifier.toPopupVC, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is PopupVC {
            let vc = segue.destination as? PopupVC
            // MARK: - PASS IMAGE
        }
    }
}

/*
extension CameraVC: AVCapturePhotoCaptureDelegate {
    // MARK: - ERROR!!!
    func photoOutput(_ output: AVCapturePhotoOutput,
     didFinishProcessingPhoto photo: AVCapturePhoto,
     error: Error?) {
        if let error = error {
            debugPrint(error)
        } else {
            photoData = photo.fileDataRepresentation()
            let image = UIImage(data: photoData!)
            // self.betaImageView.image = image
            // MARK: - PROCESS IMAGE
        }
    }

}
*/
