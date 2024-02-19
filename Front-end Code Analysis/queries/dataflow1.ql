import javascript

predicate isMethod(Expr e) {
    e.getFile().getAbsolutePath() = "/home/sajad/Downloads/test-dapp-main/src/index.js"
    and (e.mayHaveStringValue("eth_signTypedData_v4")
    //or e.mayHaveStringValue("eth_signTypedData_v4")
    //or e.mayHaveStringValue("eth_signTypedData")
    //or e.mayHaveStringValue("eth_sign")
    //or e.mayHaveStringValue("personal_sign")
    )
 }

 predicate mySource(DataFlow::Node c1) {
    exists(Expr e | isMethod(e)| c1.asExpr() = e.getParent().getParent().getChild(1).getChild(1).getChild(1).getChild(0))

}


predicate mySink(DataFlow::Node c2) {
    exists(Expr e | isMethod(e)| c2.asExpr() = e.getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0))
}

from DataFlow::Node c1 , DataFlow::Node c2
where  mySource(c1) and mySink(c2) 
select c1 , c1.getStartLine() , c2 , c2.getStartLine()