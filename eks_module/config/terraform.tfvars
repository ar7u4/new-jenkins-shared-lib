
aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name         = "demo-cluster1"
        eks_subnet_ids = ["subnet-0f97f59218e1eb5ff","subnet-0f4b9208bc21f373e","	subnet-00a23c858de49eed6",]
        tags = {
             "Name" =  "demo-cluster"
         }  
      }
}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "demo-cluster"
        node_group_name          = "mynode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-0f97f59218e1eb5ff","subnet-0f4b9208bc21f373e","	subnet-00a23c858de49eed6",]

        tags = {
             "Name" =  "node1"
         } 
  }
}