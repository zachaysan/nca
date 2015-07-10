# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.
require 'nanoc/cachebuster'

include Nanoc::Helpers::LinkTo
include Nanoc3::Helpers::CacheBusting
