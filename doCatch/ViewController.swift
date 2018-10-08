//
//  ViewController.swift
//  doCatch
//
//  Created by Milos Dimic on 10/8/18.
//  Copyright © 2018 Milos Dimic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum ThrowableError: Error {
        case somethingBadHappened
    }
    
    // MARK: Properties
    
    private var isEverythingOk = true
    
    // MARL: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        takeResponsibilityOfHandlingErrors()
        try? passTheErrorAlong()
        appWillCrashIfError()
        dontCareAboutErrorJustWantResultIfSuccess()
    }
    
    // MARK: Private methods
    
    // MARK: Throwing methods
    
    private func doSomething() throws -> String {
        if isEverythingOk {
            return "Everything is OK"
        } else {
            throw ThrowableError.somethingBadHappened
        }
    }
    
    // MARK: Try
    
    private func takeResponsibilityOfHandlingErrors() {
        do {
            let _ = try doSomething()
        }
        catch {
            // Here you know about the error
            // Feel free to handle to re-throw
            let _ = error
        }
    }
    
    private func passTheErrorAlong() throws -> Void {
        // Not within a do-catch block.
        // Any errors will be re-thrown to callers.
        let _ = try doSomething()
    }
    
    // MARK: Try!
    
    private func appWillCrashIfError() {
        //  “do or die” situation
        let _ = try! doSomething()
    }
    
    // MARK: Try?
    
    private func dontCareAboutErrorJustWantResultIfSuccess() {
        if let _ = try? doSomething() {
            // doSomething succeeded, and result is unwrapped.
        } else {
            // doSomething() threw an error but we dont care about error type
        }
        
        // or the same thing coded with guard
        
        guard let _ = try? doSomething() else {
            // doSomething() threw an error but we dont care about error type
            return
        }
    }
}

