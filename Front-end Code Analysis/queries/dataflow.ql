import javascript
predicate isMethod(Expr e) {
    e.getFile().getAbsolutePath() = "/home/sajad/Downloads/test-dapp-main/src/index.js"
    and (e.mayHaveStringValue("eth_signTypedData_v3")
    //or e.mayHaveStringValue("eth_signTypedData_v4")
    //or e.mayHaveStringValue("eth_signTypedData")
    //or e.mayHaveStringValue("eth_sign")
    //or e.mayHaveStringValue("personal_sign")
    )
 }

 /*

from DataFlow::Node c1, Expr e1
where isMethod(e1) and c1.asExpr() = e1.getParent().getParent().getChild(1).getChild(1).getChild(1).getChild(0) 
select c1


from DataFlow::Node c2, Expr e2
where isMethod(e2) and c2.asExpr() = e2.getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0)
select c2
*/


predicate mySource(DataFlow::Node c1) {
    exists(Expr e | isMethod(e)| c1.asExpr() = e.getParent().getParent().getChild(1).getChild(1).getChild(1).getChild(0))

}


predicate mySink(DataFlow::Node c2) {
    exists(Expr e | isMethod(e)| c2.asExpr() = e.getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0))
}

/*
from DataFlow::Node n
where mySource(n)
select n
*/


class CommandLineFileNameConfiguration extends TaintTracking::Configuration {
  CommandLineFileNameConfiguration() { this = "CommandLineFileNameConfiguration" }

  override predicate isSource(DataFlow::Node source) {
    exists(Expr e | isMethod(e)| source.asExpr().toString() = e.getParent().getParent().getChild(1).getChild(1).getChild(1).getChild(0).toString())
  }

  override predicate isSink(DataFlow::Node sink) {
    exists(Expr e | isMethod(e)| sink.asExpr().toString() = e.getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0).toString())
  }
}

from CommandLineFileNameConfiguration cfg, DataFlow::Node source, DataFlow::Node sink
where cfg.hasFlow(source, sink)
select source, source.getStartLine(), sink , sink.getStartLine()
