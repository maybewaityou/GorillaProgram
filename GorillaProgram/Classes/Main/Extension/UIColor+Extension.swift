//
//  UIColor+Extension.swift
//  GorillaProgram
//
//  Created by ChunNan on 16/5/16.
//  Copyright © 2016年 MeePwn. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: UInt32) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat((hex & 0x0000FF) >> 0) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    convenience init?(hexString: String) {
        let hexColorString = hexString.stringByReplacingOccurrencesOfString("#", withString: "")
        var hex: UInt32 = 0
        let scanner = NSScanner(string: hexColorString)
        
        if scanner.scanHexInt(&hex) {
            self.init(hex: hex)
        } else {
            self.init()
            return nil
        }
    }
    
    // MARK: Components
    
    func getRGBA() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return (r, g, b, a)
    }
    
    func getHSBA() -> (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        
        return (h, s, b, a)
    }
    
    func getHSL() -> (hue: CGFloat, saturation: CGFloat, lightness: CGFloat) {
        let (r, g, b, _) = getRGBA()
        
        var h: CGFloat = 0
        var s: CGFloat = 0
        
        let v = max(r, g, b)
        let m = min(r, g, b)
        
        let l = (m + v) / 2
        
        let vm = v - m
        
        if l > 0 && vm > 0 {
            s = vm / ((l <= 0.5) ? (v + m) : (2 - v - m))
            
            let r2 = (v - r) / vm
            let g2 = (v - g) / vm
            let b2 = (v - b) / vm
            
            switch v {
            case r:
                h = ((g == m) ? (5 + b2) : (1 - g2))
            case g:
                h = ((b == m) ? (1 + r2) : (3 - b2))
            default:
                h = ((r == m) ? (3 + g2) : (5 - r2))
            }
        }
        
        return (h, s, l)
    }
    
    func getCMYK() -> (cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat) {
        let (r, g, b, _) = getRGBA()
        
        let k = 1 - max(r, g, b)
        let dK = 1 - k
        
        let c = (1 - (r + k)) / dK
        let m = (1 - (g + k)) / dK
        let y = (1 - (b + k)) / dK
        
        return (c, m, y, k)
    }
    
    // MARK:
    
    func brightness() -> CGFloat {
        let (r, g, b, _) = getRGBA()
        return sqrt(0.299 * r*r + 0.587 * g * g + 0.114 * b * b)
    }
    
    // MARK: Colors
    
    static func navy() -> UIColor {
        return UIColor(hex: 0x001f3f)
    }
    
    static func blue() -> UIColor {
        return UIColor(hex: 0x0074d9)
    }
    
    static func aqua() -> UIColor {
        return UIColor(hex: 0x7fdbff)
    }
    
    static func teal() -> UIColor {
        return UIColor(hex: 0x39cccc)
    }
    
    static func olive() -> UIColor {
        return UIColor(hex: 0x3d9970)
    }
    
    static func green() -> UIColor {
        return UIColor(hex: 0x2ecc40)
    }
    
    static func lime() -> UIColor {
        return UIColor(hex: 0x01ff70)
    }
    
    static func yellow() -> UIColor {
        return UIColor(hex: 0xffdc00)
    }
    
    static func orange() -> UIColor {
        return UIColor(hex: 0xff851b)
    }
    
    static func red() -> UIColor {
        return UIColor(hex: 0xff4136)
    }
    
    static func maroon() -> UIColor {
        return UIColor(hex: 0x85144b)
    }
    
    static func fuchsia() -> UIColor {
        return UIColor(hex: 0xf012be)
    }
    
    static func purple() -> UIColor {
        return UIColor(hex: 0xb10dc9)
    }
    
    static func black() -> UIColor {
        return UIColor(hex: 0x111111)
    }
    
    static func gray() -> UIColor {
        return UIColor(hex: 0xaaaaaa)
    }
    
    static func silver() -> UIColor {
        return UIColor(hex: 0xdddddd)
    }
    
    static func white() -> UIColor {
        return UIColor(hex: 0xffffff)
    }
    
}
