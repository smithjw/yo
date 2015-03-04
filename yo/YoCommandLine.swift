//
//  YoNotification.swift
//  yo
//
//  Created by Shea Craig on 3/3/15.
//  Copyright (c) 2015 Shea Craig. All rights reserved.
//

import Foundation
import CommandLine

class YoCommandLine {
    // Set up our commandline arguments.
    let cli = CommandLine()
    let title = StringOption(shortFlag: "t", longFlag: "title", required: true, helpMessage: "Title for notification")
    let subtitle = StringOption(shortFlag: "s", longFlag: "subtitle", required: false, helpMessage: "Subtitle for notification")
    let informativeText = StringOption(shortFlag: "n", longFlag: "info", required: false, helpMessage: "Informative text.")
    let actionBtnText = StringOption(shortFlag: "b", longFlag: "action_btn", required: false, helpMessage: "Include an action button, with the button label text supplied to this argument.")
    let otherBtnText = StringOption(shortFlag: "o", longFlag: "other_btn", required: false, helpMessage: "Alternate label for cancel button text.")
    let icon = StringOption(shortFlag: "i", longFlag: "icon", required: false, helpMessage: "Complete path to an alternate icon to use for the notification.")
    let action = StringOption(shortFlag: "a", longFlag: "action_path", required: false, helpMessage: "Application to open if user selects the action button. Provide the full path as the argument. This option only does something if -b/--action_btn is also specified. Defaults to opening nothing.")
    let help = BoolOption(shortFlag: "h", longFlag: "help", helpMessage: "Show help.")
    
    init () {
        // Add arguments to commandline object and handle errors or help requests.
        cli.addOptions(title, subtitle, informativeText, actionBtnText, otherBtnText, icon, action, help)
        let (success, error) = cli.parse()
        if help.value {
            cli.printUsage()
            exit(EX_USAGE)
        }
        else if !success {
            println(error!)
            cli.printUsage()
            exit(EX_USAGE)
        }
    }
}