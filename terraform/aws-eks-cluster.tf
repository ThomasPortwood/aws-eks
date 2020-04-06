resource "aws_iam_role" "default-cluster" {
  name = "default-cluster"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks-cluster-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.default-cluster.name
}

resource "aws_iam_role_policy_attachment" "eks-service-policy-attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role = aws_iam_role.default-cluster.name
}

resource "aws_eks_cluster" "default" {
  name = "default"
  role_arn = aws_iam_role.default-cluster.arn
  vpc_config {
    subnet_ids = [aws_subnet.default-us-west-2a.id, aws_subnet.default-us-west-2b.id]
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-policy-attachment,
    aws_iam_role_policy_attachment.eks-service-policy-attachment
  ]
}


