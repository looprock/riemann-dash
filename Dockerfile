FROM ubuntu
MAINTAINER Doug Land <dland@ojolabs.com>

# Install dependencies
RUN apt-get update
RUN apt-get install -y rubygems
RUN gem install --no-rdoc --no-ri riemann-client riemann-tools riemann-dash

# Expose the ports for inbound events and websockets
EXPOSE 4567

# Share the config directory as a volume
VOLUME /etc/riemann
ADD config.rb /etc/riemann/config.rb
ADD config.json /etc/riemann/config.json

# Set the hostname in /etc/hosts so that Riemann doesn't die due to unknownHostException
CMD echo 127.0.0.1 $(hostname) > /etc/hosts; cd /etc/riemann && /usr/local/bin/riemann-dash
