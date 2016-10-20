#!/bin/bash

cd /opt/zammad

if [ ! -f /data/initialized ]; then
        export RAILS_ENV=production
        rake db:create
        rake db:migrate
        rake db:seed
        rake assets:precompile
        echo true > /data/initialized
fi
export RAILS_SERVE_STATIC_FILES=true
script/websocket-server.rb start &
script/scheduler.rb start &
rails s --binding=0.0.0.0 -p 80
