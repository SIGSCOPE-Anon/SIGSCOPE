import javascript
import DataFlow

/**
 * @name Use of eth_signTypedData_v4 with nonce property
 * @description Finds instances where the nonce property is used in conjunction with the eth_signTypedData_v4 method.
 * @kind path-problem
 */

class Configuration extends DataFlow::Configuration {
  Configuration() { this = "eth_signTypedData_v4 with nonce property" }

  override predicate isSource(DataFlow::Node source) {
    exists(PropRead pr | pr.getPropertyName() = "nonce" and source = pr)
  }

  override predicate isSink(DataFlow::Node sink) {
    exists(DataFlow::CallNode call | call.getCalleeName() = "eth_signTypedData_v4" and sink = call.getAnArgument())
  }
}

from Configuration config, DataFlow::PathNode source, DataFlow::PathNode sink
where config.hasFlowPath(source, sink)
select sink, source, sink, "This call to eth_signTypedData_v4 is passed a nonce."
