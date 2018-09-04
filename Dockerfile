FROM node:latest
MAINTAINER Vagabondan "strannix.vagabondan@gmail.com"

# Getting sources list
RUN apt-get update
# Installing graphicsmagick
RUN apt-get install -y --no-install-recommends graphicsmagick
# Installing temporary apps
RUN apt-get install -y --no-install-recommends unzip
RUN apt-get install -y --no-install-recommends git
# Installing Total.js CMS
WORKDIR /cms
RUN git clone https://github.com/totaljs/eshop.git ./

# RUN mkdir /cms && cd /cms && wget https://github.com/KaMeHb-UA/total.js-cms-releases/raw/master/sourcecode.zip -O temp.zip && unzip temp.zip && rm temp.zip && npm install
RUN npm install total.js
RUN npm install paypal-express-checkout
# Removing temporary apps
RUN apt-get remove -y unzip git
# Removing sources list
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 8000

CMD ["bash", "-c", "cd /cms && node debug.js"]

