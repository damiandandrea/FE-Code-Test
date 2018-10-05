//
//  AppHelper.swift
//

import Foundation
import UIKit
import Siesta
import SwiftyJSON

class AppHelper {
    
    // MARK: - Settings from PList files
    class func getPListFile(objectTarget: AnyObject) -> NSDictionary{
        
        let bundle = Bundle(for: type(of: objectTarget))
        let path = bundle.path(forResource: "Info", ofType: "plist")
        return NSDictionary(contentsOfFile: path!)!
    }
    
    class func getSettingFromPListFile(objectTarget: AnyObject, settingName: String) -> String{
        
        let appInfo = AppHelper.getPListFile(objectTarget: objectTarget)
        let config = appInfo["Cocktail Configuration"] as! Dictionary<String,AnyObject>
        return config[settingName] as! String
    }
    
    class func getAPIUrl(objectTarget: AnyObject) -> String{
        
        return AppHelper.getSettingFromPListFile(objectTarget: objectTarget, settingName: "APIUrl")
    }
    
    // MARK: - Misc
    class func getDocumentDirectory() -> String{
        
        let dirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = dirs[0]
        return dir
    }
    
    class func getVersion(objectTarget: AnyObject) -> String {
        let bundle = Bundle(for: type(of: objectTarget))
        let appInfo = bundle.infoDictionary
        let shortVersion = appInfo!["CFBundleShortVersionString"] as! String
        
        return shortVersion
    }
}
