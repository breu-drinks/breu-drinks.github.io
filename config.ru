require 'middleman/rack'

Slim::Engine.disable_option_validator!
run Middleman.server
