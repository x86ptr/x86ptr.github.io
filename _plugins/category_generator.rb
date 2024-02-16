Jekyll::Hooks.register :posts, :post_write do |post|
    categories = post.data['categories']
  
    if categories && categories.is_a?(Array)
      categories.each do |category|
        category_slug = category.downcase.gsub(' ', '_')
        category_path = "/category/#{category_slug}/"
        category_file_path = File.join('categories', "#{category_slug}.html")
  
        unless File.exist?(category_file_path)
          File.open(category_file_path, 'w') do |file|
            file.puts("---")
            file.puts("layout: category")
            file.puts("category: #{category_slug}")
            file.puts("permalink: #{category_path}")
            file.puts("title: #{category}")
            file.puts("---")
            file.puts(<<-HTML)
            <div id="archives">
              {% for post in site.posts %}
                <div class="archive-group">
                  <div class="archive_head">
                    <i class="fa fa-folder-open"></i>
                    <span>{{ page.title }}</span>
                  </div>
                  {% if post.categories contains '#{category}' %}
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
  