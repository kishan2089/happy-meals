//
//  CGPDFDocument+Extension.swift
//  DocScannerDev
//
//  Created by Kartum Infotech on 08/02/22.
//

import Foundation
import UIKit
import CoreGraphics

extension CGPDFDocument {
    func imageForPageAt(pageNumber: Int) -> UIImage? {
        guard let page = self.page(at: pageNumber) else { return nil }
        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        return renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)

            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)

            ctx.cgContext.drawPDFPage(page)
        }
    }
}
