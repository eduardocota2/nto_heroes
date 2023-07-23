# Setup Server

## [Ports]
```
sudo ufw allow ssh
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 7171/tcp
sudo ufw allow 7172/tcp
sudo ufw enable
```

## [Apache2]
```
sudo apt install apache2
```

## [Mysql]
```
sudo apt install mysql
```

## [Php]
```
sudo apt install php7.4 php7.4-mysql php-common php7.4-cli php7.4-json php7.4-common php7.4-opcache libapache2-mod-php7.4
```

## [PhpMyAdmin]
```
sudo apt install phpmyadmin
```

# Docker
```
sudo docker build -t otserver-container .
```
```
sudo docker run -d --name otserver-instance --network="host" otserver-container
```

# Configuration

## [Mysql]
```
CREATE USER 'newAdmin'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'newAdmin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

# Utilities

## [Unrar]
```
sudo apt install unrar
```

