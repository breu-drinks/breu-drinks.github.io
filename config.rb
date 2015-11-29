###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'css'

set :js_dir, 'js'

set :images_dir, 'img'

# Slim configuration
Slim::Engine.set_default_options pretty: true, sort_attrs: false

# development configuration
configure :development do
  activate :livereload
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  compass_config do |config|
    config.output_style = :expanded
    config.line_comments = false
  end

  # Minify on build
  Slim::Engine.set_default_options pretty: false, sort_attrs: true
  activate :minify_css
  activate :minify_javascript

  # Favicon generator
  activate :favicon_maker, :icons => {
    "_favicon_template.png" => [
      { icon: "apple-touch-icon-152x152-precomposed.png" },
      { icon: "apple-touch-icon-114x114-precomposed.png" },
      { icon: "apple-touch-icon-72x72-precomposed.png" },
      { icon: "favicon.png", size: "16x16" },
      { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" }
    ]
  }

  # Compress images
  # https://github.com/toy/image_optim#binaries-installation
  # activate :imageoptim

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.remote = 'https://github.com/breu-drinks/breu-drinks.github.io.git'
end

helpers do
  def nav_link(name, url, options={})
    options = {
      class: "",
      active_if: url,
      page: current_page.url,
    }.update options
    active_url = options.delete(:active_if)
    active = Regexp === active_url ? current_page.url =~ active_url : current_page.url == active_url
    options[:class] += " active" if active

    link_to name, url, options
  end
end
