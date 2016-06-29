import Foundation

public class Refund: ResourceObject {
    public override class var resourcePath: String { return "/refunds" }
    
    public var amount: Int64? {
        get { return get("amount", Int64Converter.self) }
        set { set("amount", Int64Converter.self, toValue: newValue) }
    }
    
    public var currency: String? {
        get { return get("currency", StringConverter.self) }
        set { set("currency", StringConverter.self, toValue: newValue) }
    }
    
    public var charge: String? {
        get { return get("charge", StringConverter.self) }
        set { set("charge", StringConverter.self, toValue: newValue) }
    }
    
    public var transaction: String? {
        get { return get("transaction", StringConverter.self) }
        set { set("transaction", StringConverter.self, toValue: newValue) }
    }
}

public class RefundParams: Params {
    public var amount: Int64? {
        get { return get("amount", Int64Converter.self) }
        set { set("amount", Int64Converter.self, toValue: newValue) }
    }
    
    public var void: Bool? {
        get { return get("void", BoolConverter.self) }
        set { set("void", BoolConverter.self, toValue: newValue) }
    }
}

extension Refund: ScopedCreatable {
    public typealias CreateParams = RefundParams
}

extension Refund: ScopedListable { }
extension Refund: ScopedInstanceRetrievable { }

func exampleRefund() {
    let charge = Charge()
    charge.id = "chrg_test_123"
    
    let params = RefundParams()
    params.amount = 100000 // 1,000.00 THB
    params.void = true
    
    Refund.create(parent: charge, params: params) { (result) in
        switch result {
        case let .Success(refund):
            print("created refund: \(refund.id)")
        case let .Fail(err):
            print("error: \(err)")
        }
    }
}