resource "aws_iam_role" "role" {
  name               = format("%s-ec2_instance_role", var.zookeeper_name)
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = format("%s-instance-profile", var.zookeeper_name)
  role = aws_iam_role.role.name
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}
