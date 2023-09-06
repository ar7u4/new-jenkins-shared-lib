
aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name         = "demo-cluster1"
        eks_subnet_ids = ["subnet-08324535502b2b0ca", "subnet-079cff8b160f334a7", "subnet-069f52eb4a2ff229b", "subnet-0d8235313046da020",]
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
        node_subnet_ids          = ["subnet-08324535502b2b0ca", "subnet-079cff8b160f334a7", "subnet-069f52eb4a2ff229b", "subnet-0d8235313046da020",]

        tags = {
             "Name" =  "node1"
         } 
  }
}