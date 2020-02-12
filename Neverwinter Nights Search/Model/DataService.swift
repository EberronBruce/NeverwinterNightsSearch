//
//  DataService.swift
//  Neverwinter Nights Search
//
//  Created by Bruce Burgess on 2/11/20.
//  Copyright © 2020 Red Raven Computing Studios. All rights reserved.
//

import Foundation


class DataService {
    
    func getDataFromApi() {
        makeApiCall(url: API_URL)
    }
    
    private func makeApiCall(url : String) {
        getDatafromURL(urlString: url) { (data, error) in
            if data == nil { return }
            var jsonArrayDictionary : [[String : Any]]
            
            do {
                jsonArrayDictionary = try JSONSerialization.jsonObject(with: data!, options:[]) as! [[String : Any]]
                self.parseJsonArray(jsonArrayDictionary)
            } catch {
                print("error")
            }
        }
    }
    
    
    private func parseJsonArray(_ jsonArray : [[String : Any]]) {
        var modules = [Module]()
        
        for json in jsonArray {
            if let moduleName = json[KEY_MODULE_NAME] as? String, let moduleDescription = json[KEY_MODULE_DESCRIPTION] as? String, let sessionName = json[KEY_SESSION_NAME] as? String, let currentPlayers = json[KEY_CURRENT_PLAYERS] as? Int,
                let maxPlayers = json[KEY_MAX_PLAYERS] as? Int,let passworded = json[KEY_PASSWORDED] as? Bool, let maxLevels = json[KEY_MAX_LEVEL] as? Int, let minLevels = json[KEY_MIN_LEVEL] as? Int, let host = json[KEY_HOST] as? String,
                let port = json[KEY_PORT] as? Int, let pvp = json[KEY_PVP] as? Int, let serverVault = json[KEY_SERVERVAULT] as? Bool
            {
                let module = Module(moduleName: moduleName, sessionName: sessionName, moduleDescription: moduleDescription, playerNumber: currentPlayers, maxPlayerNumber: maxPlayers, passworded: passworded, minLevel: minLevels, maxLevel: maxLevels, host: host, port: port, pvp: pvp, serverVault: serverVault)
                modules.append(module)
            }
        }
        
        sendModuleArrayToNotification(modules: modules)
    }
    
    private func sendModuleArrayToNotification(modules : [Module]) {
        let dictionary = [KEY_NWN : modules]
        NotificationCenter.default.post(name: NOTIFY_API_FINISHED, object: self, userInfo: dictionary)
    }
    
    
}
