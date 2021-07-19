//
//  User.swift
//  SB_HW2.3
//
//  Created by Vladislav Kulak on 16.07.2021.
//

public struct User {
    public let username: String
    public let password: String
    public let age: Int
    public let address: String
    public let description: String
}

extension User {
    public static func getUser() -> User {
    
        return User(
            username: "Vladislav",
            password: "123456",
            age: 26,
            address: "г.Уфа",
            description: "Тут какое то очень длинное описание которое вы можете поменять на что угодно."
        )
    }
}
