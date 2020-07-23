//
//  Styles.swift
//  MyACNHTracker
//
//  Created by Krista Nittmann on 7/4/20.
//  Copyright © 2020 Krista Nittmann. All rights reserved.
//

import Foundation
import SwiftUI

/// https://swiftwithmajid.com/2019/08/28/composable-styling-in-swiftui/
struct ItemTitleStyle: ViewModifier {
    let font = Font.system(size: 16).weight(.semibold)

    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .font(font)
        }
}

struct ItemBodyStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("HelveticaNeue-Bold", size: 16))
            .foregroundColor(Color.gray)
    }
}

struct ItemCellTitleStyle: ViewModifier {
    let font = Font.system(size: 16).weight(.heavy)

    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .font(font)
            .padding([.leading], 10)
            .padding([.top, .bottom], 5)
        }
}

struct ItemCellBodyStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("HelveticaNeue-Bold", size: 16))
            .foregroundColor(Color.white)
            .padding([.trailing], 10)
            .padding([.top, .bottom], 5)
    }
}

struct ItemCell: ViewModifier {
    func body(content: Content) -> some View {
           content
               .background(Color("ACNHTeal"))
               .cornerRadius(7)
       }
}

struct CardOverlayStyle: ViewModifier {
    let font = Font.system(size: 16).weight(.semibold)

    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(Color.white)
            .padding([.leading, .trailing], 16)
            .padding([.top, .bottom], 8)
            .background(Color("ACNHTeal"))
            .mask(RoundedCorners(tl: 0, tr: 0, bl: 0, br: 15))
        }
}

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}

struct RoundedCorners: Shape {
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let w = rect.size.width
        let h = rect.size.height
        
        let tr = min(min(self.tr, h/2), w/2)
        let tl = min(min(self.tl, h/2), w/2)
        let bl = min(min(self.bl, h/2), w/2)
        let br = min(min(self.br, h/2), w/2)
        
        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        
        return path
    }
}

