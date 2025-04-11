require 'open-uri'
require 'rexml/document'
require 'time'

Jekyll::Hooks.register :site, :pre_render do |site|
  site.config['rss_feeds'].each do |feed|
    feed_name = feed['name']
    feed_url = feed['url']
    
    # Create data arrays
    site.data[feed_name] = []
    
    begin
      xml_content = URI.open(feed_url).read
      doc = REXML::Document.new(xml_content)
      
      REXML::XPath.each(doc, "//item") do |item|
        title = REXML::XPath.first(item, "./title").text rescue "No title"
        link = REXML::XPath.first(item, "./link").text rescue "#"
        pub_date_str = REXML::XPath.first(item, "./pubDate").text rescue Time.now.to_s
        pub_date = Time.parse(pub_date_str) rescue Time.now
        description = REXML::XPath.first(item, "./description").text rescue ""
        excerpt = description.gsub(/<\/?[^>]*>/, "")[0..150]
        
        site.data[feed_name] << {
          'title' => title,
          'link' => link,
          'pubDate' => pub_date,
          'excerpt' => excerpt
        }
      end
    rescue => e
      puts "Error fetching RSS feed #{feed_name}: #{e.message}"
    end
  end
end
