//
//  Pendulum.swift
//  UIViewControls
//
//  Created by CongCong on 10/2/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit
let MAX_ANGLE: Double = M_PI_4 * 0.5
class Pendulum: UIViewController {
var angle = MAX_ANGLE
var x1: Double = -0.01
var pendulum = UIImageView()
var switchMode = UISwitch()
var slider = UISlider()
var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        
        super.loadView()
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.slider = UISlider(frame: CGRect(x: 10, y: 50, width: 300, height: 20))
        self.slider.addTarget(self, action: "SliderChange:", forControlEvents: UIControlEvents.TouchUpInside)
        self.slider.tintColor = UIColor.redColor()
        self.slider.thumbTintColor = UIColor.greenColor()
        self.view.addSubview(self.slider)
        
        switchMode = UISwitch(frame: CGRect(x: 10, y: 100, width: 20, height: 20))
        switchMode.addTarget(self, action: "switchModeChange:", forControlEvents: UIControlEvents.TouchUpInside)
        switchMode.tintColor = UIColor.redColor()
        switchMode.thumbTintColor = UIColor.greenColor()
        self.view.addSubview(switchMode)
        
        self.pendulum = UIImageView(image: UIImage(named: "pendulum.png"))
        self.pendulum.bounds = CGRect(x: 0, y: 0, width: 20, height: 300)
        self.pendulum.center = CGPoint(x: self.view.bounds.width / 2, y: 200)
        self.pendulum.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        self.pendulum.transform = CGAffineTransformMakeRotation(CGFloat(self.angle))
        self.view.addSubview(self.pendulum)
        
        
        
    }
    func changeAngle(angle: CGFloat) {
        
        self.angle += self.x1
        self.slider.value = Float(self.angle + MAX_ANGLE) / (Float(2) * Float(MAX_ANGLE))
        if self.angle > MAX_ANGLE || self.angle < -MAX_ANGLE {
            self.x1 = -self.x1
        }
        self.pendulum.transform = CGAffineTransformMakeRotation(CGFloat(self.angle))
    }
    
    func switchModeChange(switchMode: UISwitch) {
        if switchMode.on {
            startAnimation()
        } else {
            self.timer.invalidate()
        }
    }
    func SliderChange(slider: UISlider) {
    }
    
    func startAnimation() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "changeAngle:", userInfo: nil, repeats: true)
    }
}


//#import "ViewController.h"
//#define MAX_ANGLE M_PI_4 * 0.5
//@interface ViewController ()
//{
//    NSTimer *_timer;
//    double _angle;
//    double _angleDelta;
//}
//@property (weak, nonatomic) IBOutlet UIImageView *pendulum;
//@property (weak, nonatomic) IBOutlet UISlider *sliderAngle;
//
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    CGSize size = self.pendulum.bounds.size;
//    
//    self.pendulum.layer.anchorPoint = CGPointMake(0.5, 0);
//    self.pendulum.frame = CGRectMake((self.view.bounds.size.width - size.width)* 0.5, 20, size.width, size.height);
//    
//    _angle = 0.0;
//    _angleDelta = 0.05;
//    
//    }
//    
//    - (void) startAnimation
//        {
//            _timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
//                target: self
//                selector: @selector(animatePendulum)
//            userInfo: nil
//            repeats: YES];
//            [_timer fire];
//        }
//        - (IBAction)startStopAnimation:(UISwitch *)sender {
//            if ([sender isOn]) {
//                [self startAnimation];
//                self.sliderAngle.enabled = NO;
//            } else if (_timer.isValid) {
//                [_timer invalidate];
//                _timer = nil;
//                self.sliderAngle.enabled = YES;
//            }
//            
//            }
//            
//            - (void) animatePendulum
//                {
//                    _angle += _angleDelta;
//                    if ((_angle > MAX_ANGLE) | (_angle < - MAX_ANGLE)) {
//                        _angleDelta = - _angleDelta;
//                    }
//                    self.pendulum.transform = CGAffineTransformMakeRotation(_angle);
//                    NSLog(@"%3.2f - %3.2f", self.pendulum.center.x  , self.pendulum.center.y); //Chứng minh khi rotate center của UIView không đổi
//                    
//                }
//                - (IBAction)changeAngle:(UISlider *)sender {
//                    self.pendulum.transform = CGAffineTransformMakeRotation(MAX_ANGLE * sender.value);
//                }
//                
//@end