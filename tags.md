---
layout: page
title: Tags
permalink: /tags/
published: false
---
{% for tag in site.tags %}
  <a href="/{{ tag | first | slugize }}/">
     {{ tag | first }}
  </a>
{% endfor %}
