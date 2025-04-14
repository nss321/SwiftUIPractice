//
//  Menu.swift
//  SwiftUIPractice
//
//  Created by BAE on 4/14/25.
//

struct Menu: Hashable {
    let icon: String
    let title: String
    let subtitle: String
    let noti: String?
    
    init(icon: String, title: String, subtitle: String, noti: String? = nil) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.noti = noti
    }
    
    static var mockData: [Self] {
        [
            Menu(icon: "leaf", title: "오늘의 행운복권", subtitle: "포인트 받기"),
            Menu(icon: "play.circle", title: "라이브 쇼핑", subtitle: "포인트 받기"),
            Menu(icon: "q.circle", title: "청운커즈", subtitle: "추가 혜택 보기"),
            Menu(icon: "heart.circle", title: "이벤트 퀴 마션", subtitle: "열면 받을지 보기"),
            Menu(icon: "paintbrush", title: "두근두근 1등 찍기", subtitle: "포인트 받기", noti: "새로 나온"),
            Menu(icon: "star", title: "임주일 방문 미션", subtitle: "포인트 받기"),
            Menu(icon: "bell", title: "매일 알림", subtitle: "포인트 받기"),
            Menu(icon: "printer", title: "등혹 현금영수증 등록", subtitle: "10원 받기"),
            Menu(icon: "gift", title: "친절충전 이벤트", subtitle: "모아보기")
        ]
    }
}
