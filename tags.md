---
layout: page
title: Tags
permalink: /tags/
---
{% for tag in site.tags %}
  <a href="/{{ tag | first | slugize }}/">
     {{ tag | first }}
  </a>
{% endfor %}
