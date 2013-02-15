require 'rubygems'
require 'mechanize'
	agent = Mechanize.new


	page = agent.get('https://step1.caledoncard.com/citations/milwaukee.html')
	mcp_form = page.form('CITATION')
	mcp_form.LIC = '373mzf'
	page = agent.submit(mcp_form)
	table = page.search('#Processing table table table tr')
	table_rows = table[1..-3]
		table_rows.each do |tr|
			tr.children[1..-1].each do |child|
			puts child.text.gsub(/\302\240|\s/, '')	
			end
		end
	