---
title: Tags
---
<h1>{{ page.title }}</h1>

<ul>
  {% for tag in site.tags %}
    <li>
      <a href="{{ tag.url }}">{{ tag.name }}</a>
      ({{ site.posts | where: 'tags', tag.name | size }})
      {{ tag.content | markdownify }}
    </li>
  {% endfor %}
</ul>
