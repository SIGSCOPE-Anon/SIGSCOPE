import javascript

// A query to find references to 'eth_signTypedData_v4'
class EthSignTypedDataV4Reference extends DataFlow::Node {
    EthSignTypedDataV4Reference() {
      exists(StringLiteral s |
        s.getValue().indexOf("eth_signTypedData_v4") >= 0 and
        s = this.asExpr()
      )
    }
  }

// Find references to 'nonce' property in the code.
class NonceProperty extends DataFlow::SourceNode {
  NonceProperty() {
    exists(DataFlow::PropRead read |
      read.getPropertyName() = "nonce" and
      this = read
    )
  }
}



from EthSignTypedDataV4Reference ref, NonceProperty nonce
select ref, nonce
