import javascript
import DataFlow
import DataFlow::PathGraph

predicate isMethod(Expr e) {
    e.getFile().getAbsolutePath() = "/home/sajad/Downloads/test-dapp-main/src/index.js"
    and (//e.mayHaveStringValue("eth_signTypedData_v3")
     e.mayHaveStringValue("eth_signTypedData_v4")
    //or e.mayHaveStringValue("eth_signTypedData")
    //or e.mayHaveStringValue("eth_sign")
    //or e.mayHaveStringValue("personal_sign")
    )
 }

 predicate mySource(DataFlow::Node c1) {
    exists(Expr e | isMethod(e)| c1.asExpr() = e.getParent().getParent().getChild(1).getChild(1).getChild(1).getChild(0))

}

predicate mySink(DataFlow::Node c2) {
    exists(Expr e | isMethod(e) | c2.asExpr() = e.getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0))
}


predicate relation(DataFlow::Node node1 , DataFlow::Node node2) {
    mySource(node1) and mySink(node2) and node1.toString() = node2.toString() 
}


from DataFlow::Node node1 , DataFlow::Node node2
where relation(node1, node2)
select node1 as source, node1.getStartLine() , node2 as sink, node2.getStartLine()


/*
from DataFlow::Node node
where  mySource(node) 
select node , node.asExpr().getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0)
*/