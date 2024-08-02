resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "web" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.web_subnet_cidr
  availability_zone = "${var.region}a"
}

resource "aws_subnet" "db" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnet_cidr
  availability_zone = "${var.region}b"
}

resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port       = 1433
    to_port         = 1433
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid Windows Server 2019 AMI
  instance_type = var.web_instance_type
  subnet_id     = aws_subnet.web.id
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name        = "WebServer${count.index}"
    Environment = var.environment
  }
}

resource "aws_instance" "db" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid Windows Server 2019 AMI
  instance_type = var.db_instance_type
  subnet_id     = aws_subnet.db.id
  security_groups = [aws_security_group.db_sg.name]

  tags = {
    Name        = "DBServer"
    Environment = var.environment
  }
}

resource "aws_lb" "web" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web_sg.id]
  subnets            = [aws_subnet.web.id]

  enable_deletion_protection = false

  tags = {
    Name        = var.lb_name
    Environment = var.environment
  }
}

resource "aws_lb_listener" "web_listener" {
  load_balancer_arn = aws_lb.web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}

resource "aws_lb_target_group" "web" {
  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    interval            = 30
    path                = "/"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-299"
  }

  tags = {
    Name        = "WebTargetGroup"
    Environment = var.environment
  }
}

resource "aws_lb_target_group_attachment" "web_attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.web[count.index].id
  port             = 80
}


resource "aws_db_instance" "db" {
  identifier        = "db-instance"
  allocated_storage = 20
  engine            = "sqlserver-se"
  engine_version    = "15.00.4043.16.v1"
  instance_class    = var.db_instance_type
  username          = var.db_username
  password          = var.db_password
  db_subnet_group_name = aws_db_subnet_group.main.name
  skip_final_snapshot  = true

  tags = {
    Name        = "DatabaseInstance"
    Environment = var.environment
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = [aws_subnet.db.id]

  tags = {
    Name        = "MainSubnetGroup"
    Environment = var.environment
  }
}
