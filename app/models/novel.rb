# ecoding: utf-8
class Novel < ActiveRecord::Base
  has_many :chapters

  def get_chapters
    url =self.link
    chapter_links = get_chapters_links(url)
    chapter_links.each do |links|
      links.each do |link|
        title = link.text
        id = /第(.+?)章/.match(title)[1]
        if node = link.click.search("//div[@class='d_post_content j_d_post_content ']").first
          content = node.text
          @chapter = self.chapters.create(title:title, chapter_id: id, content: content)
        end
      end
    end
  end


  def get_chapters_links url
    agent = Mechanize.new
    page = agent.get(url)
    page = page.link_with(:text => /连载|更新/).click
    chapter_links = []
    chapter_links << page.links_with(:text => /第.+?章/)
    while url = page.link_with(:text => /下一页/) 
      page = url.click
      chapter_links << page.links_with(:text => /第.+?章/)
    end
    chapter_links
  end
end
