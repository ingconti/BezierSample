//
//  CustomView.swift
//  BezierSample
//
//  Created by ing.conti on 5/9/18.
//  Copyright © 2018 ing.conti. All rights reserved.
//

import Cocoa

class CustomView: NSView {
	
	var angle = CGFloat(0)
	
	override func draw(_ dirtyRect: NSRect) {
		super.draw(dirtyRect)
		
		// Drawing code here
		
		let rect = self.frame
		
		let width = rect.size.width
		let height = rect.size.height
		let r1 = CGRect(x: 10, y: 10, width: width-20, height: height-20)
		let path = NSBezierPath(roundedRect: r1, xRadius: 30, yRadius: 40)
		NSColor.red.setFill()
		path.fill()
		
		let r2 = CGRect(x: 80, y: 20, width: 40, height: 40)
		let path2 = NSBezierPath(roundedRect: r2, xRadius: 30, yRadius: 40)
		NSColor.green.setFill()
		path2.fill()
		

		let r3 = CGRect(x: 100, y: 50, width: 100, height: 40)
		let path3 = NSBezierPath(roundedRect: r3, xRadius: 0, yRadius: 0)
		NSColor.blue.setFill()
		
		path3.transform(using: AffineTransform(rotationByRadians: self.angle))

		path3.fill()
	}
	
	
	override func mouseUp(with event: NSEvent) {
		self.angle = 0
		self.display()
	}
	
	
	override func mouseDragged(with event: NSEvent) {
		
		super.mouseDragged(with: event)
		let newPt = event.locationInWindow
		let origin = CGPoint(x: 0, y: 0)
		let x = origin.x-newPt.x
		let y = origin.y-newPt.y
		self.angle = atan(y/x)
		self.display()
	}
}

