---
layout: default
title: Home
---

<div class="columns is-multiline">
  {% for feed in site.rss_feeds %}
    {% for item in site.data[feed.name] limit:5 %}
      <div class="column is-one-third">
        {% include news_item_preview.html item=item source_name=feed.source_name %}
      </div>
    {% endfor %}
  {% endfor %}
</div>
