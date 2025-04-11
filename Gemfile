source 'https://rubygems.org'

# If you want to use GitHub Pages, uncomment this line and comment out the 'jekyll' gem line
gem "github-pages", group: :jekyll_plugins
# gem "jekyll" # Comment this out when using github-pages

group :jekyll_plugins do
  gem 'jekyll-feed'
  gem 'jekyll-seo-tag'
  gem 'jekyll-sitemap'
end

# Windows and JRuby does not include zoneinfo by default
platforms :mingw, :mswin, :x64_mingw, :jruby do
  gem 'tzinfo', '~> 2.0'
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
end

# Performance-booster for watching directories on Linux systems
platforms :ruby do
  gem 'listen', '>= 3.2', '< 4.0'
end

# Use Ruby 3.0+ for best performance
ruby '>= 2.7.0'
