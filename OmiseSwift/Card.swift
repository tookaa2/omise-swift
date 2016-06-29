import Foundation

public class Card: ResourceObject {
    public var country: String? {
        get { return get("country", StringConverter.self) }
        set { set("country", StringConverter.self, toValue: newValue) }
    }
    
    public var city: String? {
        get { return get("city", StringConverter.self) }
        set { set("city", StringConverter.self, toValue: newValue) }
    }
    
    public var bank: String? {
        get { return get("bank", StringConverter.self) }
        set { set("bank", StringConverter.self, toValue: newValue) }
    }
    
    public var postalCode: String? {
        get { return get("postal_code", StringConverter.self) }
        set { set("postal_code", StringConverter.self, toValue: newValue) }
    }
    
    public var financing: String? {
        get { return get("financing", StringConverter.self) }
        set { set("financing", StringConverter.self, toValue: newValue) }
    }
    
    public var lastDigits: String? {
        get { return get("last_digits", StringConverter.self) }
        set { set("last_digits", StringConverter.self, toValue: newValue) }
    }
    
    public var brand: String? {
        get { return get("brand", StringConverter.self) }
        set { set("brand", StringConverter.self, toValue: newValue) }
    }
    
    public var expirationMonth: Int? {
        get { return get("expiration_month", IntConverter.self) }
        set { set("expiration_month", IntConverter.self, toValue: newValue) }
    }
    
    public var expirationYear: Int? {
        get { return get("expiration_year", IntConverter.self) }
        set { set("expiration_year", IntConverter.self, toValue: newValue) }
    }
    
    public var fingerprint: String? {
        get { return get("fingerprint", StringConverter.self) }
        set { set("fingerprint", StringConverter.self, toValue: newValue) }
    }
    
    public var name: String? {
        get { return get("name", StringConverter.self) }
        set { set("name", StringConverter.self, toValue: newValue) }
    }
    
    public var securityCodeCheck: Bool? {
        get { return get("security_code_check", BoolConverter.self) }
        set { set("security_code_check", BoolConverter.self, toValue: newValue) }
    }
}

public class CardParams: Params {
    public var name: String? {
        get { return get("name", StringConverter.self) }
        set { set("name", StringConverter.self, toValue: newValue) }
    }
    
    public var expirationMonth: Int? {
        get { return get("expiration_month", IntConverter.self) }
        set { set("expiration_month", IntConverter.self, toValue: newValue) }
    }
    
    public var expirationYear: Int? {
        get { return get("expiration_year", IntConverter.self) }
        set { set("expiration_year", IntConverter.self, toValue: newValue) }
    }
    
    public var postalCode: String? {
        get { return get("postal_code", StringConverter.self) }
        set { set("postal_code", StringConverter.self, toValue: newValue) }
    }
    
    public var city: String? {
        get { return get("city", StringConverter.self) }
        set { set("city", StringConverter.self, toValue: newValue) }
    }
}

extension Card: ScopedListable { }
extension Card: ScopedInstanceRetrievable { }
extension Card: ScopedDestroyable { }

extension Card: ScopedUpdatable {
    public typealias UpdateParams = CardParams
}

func exampleCard() {
    let customer = Customer()
    customer.id = "cust_test_123"
    
    Card.list(parent: customer) { (result) in
        switch result {
        case let .Success(cards):
            print("cards: \(cards)")
        case let .Fail(err):
            print("error: \(err)")
        }
    }
}