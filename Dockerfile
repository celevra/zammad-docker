FROM ubuntu
RUN apt-get update
RUN apt-get install -y nano wget
# ruby basics
RUN apt-get install -y ruby ruby-dev ruby-bundler ruby-json ruby-wirble rake
# gem 'oj', 'puma', 'byebug'
RUN apt-get install -y make gcc libc-dev
# gem 'unf_ext'
RUN apt-get install -y g++
# app dependencies
RUN apt-get install -y ca-certificates libmysqlclient-dev nodejs

# clear after installation
RUN apt-get autoclean

RUN wget http://ftp.zammad.com/zammad-latest.tar.gz
RUN mkdir -p /opt/zammad
RUN tar xvfz zammad-latest.tar.gz -C /opt/zammad/
RUN rm zammad-latest.tar.gz
RUN cd /opt/zammad && gem install bundler && bundle install --without test development postgres

ADD database.yml /opt/zammad/config/database.yml
RUN mkdir /data
ADD start.sh /
RUN chmod 755 /start.sh
CMD ["/start.sh"]
