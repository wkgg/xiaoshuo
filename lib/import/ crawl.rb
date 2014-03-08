# -*- encoding: utf-8 -*-
agent = Mechanize.new
name = "大主宰"
url = "http://tieba.baidu.com/f/good?kw=" + name
pages = []
page = agent.get(url)
page = page.link_with(:text => /连载/).click
pages << page
# links = page.links
while link = page.link_with(:text => '下一页>')
  page = link.click
  pages << page
end

chapters = []
pages.each do |page|
  chapters << page.links_with(:text => /第.+?章/)
end

puts chapters[0].first.click.search("//div[@class='d_post_content j_d_post_content']")