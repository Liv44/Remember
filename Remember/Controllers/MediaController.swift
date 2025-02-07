//
//  MediaController.swift
//  Remember
//
//  Created by Louis Teilliais on 17/01/2025.
//
import Foundation
import Photos
import AVFoundation
import UIKit

class MediaController {
    
    func handleMediaAccess(completion: @escaping (Bool) -> Void) {
        
        let status = PHPhotoLibrary.authorizationStatus()
        
        switch status {
        case.notDetermined:
            PHPhotoLibrary.requestAuthorization { newStatus in
                completion(newStatus == .authorized || newStatus == .limited)
            }
        case.authorized, .limited:
            completion(true)
        default:
            completion(false)
        }
    }
    
    
}
