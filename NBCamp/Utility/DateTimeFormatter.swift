//
//  DateTimeFormatter.swift
//  NBCamp
//
//  Created by Yujin Kim on 2023-08-17.
//

import Foundation

class DateTimeFormatter {
	static func createDateTime() -> String {
		let dateTimeFormatter: DateFormatter = DateFormatter()
		dateTimeFormatter.dateFormat = "MM. dd. HH:mm"
		return dateTimeFormatter.string(from: Date())
	}
}
