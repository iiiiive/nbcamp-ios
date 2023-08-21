//
//  ProfileViewController.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-14.
//

import UIKit

class ProfileViewController: UIViewController {
	var hour: Int = 0
	var minute: Int = 0
	var second: Int = 0
	var timer: Timer?
	@IBOutlet weak var usernameLabel: UILabel!
	@IBOutlet weak var timerLabel: UILabel!
	@IBOutlet weak var startTimeLabel: UILabel!
	@IBOutlet weak var attendanceTimeLabel: UILabel!
	@IBOutlet weak var saveTimerLabel: UILabel!
	@IBOutlet weak var admissionButton: UIButton!
	@IBOutlet weak var pauseButton: UIButton!
	
	@IBAction func admission(_ sender: UIButton) {
		if let timer = timer {
			let alert = UIAlertController(title: "퇴실 하시겠습니까?", message: nil, preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
			alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (_) in
				timer.invalidate()
				self.timer = nil
				sender.setTitle("입실", for: .normal)
				self.timerLabel.text = "00:00:00"
			}))
			present(alert, animated: true, completion: nil)
		} else {
			timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
			sender.setTitle("퇴실", for: .normal)
			startTimeLabel.text = DateTimeFormatter.createDateTime()
			attendanceTimeLabel.text = DateTimeFormatter.createDateTime()
		}
	}
	@IBAction func pause(_ sender: UIButton) {
		if let timer = timer {
			let alert = UIAlertController(title: "외출 하시겠습니까?", message: nil, preferredStyle: .alert)
			alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
			alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (_) in
				timer.invalidate()
				self.timer = nil
				self.timerLabel.textColor = ColorManager.nbcTertiaryColor
				sender.setTitle("복귀", for: .normal)
			}))
			present(alert, animated: true, completion: nil)
		}
		if sender.titleLabel?.text == "복귀" {
			timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
			self.timerLabel.textColor = ColorManager.nbcAccentColor
			sender.setTitle("외출", for: .normal)
			startTimeLabel.text = DateTimeFormatter.createDateTime()
			attendanceTimeLabel.text = DateTimeFormatter.createDateTime()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setUsername()
		setTimerLabel()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		print(MockManager.shared.user.username)
		setUsername()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
	
	private func setUsername() {
		let user = MockManager.shared.user
		usernameLabel.text = user.username + "님, 오늘도 달려볼까요?"
	}
	
	private func setTimerLabel() {
		timerLabel.layer.cornerRadius = CGFloat(10.0)
		timerLabel.layer.borderColor = ColorManager.nbcAccentColor?.cgColor
		timerLabel.layer.borderWidth = CGFloat(1.0)
	}
	
	@objc func updateTimeLabel() {
		second += 1
		if second == 60 {
			second = 0
			minute += 1
		}
		if minute == 60 {
			minute = 0
			hour += 1
		}
		if hour == 60 {
			hour = 0
		}
		let timer = String(format: "%02d:%02d:%02d", hour, minute, second)
		timerLabel.text = timer
		saveTimerLabel.text = timer
		print("시간 업데이트: \(timer)")
	}
}
