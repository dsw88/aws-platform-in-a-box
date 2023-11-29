#
# Cluster
#
resource "aws_eks_cluster" "cluster" {
  depends_on = [
    aws_iam_role_policy_attachment.control_plane,
  ]
  name     = var.name
  role_arn = aws_iam_role.control_plane.arn

  # TODO - More config here

  vpc_config {
    subnet_ids = var.control_plane_subnet_ids
  }
}

#
# Control Plane Log Group
#
resource "aws_cloudwatch_log_group" "cluster" {
  name              = "/aws/eks/${var.name}/cluster"
  retention_in_days = 7
}

#
# IAM Role
#
data "aws_iam_policy_document" "control_plane" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "control_plane" {
  name               = "${var.name}-eks-control-plaane"
  assume_role_policy = data.aws_iam_policy_document.control_plane.json
}

resource "aws_iam_role_policy_attachment" "control_plane" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.control_plane.name
}
