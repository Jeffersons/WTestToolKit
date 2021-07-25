//
//  Texts.swift
//  WTestToolKit
//
//  Created by Jefferson de Souza Batista on 25/07/21.
//

import Foundation

public enum Text {
    public static let waitAnimationDownloadProgress = Text.tr("Localizable", "wait_animation_download_progress")
    public static let waitAnimationIndexZipcode = Text.tr("Localizable", "wait_animation_index_zipcode")
    public static let downloadViewContinue = Text.tr("Localizable", "downloadview_continue")
    public static let downloadviewIndexed = Text.tr("Localizable", "downloadview_indexed")
}

extension Text {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

private final class BundleToken {}
