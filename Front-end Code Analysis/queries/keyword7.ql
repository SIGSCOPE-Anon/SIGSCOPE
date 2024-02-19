import javascript

// Find all calls to a function named `eth_signTypedData_v4`.
class EthSignTypedDataV4Call extends DataFlow::CallNode {
  EthSignTypedDataV4Call() {
    this.getCalleeName() = "eth_signTypedData_v4";
  }
}

// Create a query to find calls to `eth_signTypedData_v4` and retrieve the argument.
from EthSignTypedDataV4Call call, DataFlow::ObjectLiteralNode object, DataFlow::PropWrite propWrite
where
  // Ensure the second argument of the call is an ObjectLiteral.
  object = call.getArgument(1).asExpr().(DataFlow::ObjectLiteralNode) and
  // Ensure there is a property write for `nonce` within the object.
  propWrite = object.getAPropertyWrite() and
  propWrite.getPropertyName() = "nonce"
select call, object, propWrite
