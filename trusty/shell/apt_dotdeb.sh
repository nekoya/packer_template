echo "deb http://mirrors.teraren.com/dotdeb/ wheezy all\ndeb-src http://packages.dotdeb.org wheezy all" > /etc/apt/sources.list.d/dotdeb.list
curl -L http://www.dotdeb.org/dotdeb.gpg | apt-key add -
