$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'active_hash/kaminari'
require 'active_hash'

# Avoid kaminari gem's warning 'no framework detected.'
module Sinatra; end

require 'kaminari'
require 'kaminari/models/array_extension'

require 'minitest/autorun'
