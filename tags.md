---
layout: page
tags:   page
title:  Tags
---
{% for tag in site.tags %}
  <a href="/{{ tag | first | slugize }}">
     {{ tag | first }}
  </a>
{% endfor %}
