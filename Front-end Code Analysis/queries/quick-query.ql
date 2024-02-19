import javascript
predicate isMethod(Expr e) {
    e.getFile().getAbsolutePath() = "/home/sajad/Downloads/test-dapp-main/src/index.js"
    and (e.mayHaveStringValue("eth_signTypedData_v3")
    or e.mayHaveStringValue("eth_signTypedData_v4")
    //or e.mayHaveStringValue("eth_signTypedData")
    //or e.mayHaveStringValue("eth_sign")
    //or e.mayHaveStringValue("personal_sign")
    )
 }



from Expr e
where isMethod(e) 
//select e.getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0)
select e , e.getParent().getParent().getChild(1).getChild(1).getChild(1).getChild(0)
//select e.asExpr().getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0).toString()






//e.getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0).getContainer()

 //select e.getEnclosingFunction().getABodyStmt().getAChildExpr().getChild(0)

 // 


 //e.getParent().getParent().getChild(1).getChild(1).getChild(1).getChild(0).toString()//