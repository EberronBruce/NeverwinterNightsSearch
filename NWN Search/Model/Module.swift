//
//  Module.swift
//  Neverwinter Nights Search
//
//  Created by Bruce Burgess on 2/11/20.
//  Copyright © 2020 Red Raven Computing Studios. All rights reserved.
//

import Foundation


class Module {
    let moduleName: String!
    let sessionName: String!
    let moduleDescription: String!
    let host : String!
    let playerNumber : Int!
    
    private var _currentNumberOfPlayers: Int!
    private var _maxPlayerNumber: Int!
    private var _passworded : Bool!
    private var _minLevel : Int!
    private var _maxLevel : Int!
    private var _port : Int!
    private var _pvp : Int!
    private var _serverVault : Bool!
    
    
    init(moduleName: String, sessionName: String, moduleDescription: String, playerNumber: Int, maxPlayerNumber: Int, passworded : Bool, minLevel : Int, maxLevel : Int, host : String, port : Int, pvp : Int, serverVault : Bool) {
        self.moduleName = moduleName
        self.sessionName = sessionName
        self.moduleDescription = moduleDescription
        _currentNumberOfPlayers = playerNumber
        _maxPlayerNumber = maxPlayerNumber
        _passworded = passworded
        _minLevel = minLevel
        _maxLevel = maxLevel
        self.host = host
        _port = port
        _pvp = pvp
        _serverVault = serverVault
        self.playerNumber = playerNumber
    }
    
    
    
    var maxPlayerNumber : String {
        get {
            return String(_maxPlayerNumber)
        }
    }
    
    var numberOfCurrentPlayers : String {
        get {
            return String(playerNumber)
        }
    }
    
    var passworded : String {
        get {
            if _passworded {return PASSWORD_PROTECTED}
            return ""
        }
    }
    
    var minLevel : String {
        get {
            return String(_minLevel)
        }
    }
    
    var maxLevel : String {
        get {
            return String(_maxLevel)
        }
    }
    
    var port : String {
        get {
            return String(_port)
        }
    }
    
    var pvp : String {
        get {
            switch _pvp {
            case 0:
                return PVP_NO
            case 1:
                return PVP_PARTY
            case 2:
                return PVP_FULL
            default:
                return ""
            }
        }
    }
    
    var serverVault : String {
        get {
            if _serverVault {return SERVER_VAULT}
            return LOCAL_VAULT
        }
    }
    
    
}
