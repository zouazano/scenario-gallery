require 'open-uri'
require 'nokogiri'
require 'kconv'


class WikiCrawler

  def initialize
    @user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36"
    @domain = "https://murdarmystery.memo.wiki"
    @referer = @domain
  end

  def test
    url = @domain+"/d/%a5%b7%a5%ca%a5%ea%a5%aa%c3%d6%a4%ad%be%ec%a1%ca%bf%cd%bf%f4%ca%cc%a1%cb"
    html = open(url, "r:binary").read
    doc = Nokogiri::HTML(html.toutf8, nil, 'utf-8')
    doc.xpath('//div[contains(@id, "content_block") and contains(@class, "wiki-section-1")]').each do |div|
      div.xpath('div[2]/table[contains(@id, "content_block")]/tbody/tr')&.each_with_index do |tr, i|
        if tr.xpath('td[1]').inner_text == ""
          next
        end
        player_number = div.xpath('div/h3').inner_text&.gsub(/(?<=人)(.*)/, "")&.gsub("人", "")&.tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')
        scenario_writer_name = tr.xpath('td[1]').inner_text
        title = tr.xpath('td[2]').inner_text
        scenario_link = tr.xpath('td[3]/a')&.attribute('href')&.value
        gm = tr.xpath('td[4]').inner_text
        if gm&.tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')&.match(/[+-]?\d+/)&.[](0) == "0"
          gm = false
        else
          gm = true
        end
        play_time = tr.xpath('td[5]').inner_text
        if play_time&.include?("分")
          play_time = play_time&.gsub(/(?<=分)(.*)/, "")&.gsub("分", "")&.tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')
          play_time = (play_time&.to_f/60).round(1)
        elsif play_time&.include?("時間")
          play_time = play_time&.gsub(/(?<=時間)(.*)/, "")&.gsub("時間", "")&.tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')
        else play_time = nil
        end
        if div.xpath("div[2]/table[contains(@id, 'content_block')]/tbody/tr[#{i+2}]/td[1]").inner_text == ""
          summary = div.xpath("div[2]/table[contains(@id, 'content_block')]/tbody/tr[#{i+2}]/td[2]").inner_text
        else
          summary = nil
        end
        tool = tr.xpath('td[6]').inner_text
        price = tr.xpath('td[8]').inner_text
        if price&.include?("無料")
          price = 0
        elsif price&.include?("円")
          price = price.tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')&.match(/[+-]?\d+/)[0]
        else
          price = nil
        end
        #p [scenario_writer_name, title, player_number, scenario_link, gm, price, summary, play_time, tool]

        writer = Writer.find_or_create_by(name: scenario_writer_name)
        scenario = Scenario.find_or_create_by(title: title)
        ScenarioWriter.find_or_create_by(scenario: scenario, writer: writer)
        scenario.update(player_number: player_number, scenario_link: scenario_link, gm: gm, price: price, summary: summary, play_time: play_time, tool: tool)

      end
      sleep 0.1
    end
    p 'hoge'
  end


end
