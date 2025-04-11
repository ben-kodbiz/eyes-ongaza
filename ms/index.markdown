---
layout: default
title: Laman Utama
language: ms
---

<div class="columns is-multiline">
  {% for feed in site.rss_feeds %}
    {% assign lang_feed = feed.name | append: '_ms' %}
    {% for item in site.data[lang_feed] limit:5 %}
      <div class="column is-one-third">
        {% include news_item_preview.html item=item source_name=feed.source_name %}
      </div>
    {% endfor %}
  {% endfor %}
</div>