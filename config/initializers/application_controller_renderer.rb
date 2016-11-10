# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )

Dir[File.join(Rails.root, "lib", "ext", "*.rb")].each {|l| require l }
