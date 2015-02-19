# Load .env variables
require 'dotenv'
Dotenv.load

###
# Site Settings
###

config[:site_name] = 'Matt Thurman Portfolio'

###
# Debugging
###

configure :development do
  require 'pry'
end

###
# Blog settings
###

# Time.zone = "Mountain Time (US & Canada)"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = "blog"

  blog.permalink = "{title}.html"
  # Matcher for blog source files
  blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  blog.layout = 'article_layout'
  blog.summary_separator = /(READMORE)/
  blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".erb"

  # blog.tag_template = "tag.html"
  # blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "page/{num}"

  # blog.custom_collections = {
  #   category: {
  #     link: '/{category}.html',
  #     template: '/blog/categories.html'
  #   }
  # }
end

# page "/feed.xml", layout: false

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

set :partials_dir, 'partials'

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page '/', layout: :home
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)


###
# Helpers
###

# set :helpers_dir, '/source/helpers'

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

activate :directory_indexes

# Methods defined in the helpers block are available in templates
# helpers do
# end

###
# Assets
###

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'
set :fonts_dir, 'assets/fonts'

activate :autoprefixer

# ready do
#   sprockets.append_path '/source/assets/pdfs'
# end

###
# Build-specific configuration
###

configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :s3_sync do |s3_sync|
  s3_sync.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
  s3_sync.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  s3_sync.bucket = ENV['S3_STAGING_BUCKET']
  # s3_sync.bucket = ENV['S3_BUCKET']
end

activate :cloudfront do |cf|
  cf.access_key_id = ENV['AWS_ACCESS_KEY_ID']
  cf.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  cf.distribution_id = ENV['CLOUDFRONT_DISTRIBUTION_ID']
  cf.filter = /\.html$/i
end


###
# S3 Redirects
###

# activate :s3_redirect do |config|
#   config.bucket = ENV['S3_BUCKET']
#   config.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
#   config.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
#   config.after_build = false
# end
