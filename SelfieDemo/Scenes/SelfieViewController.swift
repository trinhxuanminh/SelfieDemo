//
//  SelfieViewController.swift
//  SelfieDemo
//
//  Created by Trịnh Xuân Minh on 16/08/2022.
//

import UIKit
import CameraManager
import SnapKit
import Photos

class SelfieViewController: BaseViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var menuView: UIView! {
        didSet {
            self.menuView.layer.cornerRadius = 16.0
        }
    }
    @IBOutlet weak var frameView: FrameView!
    @IBOutlet weak var libraryImageView: UIImageView! {
        didSet {
            self.libraryImageView.layer.cornerRadius = 4.0
            self.libraryImageView.clipsToBounds = true
        }
    }
    private lazy var cameraImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var imagePickerController: UIImagePickerController = {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .photoLibrary
        return imagePickerController
    }()

    private lazy var cameraManager: CameraManager = {
        let cameraManager = CameraManager()
        cameraManager.writeFilesToPhoneLibrary = false
        cameraManager.cameraDevice = .front
        cameraManager.focusMode = .locked
        cameraManager.shouldEnableTapToFocus = false
        cameraManager.shouldFlipFrontCameraImage = true
        cameraManager.shouldEnablePinchToZoom = false
        return cameraManager
    }()
    private let listFrame: [BaseFrame] = [Frame6(), Frame3()]
    private var stateFrame: Int = 0
    private var poster = UIImage(named: "posterName")!
    private var secondPoster = UIImage(named: "posterName")!
    private var titleString = "Minions"
    private var secondTitleString = "Minions in cinemas july1"
    private var dateString = "04th June, 2022"
    private var address = "Spring Love Cinemas - 1235USA"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addComponents()
        self.setConstraints()
        self.setProperties()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.frameView.changePoster(self.poster)
        self.frameView.changeSecondPoster(self.secondPoster)
        self.frameView.changeTitle(self.titleString)
        self.frameView.changeSecondTitle(self.secondTitleString)
        self.frameView.changeDate(self.dateString)
        self.frameView.changeAddress(self.address)
        self.fetchPhotos()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.changeFrame(self.listFrame[self.stateFrame])
    }

    override func addComponents() {
        self.containerView.insertSubview(self.cameraImageView, belowSubview: self.frameView)
    }

    override func setProperties() {
        self.cameraManager.addPreviewLayerToView(self.cameraImageView)
    }

    @IBAction func onTapShowLibrary(_ sender: Any) {
        self.present(to: self.imagePickerController, animated: true)
    }

    @IBAction func onTapCapture(_ sender: Any) {
        self.cameraManager.capturePictureWithCompletion({ [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let content):
                guard let selfieImage = content.asImage else {
                    return
                }
                self.creatMergeImage(selfieImage)
            }
        })
    }

    @IBAction func onTapEditFrame(_ sender: Any) {
        self.stateFrame = self.stateFrame == self.listFrame.count - 1 ? 0 : self.stateFrame + 1
        self.changeFrame(self.listFrame[self.stateFrame])
    }
}

extension SelfieViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.originalImage] as? UIImage {
            self.creatMergeImage(pickerImage)
        }
        dismiss(animated: true)
    }
}

extension SelfieViewController {
    func changeFrame(_ newFrame: BaseFrame) {
        self.frameView.changeFrame(newFrame)
        self.changeLocation(self.cameraImageView, newLocation: newFrame.camera)
    }

    func creatMergeImage(_ selfieImage: UIImage) {
        self.cameraImageView.image = selfieImage
        guard let mergeImage = self.mergeSelfieImage(sourceView: self.containerView) else {
            return
        }
        self.saveToLibrary(image: mergeImage)
    }

    func saveToLibrary(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.saveImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }

    @objc func saveImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        guard error == nil else {
            return
        }
        self.libraryImageView.image = image
    }
}

extension SelfieViewController {
    func fetchPhotos() {
        let fetchLimit = 1
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key:"creationDate", ascending: false)]
        fetchOptions.fetchLimit = fetchLimit

        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)

        if fetchResult.count > 0 {
            self.fetchPhotoAtIndex(0, fetchLimit, fetchResult)
        }
    }

    func fetchPhotoAtIndex(_ index: Int,_ totalImageCountNeeded: Int,_ fetchResult: PHFetchResult<PHAsset>) {
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true

        PHImageManager.default().requestImage(for: fetchResult.object(at: index) as PHAsset,
                                                 targetSize: self.libraryImageView.frame.size,
                                                 contentMode: PHImageContentMode.aspectFill,
                                                 options: requestOptions,
                                                 resultHandler: { [weak self] (image, _) in
            if let self = self, let image = image {
                self.libraryImageView.image = image
            }
        })
    }
}
