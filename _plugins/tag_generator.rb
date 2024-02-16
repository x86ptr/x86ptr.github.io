Jekyll::Hooks.register :posts, :post_write do |post|
    tags = post.data['tags']
  
    if tags && tags.is_a?(Array)
      tags.each do |tag|
        tag_slug = tag.downcase.gsub(' ', '_')
        tag_path = "/tag/#{tag_slug}/"
        tag_file_path = File.join('tags', "#{tag_slug}.html")
  
        unless File.exist?(tag_file_path)
          File.open(tag_file_path, 'w') do |file|
            file.puts("---")
            file.puts("layout: tag")
            file.puts("tag: #{tag_slug}")
            file.puts("permalink: #{tag_path}")
            file.puts("title: #{tag}")
            file.puts("---")
            file.puts(<<-HTML)
            <div id="archives">
              {% for post in site.posts %}
                <div class="archive-group">
                  <div class="archive_head">
                    <i class="fa fa-tag"></i>
                    <span>{{ page.title }}</span>
                  </div>
                  {% if post.tags contains '#{tag}' %}
                    <article class="archive-item">
                      <span><a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a></span>
                      <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
                    </article>
                  {% endif %}
                </div>
              {% endfor %}
            </div>
          HTML
          end
        end
      end
    end
  end
  