import javascript
import DataFlow
predicate isMethod(Expr e) {
    e.getFile().getAbsolutePath() = "/home/sajad/Downloads/test-dapp-main/src/index.js"
    and (e.mayHaveStringValue("eth_signTypedData_v3")
    )
 }

 predicate isMethod2(Expr e) {
    e.getFile().getAbsolutePath() = "/home/sajad/Downloads/test-dapp-main/src/index.js"
    and (e.mayHaveStringValue("eth_signTypedData_v3")
    )
 }

class CommandLineFileNameConfiguration extends TaintTracking::Configuration {
    CommandLineFileNameConfiguration() { this = "CommandLineFileNameConfiguration" }
  
    override predicate isSource(Node source) {
      exists(Expr e | isMethod(e)| source = e.flow())
    }
  
    override predicate isSink(Node sink) {
      exists(Expr e | isMethod2(e)| sink = e.flow())
    }
  }
  
  from CommandLineFileNameConfiguration cfg, Node source, Node sink
  where cfg.hasFlow(source, sink)
  select source, source.getStartLine(), sink , sink.getStartLine()
  