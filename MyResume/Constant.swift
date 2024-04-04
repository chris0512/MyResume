//
//  Constant.swift
//  MyResumeApp
//
//  Created by Jane Chao on 22/04/20.
//

import Foundation

typealias Experience = (title: String, company: String, start: String, end: String)

struct Resume {
    static let shared = Resume()
    let name     = "Chris"
    let title    = "iOS Developer"
    let location = "位置：台灣"
    let bio      = "熱衷於寫程式的iOS開發者🧑‍💻"
    let skills   = ["python", "swift", "mySQL", "xd"]
    let experiences: [Experience] = [
                                     ("iOS Developer",
                                      "SwiftUI",
                                      "2021 年 5 月",
                                      "2022 年 1 月"),
                                     ("Software Enginnering M.S.",
                                                                       "NTNU",
                                                                       "2022 年 4 月",
                                                                       "現在"),
                                     ("AI Developer",
                                      "AIA Acedemy",
                                      "2020 年 12 月",
                                      "2021 年 4 月")]
    let phoneUrl = "tel://0912345678"
    let socialMedia: [(name: String, url: String)] = [("LinkedIn","https://www.linkedin.com/in/profile/williamhgates"),
                                                      ("Line","https://line.me/ti/p/Fhgz4-NFLH"),
                                                      ("YouTube","https://www.youtube.com/channel/UCsssLDarjKe7K0YtuLrjpcw")]
}

