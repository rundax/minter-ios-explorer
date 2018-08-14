//
//  TransactionMappable.swift
//  MinterExplorer
//
//  Created by Alexey Sidorov on 21/05/2018.
//

import Foundation
import ObjectMapper
import BigInt



/// Transaction Model
open class Transaction {
	
	/// Transaction type
	public enum TransactionType: String {
		case send = "send"
		case buy = "buyCoin"
		case sell = "sellCoin"
		case sellAllCoins = "sellAllCoin"
	}
	
	public init() {}
	
	public var hash: String?
	public var type: TransactionType?
	public var txn: Int?
	public var data: TransactionData?
	public var date: Date?
}


/// Transaction Mapper
class TransactionMappable : Transaction, Mappable {
	
	private static let dateFormatter = DateFormatter(withFormat: "yyyy-MM-dd HH:mm:ss+zzzz", locale: Locale.current.identifier)
	
	//MARK: - Mappable
	
	required init?(map: Map) {
		super.init()
	}
	
	func mapping(map: Map) {
		self.hash <- map["hash"]
		self.type <- map["type"]
		self.txn <- map["txn"]
		
		if nil != type, let data = map.JSON["data"] as? [String : Any] {
			switch type! {
			case .sell, .buy:
				self.data = Mapper<ConvertTransactionDataMappable>().map(JSON: data)
				break
				
			case .send:
				self.data = Mapper<SendCoinTransactionDataMappable>().map(JSON: data)
				break
				
			case .sellAllCoins:
				self.data = Mapper<SellAllCoinsTransactionDataMappable>().map(JSON: data)
				break
			}
		}
		self.date <- (map["timestamp"], DateFormatterTransform(dateFormatter: TransactionMappable.dateFormatter))
	}

}
