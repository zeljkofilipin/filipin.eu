---
title:  Blog
---
<div class="home">
  <ul class="post-list">
    {% for post in site.posts %}
      <li>
        <span class="post-meta">
          {{ post.date | date: "%Y-%m-%d" }}
          {% for tag in post.tags %}
            <a href="/tags/{{ tag }}">
              {{ tag }}
            </a>
          {% endfor %}
          </span>
        <h2>
          <a class="post-link" href="{{ post.url }}">{{ post.title }}</a>
        </h2>
      </li>
    {% endfor %}
  </ul>
</div>
