---
tags:  code docs ruby
title: watir-webdriver Tests Are Pretty Slow at Sauce Labs OnDemand
---
<p><img src="/assets/blowball-300x300.jpg" alt="Random Croatian Countryside" title="Random Croatian Countryside" /></p>
<p>That <a href="/watir-webdriver-and-sauce-labs-ondemand/">Sauce Labs OnDemand</a> thing is pretty nice, but I have noticed something strange. A test suite that takes about 20 minutes to run at my machine, takes 5 hours to run there! Uh-oh. Not what I have expected.</p>
<p>After googling around, and I have found that you can speed up the tests by <a href="http://saucelabs.com/docs/ondemand/additional-config#performance">disabling video, screen shots and advisor</a>. So, I have decided to test how fast are the tests with default settings and with everything disabled.</p>
<p>This simple script visits a few pages. In my test it visits 9 client sites. You can visit <a href="http://www.alexa.com/topsites">top 10 sites</a>, for example, if you want to run the test yourself.</p>

{% highlight ruby %}
require "rubygems"
require "watir-webdriver"
browser = Watir::Browser.new
sites = [
  "google.com",
  "facebook.com",
  # add more sites
]
sites.each do |site|
  browser.goto site
end
browser.close
{% endhighlight %}

<p>Run the script 10 times (or more, if you have the time) to make the results at least a bit statistically significant. Measure the time it takes to run the script at your machine and at Sauce Labs OnDemand, with various operating system and browser combinations.</p>
<p>I got this results.</p>

|location  |os          |browser   |screenshots video advisor|1  |2  |3  |4  |5  |6  |7  |8  |9  |10 |average|median|deviation|min|max|
|----------|------------|----------|-------------------------|---|---|---|---|---|---|---|---|---|---|-------|------|---------|---|---|
|local     |mac 10.7    |firefox 12|FALSE                    |29 |13 |12 |12 |13 |14 |13 |12 |12 |13 |14     |13    |3        |12 |29 |
|sauce     |windows xp  |ie 8      |TRUE                     |61 |56 |56 |56 |55 |59 |56 |59 |56 |61 |58     |56    |2        |55 |61 |
|          |            |          |FALSE                    |53 |54 |53 |54 |51 |53 |55 |52 |52 |53 |53     |53    |1        |51 |55 |
|          |            |firefox 11|TRUE                     |58 |57 |59 |58 |58 |72 |61 |58 |54 |59 |59     |58    |3        |54 |72 |
|          |            |          |FALSE                    |54 |53 |54 |52 |52 |55 |51 |54 |54 |51 |53     |54    |1        |51 |55 |
|          |            |chrome    |TRUE                     |53 |53 |56 |52 |56 |59 |55 |60 |55 |54 |55     |55    |2        |52 |60 |
|          |            |          |FALSE                    |46 |49 |49 |49 |49 |46 |48 |46 |47 |55 |48     |49    |2        |46 |55 |
|          |windows 7   |ie 9      |TRUE                     |59 |61 |83 |61 |55 |60 |60 |56 |61 |55 |61     |60    |4        |55 |83 |
|          |            |          |FALSE                    |53 |81 |58 |59 |53 |52 |59 |59 |73 |62 |61     |59    |7        |52 |81 |
|          |            |firefox 11|TRUE                     |54 |73 |54 |60 |58 |54 |61 |55 |75 |56 |60     |57    |6        |54 |75 |
|          |            |          |FALSE                    |53 |53 |51 |55 |51 |51 |52 |60 |69 |51 |55     |53    |4        |51 |69 |
|          |            |chrome    |TRUE                     |51 |52 |88 |54 |52 |68 |52 |51 |97 |71 |64     |53    |14       |51 |97 |
|          |            |          |FALSE                    |50 |46 |47 |47 |59 |48 |51 |49 |47 |53 |50     |49    |3        |46 |59 |
|          |linux       |firefox 11|TRUE                     |77 |67 |60 |67 |85 |63 |66 |64 |63 |61 |67     |65    |5        |60 |85 |
|          |            |          |FALSE                    |58 |56 |60 |77 |61 |60 |72 |55 |62 |66 |63     |61    |5        |55 |77 |
|          |            |chrome    |TRUE                     |88 |61 |60 |90 |63 |59 |84 |61 |60 |63 |69     |62    |11       |59 |90 |
|          |            |          |FALSE                    |67 |58 |70 |58 |58 |61 |65 |64 |83 |57 |64     |63    |6        |57 |83 |

<p>The script that just opens the browser, visits 9 pages and closes the browser takes 14 seconds on average at my machine. Exactly the same script at Sauce Labs OnDemand takes on average 55-69 seconds with default settings, and 48-64 seconds with everything disabled. So, the script <em>is</em> a bit faster when everything is disabled, but unfortunately, just a bit.</p>
<p>The entire script is here:</p>

{% highlight ruby %}
screenshots_videos_advisors = [true, false]
platforms_browsers_versions = [
    [:XP, "ie", "8"],
    [:XP, "firefox", "11"],
    [:XP, "chrome"],

    [:VISTA, "ie", "9"],
    [:VISTA, "firefox", "11"],
    [:VISTA, "chrome"],

    [:LINUX, "firefox", "11"],
    [:LINUX, "chrome"],
]

def run_all_tests(screenshots_videos_advisors, platforms_browsers_versions)
  screenshots_videos_advisors.each do |screenshot_video_advisor|
    run_screenshot_video_advisor_test(screenshot_video_advisor, platforms_browsers_versions)
  end
end
def run_screenshot_video_advisor_test(screenshot_video_advisor, platforms_browsers_versions)
  platforms_browsers_versions.each do |platform_browser_version|
    run_platform_browser_version_test(screenshot_video_advisor, platform_browser_version)
  end
end
def run_platform_browser_version_test(screenshot_video_advisor, platform_browser_version)
  platform = platform_browser_version[0]
  browser = platform_browser_version[1]
  version = platform_browser_version[2]

  require "benchmark"
  10.times do
    Benchmark.bm do |x|
      x.report(test_name(screenshot_video_advisor, platform, browser, version)) do
        run_sauce_test(screenshot_video_advisor, platform, browser, version)
      end
    end
  end
end
def run_sauce_test(screenshot_video_advisor, platform, browser, version)
  require "watir-webdriver"

  caps = Selenium::WebDriver::Remote::Capabilities.send(browser)
  caps.version = version if version
  caps.platform = platform
  caps[:name] = test_name(screenshot_video_advisor, platform, browser, version)
  caps["record-screenshots"] = screenshot_video_advisor
  caps["record-video"] = screenshot_video_advisor
  caps["sauce-advisor"] = screenshot_video_advisor

  browser = Watir::Browser.new(
    :remote,
    :url => "http://username:api-key@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => caps)

  sites = [
  "google.com",
  "facebook.com",
  # add more sites
  ]
  sites.each do |site|
    browser.goto site
  end

  browser.close

rescue => e
  puts "rescued: #{e.inspect}"
end
def test_name(screenshot_video_advisor, platform, browser, version)
  "#{screenshot_video_advisor}, #{platform}, #{browser}, #{version}"
end

run_all_tests(screenshots_videos_advisors, platforms_browsers_versions)
{% endhighlight %}

<p>You have to replace <code>username</code> and <code>api-key</code> with your username and API key.</p>
<p>The only solution I have found so far is to run the tests in parallel. Report coming soon.</p>
