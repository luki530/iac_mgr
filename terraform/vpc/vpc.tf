resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/24"
}
resource "aws_subnet" "zookeeper_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.0/28"
  availability_zone = local.azs[0]
}
resource "aws_subnet" "zookeeper_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.16/28"
  availability_zone = local.azs[1]
}
resource "aws_subnet" "zookeeper_c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.32/28"
  availability_zone = local.azs[2]
}
resource "aws_subnet" "kafka_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.48/28"
  availability_zone = local.azs[0]
}
resource "aws_subnet" "kafka_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.64/28"
  availability_zone = local.azs[1]
}
resource "aws_subnet" "kafka_c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.80/28"
  availability_zone = local.azs[2]
}
