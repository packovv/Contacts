//
//  DataManager.swift
//  Contacts
//
//  Created by packovv on 08.02.2022.
//

import Foundation

// 1. Непонятно что тут происходит
// 2. Если у тебя тут будет БД - singleton не лучший вариант для доступа, потому что тогда у тебя не будет решена проблема race condition, а это даст непредсказуемые результаты при обращении в БД за данными, может вернуться все что угодно, посмотри реализацию Realm через паттерн DAO, попробуешь реализовать?

class DataManager {

static let shared = DataManager()
    
}



