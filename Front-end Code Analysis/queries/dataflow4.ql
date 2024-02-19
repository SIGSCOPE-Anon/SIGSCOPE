import javascript
import DataFlow
import DataFlow::PathGraph

class MyConfig extends TaintTracking::Configuration {
    predicate isMethod(Expr e) {
        e.getFile().getAbsolutePath() = "/home/sajad/Downloads/test-dapp-main/src/index.js"
        and (e.mayHaveStringValue("eth_signTypedData_v3")
        or e.mayHaveStringValue("eth_signTypedData_v4")
        //or e.mayHaveStringValue("eth_signTypedData")
        //or e.mayHaveStringValue("eth_sign")
        //or e.mayHaveStringValue("personal_sign")
        )
     }

    predicate mySource(Node c1) {
        exists(Expr e | isMethod(e)| c1.asExpr() = e.getParent().getParent().getChild(1).getChild(1).getChild(1).getChild(0))
    
    }
    
    
    predicate mySink(Node c2) {
        exists(Expr e | isMethod(e)| c2.asExpr() = e.getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0))
    }

  MyConfig() { this = "MyConfig" }
  override predicate isSource(Node node) { 
    exists(Expr e | isMethod(e)| node.asExpr() = e.getParent().getParent().getChild(1).getChild(1).getChild(1).getChild(0))
   }
  override predicate isSink(Node node) { 
    exists(Expr e | isMethod(e)| node.asExpr() = e.getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0))
}
  //override predicate isAdditionalTaintStep(Node pred, Node succ) { ... }
}

from MyConfig cfg, PathNode source, PathNode sink
where cfg.hasFlowPath(source, sink)
select  sink.getNode() , source.getNode()